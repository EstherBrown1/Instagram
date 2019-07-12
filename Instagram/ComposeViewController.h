//
//  ComposeViewController.h
//  Instagram
//
//  Created by estherb on 7/10/19.
//  Copyright © 2019 estherb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewControllerDelegate
- (void)didPost;

@end

@interface ComposeViewController : UIViewController<UIImagePickerControllerDelegate>
@property(strong, nonatomic) UIImage *originalImage;
@property(strong, nonatomic) UIImage *editedImage;
@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;

- (IBAction)takePicture:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)share:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *uploadImage;
@end
NS_ASSUME_NONNULL_END
