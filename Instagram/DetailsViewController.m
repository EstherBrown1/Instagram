#import "DetailsViewController.h"
#import "HomeFeed.h"
#import "UIImageView+AFNetworking.h"


@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailsImageView.layer.cornerRadius = 17.5f;
    
    self.detailsImageView.image = nil;
    NSString *URL = self.post.image.url;
    NSURL *imageURL= [NSURL URLWithString:URL];
    
    [self.detailsImageView setImageWithURL:imageURL];
//    }];

    //set our caption
    self.Caption.text = self.post.caption;
    
    //begin formatting and setting our relative timestamps
    NSDate *createdAt = [self.post createdAt];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *createdAtString = @"";
    // Configure output format
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [formatter setDateFormat:@"E MMM d HH:mm:ss Z y"];
    NSDate *todayDate = [NSDate date];
    //calculate time since posted to now
    double ti = [createdAt timeIntervalSinceDate:todayDate];
    ti = ti * -1;
    //NSLog(@"%f",ti);
    if (ti < 60) {
        int diff = ti;
        createdAtString = [NSString stringWithFormat:@"%ds", diff];
    } else if (ti < 3600) {
        int diff = round(ti / 60);
        createdAtString = [NSString stringWithFormat:@"%dm", diff];
    } else if (ti < 86400) {
        int diff = round(ti / 60 / 60);
        createdAtString = [NSString stringWithFormat:@"%dh", diff];
    } else if (ti < 2629743) {
        int diff = round(ti / 60 / 60 / 24);
        createdAtString = [NSString stringWithFormat:@"%dd", diff];
    } else {
        createdAtString = [formatter stringFromDate:createdAt];
    }
    self.timeStampLabel.text = createdAtString;
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

