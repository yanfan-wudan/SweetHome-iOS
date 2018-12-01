//
//  MineViewController.m
//  SweetHome
//
//  Created by wudan on 2018/11/30.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@property (nonatomic, copy) NSArray<NSString *> *titleArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)initializationDefaultData {
    self.titleArray = @[@"工匠认证", @"我的积分", @"我的小窝", @"二手商品", @"用户反馈", @"系统设置"];
}

- (void)setupSubviews {
    self.wdNavigationBar.backgroundColor = RGBCOLOR(66, 146, 183);
    [self.wdNavigationBar.leftButton setTitle:@" 签到 " forState:UIControlStateNormal];
    [self.wdNavigationBar.leftButton setImage:nil forState:UIControlStateNormal];
    [self.wdNavigationBar.leftButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.wdNavigationBar.leftButton.layer.borderColor = UIColor.whiteColor.CGColor;
    self.wdNavigationBar.leftButton.layer.cornerRadius = 5;
    self.wdNavigationBar.leftButton.layer.borderWidth = 1;
}

@end
