//
//  ViewController.m
//  Instagram
//
//  Created by estherb on 7/8/19.
//  Copyright © 2019 estherb. All rights reserved.
//

#import "ViewController.h"
#import "Parse/Parse.h"
//have FeedViewController

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.userNameField.text = @"myUsername";
    self.passwordField.text = @"myPassword";
    self.emailField.text = @"myEmail@email.com";
}


@end
