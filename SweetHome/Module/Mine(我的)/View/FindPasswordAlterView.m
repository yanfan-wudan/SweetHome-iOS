//
//  FindPasswordAlterView.m
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "FindPasswordAlterView.h"
#import "UIView+Addition.h"

@interface FindPasswordAlterView ()

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *topLine;

@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIView *passwordBottomView;
@property (nonatomic, strong) UIImageView *remindLogImageView;
@property (nonatomic, strong) UILabel *remindLabel;

@property (nonatomic, strong) UITextField *againPasswordTextField;
@property (nonatomic, strong) UIView *againPasswordBottomView;

@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UIView *centerLine;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *sureButton;

@end

@implementation FindPasswordAlterView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
        [self setupSubviewsConstraints];
    }
    return self;
}

- (void)setupView {
    
    self.containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = [UIColor whiteColor];
    self.containerView.backgroundColor = UIColor.whiteColor;
    self.containerView.layer.cornerRadius = 10;
    [self addSubview:self.containerView];
    
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"重置密码";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textColor = [UIColor blackColor];
    [self.containerView addSubview:self.titleLabel];
    
    self.topLine = [self lineWithBackGroundColor:UIColor.cyanColor];
    [self.containerView addSubview:self.topLine];
    
    self.passwordTextField = [self textFiledWithPlaceholder:@"请输入新密码" leftImageName:@"userCenter"];
    [self.containerView addSubview:self.passwordTextField];
    
    self.passwordBottomView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self.containerView addSubview:self.passwordBottomView];
    
    self.againPasswordTextField = [self textFiledWithPlaceholder:@"请输入重复输入密码" leftImageName:@"userCenter"];
    [self.containerView addSubview:self.againPasswordTextField];
    
    self.againPasswordBottomView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self.containerView addSubview:self.againPasswordBottomView];
    
    self.bottomLine = [self lineWithBackGroundColor:UIColor.lightGrayColor];
    [self.containerView addSubview:self.bottomLine];
    
    self.centerLine = [self lineWithBackGroundColor:UIColor.lightGrayColor];
    [self.containerView addSubview:self.centerLine];
    
    self.remindLogImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    [self.containerView addSubview:self.remindLogImageView];
    
    self.remindLabel = [[UILabel alloc] init];
    self.remindLabel.text = @"密码长度为6~20个字符长度";
    self.remindLabel.textColor = UIColor.darkGrayColor;
    self.remindLabel.font = [UIFont systemFontOfSize:13];
    self.remindLabel.numberOfLines = 0;
    [self.containerView addSubview:self.remindLabel];
    
    self.sureButton = [self buttonWithTitle:@"确定" tag:1002];
    [self.containerView addSubview:self.sureButton];
    
    self.cancelButton = [self buttonWithTitle:@"取消" tag:1001];
    [self.containerView addSubview:self.cancelButton];

}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    self.frame = UIScreen.mainScreen.bounds;
}

- (void)showView {
    
    UIWindow *view = UIApplication.sharedApplication.delegate.window;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    self.alpha = 0;
    [view addSubview:self];

    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
    }];
    
    [self.passwordTextField becomeFirstResponder];
}

- (void)setupSubviewsConstraints {
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self).inset(60 * kScreenRate);
        make.height.mas_equalTo(250 * kScreenRate);
        make.centerY.mas_equalTo(self);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.containerView).inset(10 * kScreenRate);
        make.centerX.mas_equalTo(self.containerView);
    }];
    
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.containerView);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(10 * kScreenRate);
        make.height.mas_equalTo(1);
    }];

    [self.remindLogImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.containerView).inset(10 * kScreenRate);
        make.bottom.mas_equalTo(self.containerView.mas_centerY).mas_offset(-7.5 * kScreenRate);
    }];

    [self.remindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.remindLogImageView.mas_trailing).mas_offset(10 * kScreenRate);
        make.bottom.mas_equalTo(self.containerView.mas_centerY).mas_offset(-7.5 * kScreenRate);
    }];

    [self.passwordBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.containerView).inset(10 * kScreenRate);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(self.remindLabel.mas_top).mas_offset(-3 * kScreenRate);
    }];

    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.containerView).inset(10 * kScreenRate);
        make.bottom.mas_equalTo(self.passwordBottomView.mas_top).mas_offset(-3 * kScreenRate);
        make.height.mas_equalTo(30 * kScreenRate);
    }];

    [self.againPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.containerView).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.mas_centerY).mas_offset(7.5 * kScreenRate);
        make.height.mas_equalTo(30 * kScreenRate);
    }];

    [self.againPasswordBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.containerView).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.againPasswordTextField.mas_bottom).mas_offset(3 * kScreenRate);
        make.height.mas_equalTo(1);
    }];

    [self.centerLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.bottom.mas_equalTo(self.containerView);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(45 * kScreenRate);
    }];

    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.containerView);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(self.centerLine.mas_top);
    }];

    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.bottom.mas_equalTo(self.containerView);
        make.top.mas_equalTo(self.bottomLine.mas_bottom);
        make.trailing.mas_equalTo(self.centerLine.mas_leading);
    }];

    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.bottom.mas_equalTo(self.containerView);
        make.top.mas_equalTo(self.bottomLine.mas_bottom);
        make.leading.mas_equalTo(self.centerLine.mas_trailing);
    }];
}

- (UIButton *)buttonWithTitle:(NSString *)titlt tag:(NSInteger)tag {
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    [b setTitle:titlt forState:UIControlStateNormal];
    b.tag = tag;
    [b setTitleColor:UIColor.cyanColor forState:UIControlStateNormal];
    b.titleLabel.font = [UIFont systemFontOfSize:15];
    [b addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    return b;
}

- (UITextField *)textFiledWithPlaceholder:(NSString *)placeholder leftImageName:(NSString *)leftImageName {
    UITextField *t = [[UITextField alloc] init];
    t.placeholder = placeholder;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:leftImageName]];
    t.leftView = imageView;
    t.leftViewMode = UITextFieldViewModeAlways;
    t.secureTextEntry = true;
    t.font = [UIFont systemFontOfSize:15];
    t.clearButtonMode = UITextFieldViewModeWhileEditing;
    return t;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endEditing:true];
}

- (UIView *)lineWithBackGroundColor:(UIColor *)backgroundColor {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = backgroundColor;
    return view;
}

- (void)buttonTouched:(UIButton *)sender {
    if (sender.tag == 1001) {
        [self dismiss];
    }
}

- (void)dismiss {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.containerView.top = kScreenHeight;
        self.alpha = 0;

    } completion:^(BOOL finished) {
        [self.containerView removeFromSuperview];
        [self removeFromSuperview];
    }];
}

@end
