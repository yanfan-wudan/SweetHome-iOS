//
//  FindPasswordViewController.m
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "FindPasswordViewController.h"
#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "FindPasswordAlterView.h"

@interface FindPasswordViewController ()

//！ 系统login
@property (nonatomic, strong) UIImageView *logoImageView;

//！ 注册账号
@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UIView *accountBottomView;

//！ 验证码
@property (nonatomic, strong) UITextField *codeTextTextField;
@property (nonatomic, strong) UIView *codeBottomView;
@property (nonatomic, strong) UIButton *getCodeButton;

//！ 注册
@property (nonatomic, strong) UIButton *registerButton;

//！ 登陆
@property (nonatomic, strong) UIButton *loginButton;

//！ 找回密码
@property (nonatomic, strong) UIButton *findPasswordButton;

@end

@implementation FindPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setupNavigationBar {
    self.wdNavigationBar.backgroundColor = RGBCOLOR(66, 146, 183);
    [self.wdNavigationBar.centerButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [self.wdNavigationBar.centerButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}

- (void)setupSubviews {
    self.logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sweet_hom_full_logo"]];
    self.logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.logoImageView];
    
    self.accountTextField = [self textFiledWithPlaceholder:@"请输入注册手机号" leftImageName:@"userCenter"];
    [self.view addSubview:self.accountTextField];
    
    self.accountBottomView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self.view addSubview:self.accountBottomView];
    
    self.codeTextTextField = [self textFiledWithPlaceholder:@"手机验证码" leftImageName:@"userCenter"];
    self.codeTextTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.codeTextTextField];
    
    self.codeBottomView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self.view addSubview:self.codeBottomView];
    
    self.getCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.getCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    self.getCodeButton.backgroundColor = UIColor.orangeColor;
    self.getCodeButton.titleLabel.font = [UIFont systemFontOfSize:12];
    self.getCodeButton.layer.cornerRadius = 5;
    [self.view addSubview:self.getCodeButton];
    
    
    self.findPasswordButton = [[UIButton alloc] init];
    [self.findPasswordButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.findPasswordButton setTitle:@"找回密码" forState:UIControlStateNormal];
    self.findPasswordButton.backgroundColor = UIColor.orangeColor;
    self.findPasswordButton.layer.cornerRadius = 10;
    self.findPasswordButton.layer.borderColor = UIColor.redColor.CGColor;
    self.findPasswordButton.layer.borderWidth = 0.5;
    self.findPasswordButton.titleLabel.font = [UIFont systemFontOfSize:18];
    self.findPasswordButton.tag = 100;
    [self.findPasswordButton addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.findPasswordButton];
    
    self.loginButton = [self buttonWithTitle:@"登录" tag:1001];
    [self.view addSubview:self.loginButton];
    
    self.registerButton = [self buttonWithTitle:@"注册" tag:1002];
    [self.view addSubview:self.registerButton];
}

- (void)setupSubviewsConstraints {
    // logo
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view).inset(80 * kScreenRate);
        make.top.mas_equalTo(self.wdNavigationBar.mas_bottom).mas_offset(10 * kScreenRate);
    }];
    
    // 账号输入框底部线条
    [self.accountBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.accountTextField);
        make.height.mas_equalTo(2);
        make.bottom.mas_equalTo(self.view.mas_centerY).mas_offset(-7.5 * kScreenRate);
    }];
    
    // 账号输入框
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view).inset(30 * kScreenRate);
        make.height.mas_equalTo(30 * kScreenRate);
        make.bottom.mas_equalTo(self.accountBottomView.mas_top).mas_offset(-3 * kScreenRate);
    }];
    
    // 获取验证码
    [self.getCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_centerY).mas_offset(7.5 * kScreenRate);
        make.height.mas_equalTo(34 * kScreenRate);
        make.trailing.mas_equalTo(self.view).inset(30 * kScreenRate);
        make.width.mas_equalTo(self.getCodeButton.mas_height).multipliedBy(2.5);
    }];
    
    // 验证码输入框
    [self.codeTextTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view).inset(30 * kScreenRate);
        make.height.mas_equalTo(30 * kScreenRate);
        make.trailing.mas_equalTo(self.getCodeButton.mas_leading).mas_offset(-10 * kScreenRate);
        make.top.mas_equalTo(self.getCodeButton);
    }];
    
    // 验证码输入框底部线条
    [self.codeBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.codeTextTextField);
        make.height.mas_equalTo(2);
        make.top.mas_equalTo(self.codeTextTextField.mas_bottom).mas_offset(3 * kScreenRate);
    }];
    
    // 找回密码
    [self.findPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.leading.mas_equalTo(self.logoImageView);
        make.height.mas_equalTo(45 * kScreenRate);
        make.top.mas_equalTo(self.codeBottomView.mas_bottom).mas_offset(30 * kScreenRate);
    }];
    
    // 登录
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.logoImageView);
        make.top.mas_equalTo(self.findPasswordButton.mas_bottom).mas_offset(10 * kScreenRate);
    }];
    
    // 注册
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.findPasswordButton);
        make.top.mas_equalTo(self.findPasswordButton.mas_bottom).mas_offset(10 * kScreenRate);
    }];
}

- (UITextField *)textFiledWithPlaceholder:(NSString *)placeholder leftImageName:(NSString *)leftImageName {
    UITextField *t = [[UITextField alloc] init];
    t.placeholder = placeholder;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:leftImageName]];
    t.leftView = imageView;
    t.leftViewMode = UITextFieldViewModeAlways;
    return t;
}

- (UIView *)lineWithBackGroundColor:(UIColor *)backgroundColor {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = backgroundColor;
    return view;
}

- (UIButton *)buttonWithTitle:(NSString *)title tag:(NSInteger)tag {
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    [b setTitle:title forState:UIControlStateNormal];
    [b setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
    b.titleLabel.font = [UIFont systemFontOfSize:13];
    [b addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    b.tag = tag;
    return b;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:true];
}

- (void)buttonTouched:(UIButton *)sender {
    switch (sender.tag) {
        case 1001:
        {
            if ([self.fromController isEqualToString:NSStringFromClass([LoginViewController class])]) {
                [self.navigationController popViewControllerAnimated:true];
            } else {
                LoginViewController *controller = [[LoginViewController alloc] init];
                controller.fromController = NSStringFromClass([self class]);
                [self.navigationController pushViewController:controller animated:true];
            }
        }
            break;
            
        case 1002:
        {
            if ([self.fromController isEqualToString:NSStringFromClass([RegisterViewController class])]) {
                [self.navigationController popViewControllerAnimated:true];
            } else {
                RegisterViewController *controller = [[RegisterViewController alloc] init];
                controller.fromController = NSStringFromClass([self class]);
                [self.navigationController pushViewController:controller animated:true];
            }
        }
             break;
        case 100:
        {
            FindPasswordAlterView *view = [[FindPasswordAlterView alloc] init];
            [view showView];
        }
             break;
        default:
            break;
    }
}

@end
