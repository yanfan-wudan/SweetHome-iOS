//
//  MineOperationView.m
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "MineOperationView.h"

@implementation MineOperationView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    NSArray *titleArray = @[@"0\n关注", @"0\n收藏", @"0\n案例", @"0\n评价"];
    
    for (int i = 0; i< titleArray.count; ++i) {
        UIButton *button               = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame                   = CGRectMake(kScreenWidth/4 * i,
                                                    0,
                                                    kScreenWidth/4,
                                                    60 * kScreenRate);
        button.titleLabel.font         = [UIFont systemFontOfSize:15];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        button.titleLabel.numberOfLines = 2;
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:button];
    }
}

@end
