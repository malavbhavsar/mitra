//
//  ReviewDetailViewController.m
//  Bestmix
//
//  Created by Dooyum Malu on 9/21/13.
//
//

#import "ReviewDetailViewController.h"
#import "Review.h"
#import "User.h"
#import "NSDate+LocalTime.h"
#import "UserViewController.h"

@interface ReviewDetailViewController ()

@end

@implementation ReviewDetailViewController

@synthesize review = _review;

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

    if (_review) {
        self.title = [NSString stringWithFormat:@"%@", _review.reviewerid];
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
        userVC.user = _review.user;
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
        cell = [tv dequeueReusableCellWithIdentifier:@"ReviewContent"];
        
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        [label setLineBreakMode:UILineBreakModeWordWrap];
        [label setMinimumFontSize:14];
        [label setNumberOfLines:0];
        [label setFont:[UIFont systemFontOfSize:14]];
        [label setTag:1];
        [[cell contentView] addSubview:label];
        
    } else {
        cell = [tv dequeueReusableCellWithIdentifier:@"Reviewer"];
    }
    
    if (indexPath.row == 0) {
        CGSize constraint = CGSizeMake(320.0f - (5.0f * 2), 20000.0f);
        
        NSString *rating = [NSString stringWithFormat:@"%@", _review.rating];
        
        CGSize size = [rating sizeWithFont:[UIFont systemFontOfSize:14]
                                constrainedToSize:constraint
                                    lineBreakMode:UILineBreakModeWordWrap];
        
        if (!label)
            label = (UILabel *)[cell viewWithTag:1];
        if (_review.comment)
            label.text = _review.comment;
        else
            label.text = @"";
        
        [label setFrame:CGRectMake(5.0f, 5.0f, 320.0f - (5.0f * 2), MAX(size.height, 44.0f))];
        
    } else {
        cell.textLabel.text = _review.user.email;
        cell.detailTextLabel.text =
        [NSDateFormatter localizedStringFromDate:[_review.reviewdate localTime]
                                       dateStyle:NSDateFormatterMediumStyle
                                       timeStyle:NSDateFormatterMediumStyle];
    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.row == 0) {
        CGSize constraint = CGSizeMake(320.0f - (5.0f * 2), 20000.0f);
        
        CGSize size = [_review.comment sizeWithFont:[UIFont systemFontOfSize:14]
                                constrainedToSize:constraint
                                    lineBreakMode:UILineBreakModeWordWrap];
        
        return MAX(size.height, 44.0f) + 5.0f * 2;
    }
    
    return 44.0;
}

@end
