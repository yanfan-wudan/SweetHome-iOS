//
//  RootTabBarController.m
//  SweetHome
//
//  Created by wudan on 2018/11/30.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "RootTabBarController.h"
#import "RootNavigationController.h"
#import "UIImage+Addition.h"

#import "HomeViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupController:@"HomeViewController"
                titleName:@"首页"
          normalImageName:@"Tabbar_task"
        selectedImageName:@"Tabbar_task_Sel"];
    
    [self setupController:@"DecorationServiceViewController"
                titleName:@"装修服务"
          normalImageName:@"Tabbar_task"
        selectedImageName:@"Tabbar_task_Sel"];
    
    [self setupController:@"HomeCareViewController"
                titleName:@"家居服务"
          normalImageName:@"Tabbar_task"
        selectedImageName:@"Tabbar_task_Sel"];
    
    [self setupController:@"ShoppingMallViewController"
                titleName:@"商城"
          normalImageName:@"Tabbar_task"
        selectedImageName:@"Tabbar_task_Sel"];
    
    [self setupController:@"MineViewController"
                titleName:@"我的"
          normalImageName:@"Tabbar_task"
        selectedImageName:@"Tabbar_task_Sel"];
}

- (void)setupController:(NSString *)controllerName
              titleName:(NSString *)titleName
        normalImageName:(NSString *)normalImageName
      selectedImageName:(NSString *)selectedImageName {
    
    Class class                         = NSClassFromString(controllerName);
    UIViewController *controller        = [[class alloc] init];
    RootNavigationController *nav       = [[RootNavigationController alloc] initWithRootViewController:controller];
    controller.tabBarItem.title         = titleName;
    controller.tabBarItem.image         = [UIImage wd_initTempModeImageWithName:normalImageName];
    controller.tabBarItem.selectedImage = [UIImage wd_initTempModeImageWithName:selectedImageName];
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColor.orangeColor} forState:UIControlStateSelected];
    NSLog(@"%@", controllerName);
    [self addChildViewController:nav];
}

@end
