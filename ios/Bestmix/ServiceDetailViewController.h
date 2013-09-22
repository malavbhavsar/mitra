//
//  ServiceDetailViewController.h
//  Bestmix
//
//  Created by Dooyum Malu on 9/21/13.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class Service;

@interface ServiceDetailViewController : UITableViewController

@property (strong, nonatomic) Service *service;

@end
