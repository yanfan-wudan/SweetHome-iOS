//
//  AppDelegate+Initialization.m
//  SweetHome
//
//  Created by wudan on 2018/11/30.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "AppDelegate+Initialization.h"
#import "RootTabBarController.h"

@implementation AppDelegate (Initialization)

- (void)setupWindowAndRootViewController {
    
    self.window                              = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor              = UIColor.whiteColor;
    RootTabBarController *rootViewController = [[RootTabBarController alloc] init];
    self.window.rootViewController           = rootViewController;
    [self.window makeKeyAndVisible];
}

@end
