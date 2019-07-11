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
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;
@property (weak, nonatomic) IBOutlet UIImageView *detailsImageView;
@property (strong, nonatomic) IBOutlet UITextView *Caption;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (strong, nonatomic) Post* post;

@end
