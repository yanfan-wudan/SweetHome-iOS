//
//  LoginViewController.m
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setupNavigationBar {
    self.wdNavigationBar.backgroundColor = RGBCOLOR(66, 146, 183);
    [self.wdNavigationBar.centerButton setTitle:@"用户登陆" forState:UIControlStateNormal];
    [self.wdNavigationBar.centerButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    
}

@end
