
//
//  AllServicesViewController.m
//  Bestmix
//
//  Created by Dooyum Malu on 9/22/13.
//
//

#import <CoreData/CoreData.h>
#import "AllServicesViewController.h"
#import "Config.h"
#import "Service.h"
#import "UIColor+Hex.h"
#import "MBProgressHUD.h"
#import "WebApiClient.h"
#import "SVPullToRefresh.h"
#import "UIAlertView+SimpleAlert.h"
#import "CoreData+MagicalRecord.h"
#import "ServiceDetailViewController.h"
#import "NSDate+LocalTime.h"
#import "ReachabilityManager.h"

@interface AllServicesViewController ()

@property (strong, nonatomic) WebApiClient *client;

- (void)clearServicessInContext:(NSManagedObjectContext *)context;

@end

@implementation AllServicesViewController

@synthesize client = _client;

#pragma mark UIViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _currentPage = 1;
    [self fetch];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *controller = [segue destinationViewController];
    if ([controller isKindOfClass:[ServiceDetailViewController class]]) {
        ServiceDetailViewController *detailVC = (ServiceDetailViewController *)controller;
        Service *service = [_fetchedRC objectAtIndexPath:self.tableView.indexPathForSelectedRow];
        detailVC.service = service;
    }
}

#pragma mark ServicesViewController

- (void)fetchFromWebApi
{
    [super fetchFromWebApi];
    NSLog(@"fetchFromWebApi - currentPage: %d", _currentPage);
    
    if (![ReachabilityManager reachable]) {
        NSLog(@"unable to fetch");
        return;
    }
    
    if ([self.tableView numberOfRowsInSection:0] == 0 && ![MBProgressHUD HUDForView:self.view]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"Loading...";
    }
    
    if (!_client)
        self.client = [WebApiClient new];
    
    //NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys: [NSNumber numberWithInteger:_currentPage], @"page", nil];
    
    NSDictionary *params = nil;
    
    [_client getPath:@"services"
          parameters:params
             success:^(AFHTTPRequestOperation *operation, id response) {
                 NSLog(@"request headers: %@", operation.request.allHTTPHeaderFields);
                 NSLog(@"response headers: %@", operation.response.allHeaderFields);
                 NSLog(@"response: %@", response);
                 if (_currentPage == 1)
                     [self clearServices];
                                  
                 id elem = (NSArray *)response;
                 if (elem && [elem isKindOfClass:[NSArray class]]) {
                     [MagicalRecord saveInBackgroundWithBlock:^(NSManagedObjectContext *context) {
                         // [Post MR_importFromArray:elem inContext:context]; // crash (issue 180)
                         for (NSDictionary *dict in elem) {
                             @autoreleasepool {
                                 id elem = dict;
                                 if (dict && [dict isKindOfClass:[NSDictionary class]]) {
                                     Service *service = [Service MR_findFirstByAttribute:@"serviceID"
                                                                      withValue:[dict objectForKey:@"id"]
                                                                      inContext:context];
                                     if (service) {
                                         [[service MR_inContext:context] MR_importValuesForKeysWithObject:dict];
                                     } else {
                                         service = [Service MR_importFromObject:dict inContext:context];
                                     }
                                     //NSLog(@"post: %@", post);
                                 }
                             }
                             
                             // If you import large number of posts at once, you should update the table
                             // while importing.
                             //if (count % 20 == 0) {
                             //    [context MR_saveNestedContexts]; // save them to SQLite (issue 187)
                             //    dispatch_async(dispatch_get_main_queue(), ^{
                             //        [self.tableView.pullToRefreshView stopAnimating];
                             //        [self fetchFromCoreData:NO];
                             //    });
                             //}
                         }
                         //TODO(dooyum) Delete all expired service posts
                         /*[Service MR_deleteAllMatchingPredicate:[NSPredicate predicateWithFormat:
                                                              @"expire = %@",
                                                              [NSNumber numberWithBool:YES]]
                                                   inContext:context];*/
                         [context MR_saveNestedContexts]; // save them to SQLite (issue 187)
                         
                     } completion:^{
                         dispatch_async(dispatch_get_main_queue(), ^{
                             NSLog(@"core data saved");
                             [MBProgressHUD hideHUDForView:self.view animated:YES];
                             [self.tableView.pullToRefreshView stopAnimating];
                             [self fetchFromCoreData];
                             [self.tableView reloadData];
                         });
                     }];
                 } else {
                     [MBProgressHUD hideHUDForView:self.view animated:YES];
                     [self.tableView.pullToRefreshView stopAnimating];
                     [self fetchFromCoreData];
                     [self.tableView reloadData];
                 }
             }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"error %@ %@ statusCode: %d", error.localizedDescription, error.userInfo, operation.response.statusCode);
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 [self.tableView.pullToRefreshView stopAnimating];
                 
                 [UIAlertView simpleAlertWithTitle:@"Network Error"
                                           message:error.localizedDescription];
             }];
}

