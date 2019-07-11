//
//  HomeFeed.h
//  
//
//  Created by estherb on 7/11/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeFeed : UITableViewController
@property(strong, nonatomic)NSArray *posts;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)logout:(id)sender;
- (IBAction)addPicture:(id)sender;

@end

NS_ASSUME_NONNULL_END
