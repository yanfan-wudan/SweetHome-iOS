//
//  MyDynamicViewController.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "MyDynamicViewController.h"

@interface MyDynamicViewController ()

@end

@implementation MyDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupNavigationBar {
    self.wdNavigationBar.backgroundColor = RGBCOLOR(66, 146, 183);
    [self.wdNavigationBar.centerButton setTitle:@"我的动态" forState:UIControlStateNormal];
    [self.wdNavigationBar.centerButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}


@end
