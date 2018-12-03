//
//  MineHeaderView.m
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "MineHeaderView.h"
#import "MineOperationView.h"

@interface MineHeaderView ()

// 未登录
@property (nonatomic, strong) UIButton *loginButton;

// 已登录
@property (nonatomic, strong) UIImageView    *headerImageView;        //！头像
@property (nonatomic, strong) UILabel        *nickNameLabel;          //！昵称
@property (nonatomic, strong) UIImageView    *levelLogImageView;      //！级别标志 👑
@property (nonatomic, strong) UILabel        *occupationLabel;        //！职业名称
@property (nonatomic, strong) UILabel        *authenticationLabel;    //！是否验证
@property (nonatomic, strong) UILabel        *levelLabel;             //！级别
@property (nonatomic, strong) UILabel        *currentExperienceLabel; //！当前经验值
@property (nonatomic, strong) UIProgressView *experienceProgressView; //！经验进度
@property (nonatomic, strong) UILabel        *introduceLabel;         //！简介
@property (nonatomic, strong) UIButton       *invateFriendButton;     //！邀请好友

// 底部4个按钮
@property (nonatomic, strong) MineOperationView *bottomOperationView;

@end

@implementation MineHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = RGBCOLOR(66, 146, 183);
        [self setupBottomView];
    }
    return self;
}

- (void)setupIfLogin {
    
}

- (void)setupIfWithoutLogin {
    
    self.headerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qq"]];
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.headerImageView];
    
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_centerY).mas_offset(-15 * kScreenRate);
        make.centerX.mas_equalTo(self);
        make.height.with.mas_equalTo(80 * kScreenRate);
    }];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginButton setTitle:@"登 陆" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.loginButton.backgroundColor = UIColor.orangeColor;
    self.loginButton.layer.borderColor = UIColor.whiteColor.CGColor;
    self.loginButton.layer.borderWidth = 1.5;
    self.loginButton.layer.cornerRadius = 40 * kScreenRate * 0.5;
    [self.loginButton addTarget:self action:@selector(loginButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.loginButton];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.mas_centerY).mas_offset(15 * kScreenRate);
        make.height.mas_equalTo(40 * kScreenRate);
        make.width.mas_equalTo(kScreenWidth * 0.45);
    }];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
     self.bounds = CGRectMake(0, 0, kScreenWidth, 260 * kScreenRate);
}

- (void)setupBottomView {
    self.bottomOperationView = [[MineOperationView alloc] init];
    [self addSubview:self.bottomOperationView];
    
    [self.bottomOperationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.mas_equalTo(self);
        make.height.mas_equalTo(60 * kScreenRate);
    }];
}

- (void)loginButtonTouched:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate mineHeaderView:self loginButtonTouched:sender];
    }
}

@end
