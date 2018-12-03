//
//  MyWorkOrderViewController.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "MyWorkOrderViewController.h"

#import "WDTabLayout.h"

#import "MyOrderAllViewController.h"

@interface MyWorkOrderViewController ()

@property (nonatomic, strong) WDTabLayout *tabLayout;

@end

@implementation MyWorkOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setupNavigationBar {
    self.wdNavigationBar.backgroundColor = RGBCOLOR(66, 146, 183);
    [self.wdNavigationBar.centerButton setTitle:@"我的工单" forState:UIControlStateNormal];
    [self.wdNavigationBar.centerButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}

- (void)setupSubviews {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i< 7; ++i) {
        MyOrderAllViewController *vc = [[MyOrderAllViewController alloc] init];
        [array addObject:vc];
    }
    
    self.tabLayout = [[WDTabLayout alloc] initWithShowStyle:WDTabLayoutStyle_buttomIndicate
                                                 titleArray:@[@"全部", @"待接单", @"待付款", @"待完工", @"待评价", @"已取消", @"已完工"]
                                            viewControllers:array
                                            backgroundColor:UIColor.whiteColor
                                              indicateColor:UIColor.grayColor
                                                normalColor:UIColor.grayColor
                                              selectedColor:UIColor.redColor
                                                  titleSize:15
                                             indicateHeight:1];
    [self.view addSubview:self.tabLayout];
}

- (void)setupSubviewsConstraints {
    [self.tabLayout mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view);
        make.top.mas_equalTo(self.wdNavigationBar.mas_bottom);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view.mas_bottom);
        }
    }];
}

@end
