//
//  DetailsViewController.h
//  Instagram
//
//  Created by estherb on 7/11/19.
//  Copyright © 2019 estherb. All rights reserved.
//

#import "Post.h"
#import "Parse/Parse.h"


@interface DetailsViewController : UIViewController
- (IBAction)cancel:(id)sender;
- (IBAction)share:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;
@property (weak, nonatomic) IBOutlet UIImageView *detailsImageView;
@property (strong, nonatomic) IBOutlet UITextView *Caption;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) Post* post;

@end




