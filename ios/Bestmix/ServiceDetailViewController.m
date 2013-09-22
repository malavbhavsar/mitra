//
//  ServiceDetailViewController.m
//  Bestmix
//
//  Created by Dooyum Malu on 9/21/13.
//
//

#import "ServiceDetailViewController.h"
#import "Service.h"
#import "User.h"
#import "NSDate+LocalTime.h"
#import "UserViewController.h"

@interface ServiceDetailViewController ()

@end

@implementation ServiceDetailViewController

@synthesize service = _service;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = YES;
    
    if (_service) {
        self.title = [NSString stringWithFormat:@"%@", _service.userid];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *controller = [segue destinationViewController];
    if ([controller isKindOfClass:[UserViewController class]]) {
        UserViewController *userVC = (UserViewController *)controller;
        userVC.user = _service.user;
    }
}
#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    UILabel *label;
    
    if (indexPath.row == 0) {
        cell = [tv dequeueReusableCellWithIdentifier:@"ServiceContent"];
        
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        [label setLineBreakMode:UILineBreakModeWordWrap];
        [label setMinimumFontSize:14];
        [label setNumberOfLines:0];
        [label setFont:[UIFont systemFontOfSize:14]];
        [label setTag:1];
        [[cell contentView] addSubview:label];
        
    } else {
        cell = [tv dequeueReusableCellWithIdentifier:@"Provider"];
    }
    
    if (indexPath.row == 0) {
        CGSize constraint = CGSizeMake(320.0f - (5.0f * 2), 20000.0f);
        
        NSString *name = [NSString stringWithFormat:@"%@", _service.name];
        
        CGSize size = [name sizeWithFont:[UIFont systemFontOfSize:14]
                         constrainedToSize:constraint
                             lineBreakMode:UILineBreakModeWordWrap];
        
        if (!label)
            label = (UILabel *)[cell viewWithTag:1];
        if (_service.brief_description)
            label.text = _service.brief_description;
        else
            label.text = @"";
        
        [label setFrame:CGRectMake(5.0f, 5.0f, 320.0f - (5.0f * 2), 300)];
        
    } else {
        cell.textLabel.text = _service.user.email;
        cell.detailTextLabel.text =
        [NSDateFormatter localizedStringFromDate:[_service.time_from localTime]
                                       dateStyle:NSDateFormatterMediumStyle
                                       timeStyle:NSDateFormatterMediumStyle];
    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    /*if (indexPath.row == 0) {
        CGSize constraint = CGSizeMake(320.0f - (5.0f * 2), 20000.0f);
        
        CGSize size = [_service.brief_description sizeWithFont:[UIFont systemFontOfSize:14]
                                  constrainedToSize:constraint
                                      lineBreakMode:UILineBreakModeWordWrap];
        
        return MAX(size.height, 44.0f) + 5.0f * 2;
    }
    
    return 44.0;*/
    
    return 300.f;
}

@end
