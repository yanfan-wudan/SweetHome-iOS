//
//  MineOrderOperationView.m
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "MineOrderOperationView.h"
#import "UIButton+Addition.h"

@interface MineOrderOperationView ()

@property (nonatomic, strong) UIView *topView;

@end

@implementation MineOrderOperationView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    
    self.topView = [[UIView alloc] init];
    self.topView.backgroundColor = UIColor.lightGrayColor;
    self.topView.frame = CGRectMake(0, 0, kScreenWidth, 0.5);
    [self addSubview:self.topView];
    
    
    self.backgroundColor = UIColor.whiteColor;
    NSArray *titleArray = @[@"待接单", @"待付款", @"待完工", @"待评价"];
    NSArray *imageArray = @[@"待接单", @"待付款", @"待完工", @"待评价"];
    
    for (int i = 0; i< titleArray.count; ++i) {
        UIButton *button               = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame                   = CGRectMake(kScreenWidth/4 * i,
                                                    0,
                                                    kScreenWidth/4,
                                                    60 * kScreenRate);
        button.titleLabel.font         = [UIFont systemFontOfSize:15];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [button setTitleColor:UIColor.orangeColor forState:UIControlStateNormal];
        button.titleLabel.numberOfLines = 2;
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button wd_buttonLayoutWithSpace:15 layoutStyle:UIButtonLayoutStyleTop];
        button.tag = 100 + i;
        [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

- (void)buttonTouched:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(mineOrderOperationView:didselectedType:)]) {
        [self.delegate mineOrderOperationView:self didselectedType:sender.tag-100];
    }
}


@end