- (void)fetchFromCoreData
{
    [super fetchFromCoreData];
    NSLog(@"fetchFromCoreData");
    
    _fetchedRC = [Service MR_fetchAllGroupedBy:nil
                              withPredicate:nil
                                   sortedBy:@"time_from"
                                  ascending:NO];
    
    [_fetchedRC performFetch:nil];
    [self.tableView reloadData];
}

- (void)clearServices
{
    [super clearServices];
    
    [self clearServicesInContext:[NSManagedObjectContext MR_defaultContext]];
}

- (UITableViewCell *)serviceCellForIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super serviceCellForIndexPath:indexPath];
    
    id <NSFetchedResultsSectionInfo> sectionInfo =
    [[_fetchedRC sections] objectAtIndex:0];
    NSInteger count = [sectionInfo numberOfObjects];
    if (indexPath.row < count) {
        Service *service = [_fetchedRC objectAtIndexPath:indexPath];
        
        //NEW
        UIView *cardView;
        
        CGRect frame = CGRectMake(0, 0, 320, 460);
        cardView = [[UIView alloc] initWithFrame:frame];
        cardView.tag = 1;
        cardView.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:cardView];
        
        UIView *serviceCardView;
        
        frame = CGRectMake(10, 10, 300, 400);
        serviceCardView = [[UIView alloc] initWithFrame:frame];
        serviceCardView.tag = 2;
        serviceCardView.backgroundColor = [UIColor whiteColor];
        [cardView addSubview:serviceCardView];
        
        UIImageView *serviceImageView;
        
        frame = CGRectMake(0, 0, 300, 150);
        serviceImageView = [[UIImageView alloc] initWithFrame:frame];
        
  //      NSURL * imageURL = [NSURL URLWithString:@"http://hrservices.sharedhr.com/Portals/149913/images/Bay%20Area%20human%20resources.jpg"];
        NSURL * imageURL = [NSURL URLWithString:service.picture_url];
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage * image = [UIImage imageWithData:imageData];
        
        serviceImageView.image = image;
        
        [serviceCardView addSubview:serviceImageView];
        
        UILabel *nameLabel;
        
        frame = CGRectMake(10, 160, 290, 50);
        nameLabel = [[UILabel alloc] initWithFrame:frame];
        nameLabel.text = service.name;
        nameLabel.font = [UIFont fontWithName:@"Helvetica" size:60];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [serviceCardView addSubview:nameLabel];
        
        UILabel *descriptionLabel;
        
        frame = CGRectMake(10, 190, 290, 100);
        descriptionLabel = [[UILabel alloc] initWithFrame:frame];
        descriptionLabel.text = service.brief_description;
        descriptionLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
        descriptionLabel.textAlignment = NSTextAlignmentCenter;
        [serviceCardView addSubview:descriptionLabel];
        
        UILabel *serviceChargeLabel;
        
        frame = CGRectMake(0, 315, 320, 45);
        serviceChargeLabel = [[UILabel alloc] initWithFrame:frame];
        serviceChargeLabel.text = [NSString stringWithFormat:@"$%@", service.fee];
        serviceChargeLabel.font = [UIFont fontWithName:@"Helvetica" size:40];
        serviceChargeLabel.textColor = [UIColor orangeColor];
        serviceChargeLabel.textAlignment = NSTextAlignmentCenter;
        [serviceCardView addSubview:serviceChargeLabel];
        
        UIButton *connectButton;
        
        frame = CGRectMake(130, 325, 200, 50);
        serviceChargeLabel = [[UILabel alloc] initWithFrame:frame];
        connectButton.titleLabel.text = @"CONNECT";
        [serviceCardView addSubview:connectButton];
    }
    
    return cell;
}

#pragma mark Local Methods

- (void)clearServicesInContext:(NSManagedObjectContext *)context
{
    [super clearServices];
    
    for (Service *service in [Service MR_findAll]) {
    }
    [context MR_saveNestedContexts];
    
    NSError *error;
    [_fetchedRC performFetch:&error];
}

@end
