//
//  HomeFeed.m
//  
//
//  Created by estherb on 7/11/19.
//

#import "HomeFeed.h"

@interface HomeFeed ()

@end

#import "HomeFeed.h"
#import "Parse/Parse.h"
#import "Post.h"
#import "PostViewCell.h"
#import "ComposeViewController.h"
#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface HomeFeed () <ComposeViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation HomeFeed

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight= 650;

    
//    PFQuery *postQuery = [Post query];
//    [postQuery orderByDescending:@"createdAt"];
//    [postQuery includeKey:@"author"];
//    postQuery.limit = 20;
    
    [self fetchData];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchData) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
}

-(void) fetchData{
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;
    
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            // do something with the data fetched
            self.posts = posts;
            [self.tableView reloadData];
        }
        else {
            // handle error
            NSLog(@"%@", error.localizedDescription);
        }
        [self.refreshControl endRefreshing];
    }];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"composeSegue"]) {
        UINavigationController *navigationController = [segue destinationViewController];
        ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
        composeController.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"detailsSegue"]) {
        DetailsViewController* detailsController = [segue destinationViewController];
        
        UITableViewCell *tappedCell = sender;
        NSIndexPath *indexPath =  [self.tableView indexPathForCell:tappedCell];
        Post *post = self.posts[indexPath.row];
        detailsController.post = post;
        
    }
}

- (IBAction)logout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        if (error) {
            NSLog(@"%@", error.localizedDescription);
        } else {
            [self performSegueWithIdentifier:@"logoutSegue" sender:nil];
        }
    }];
}

- (IBAction)addPicture:(id)sender {
    [self performSegueWithIdentifier:@"composeSegue" sender:nil];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    Post *post = self.posts[indexPath.row];
    cell.userLabel.text = post[@"caption"];
//    [cell setPost:post];
    PFFileObject* image = post[@"image"];
    
    cell.posterView.image= nil;
    NSString *URL= post.image.url;
    NSURL *imageURL= [NSURL URLWithString:URL];
    
    [cell.posterView setImageWithURL:imageURL];
    
    
   
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (void)didPost {
    [self fetchData];
    [self.tableView reloadData];
    
}
@end

