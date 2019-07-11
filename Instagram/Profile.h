//
//  Profile.h
//  Instagram
//
//  Created by estherb on 7/10/19.
//  Copyright © 2019 estherb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "PostCollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *username;
@property (strong, nonatomic) IBOutlet UILabel *bioLabel;
@property (strong, nonatomic) IBOutlet UILabel *editButton;
@property (strong, nonatomic) PFUser *user;

@end

NS_ASSUME_NONNULL_END
