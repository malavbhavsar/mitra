#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ServicesViewController : UITableViewController
{
@protected
    NSUInteger _currentPage;
    NSUInteger _totalPages;
    NSUInteger _totalCount;
    
    NSFetchedResultsController *_fetchedRC;
    NSFetchedResultsController *_filteredFetchedRC;
}

@property (nonatomic) NSUInteger currentPage;
@property (nonatomic) NSUInteger totalPages;
@property (nonatomic) NSUInteger totalCount;

- (void)becomeReachable;
- (void)becomeUnreachable;

- (UITableViewCell *)serviceCellForIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)loadingCell;

- (void)fetch;
- (void)fetchFromWebApi;
- (void)fetchFromCoreData;
- (void)clearServices;

@end
