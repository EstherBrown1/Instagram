//
//  ViewController.h
//  Instagram
//
//  Created by estherb on 7/8/19.
//  Copyright © 2019 estherb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
    @property (strong, nonatomic) IBOutlet UITextField *userNameField;
    @property (strong, nonatomic) IBOutlet UITextField *passwordField;
    @property (strong, nonatomic) IBOutlet UITextField *emailField;
    @property (strong, nonatomic) IBOutlet UIButton *signButton;
    @property (strong, nonatomic) IBOutlet UIButton *logoutButton;
    
    @end
