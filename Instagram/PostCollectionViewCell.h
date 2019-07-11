//
//  PostCollectionViewCell.h
//  Instagram
//
//  Created by estherb on 7/11/19.
//  Copyright © 2019 estherb. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *postImageView;

@property (strong, nonatomic) Post *post;
@end

NS_ASSUME_NONNULL_END
