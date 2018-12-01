//
//  LoginViewController.m
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "LoginViewController.h"
#import "UIButton+Addition.h"

#import "RegisterViewController.h"
#import "FindPasswordViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIImageView *logoImageView;      //！ 系统login

@property (nonatomic, strong) UITextField *accountTextField;   //！ 账号输入框
@property (nonatomic, strong) UIView      *accountLineView;    //！ 账号底部线条

@property (nonatomic, strong) UITextField *passwordTextField;  //！ 密码输入框
@property (nonatomic, strong) UIView      *passwordLineView;   //！密码底部线条

@property (nonatomic, strong) UIButton    *loginButton;        //！登陆按钮
@property (nonatomic, strong) UIButton    *registerButton;     //！用户注册
@property (nonatomic, strong) UIButton    *findPasswordButton; //！找回密码

@property (nonatomic, strong) UIView      *leftLine;            //！快速登陆 左边线条
@property (nonatomic, strong) UIView      *rightLine;           //！快速登陆 右边线条
@property (nonatomic, strong) UILabel     *speedLoginTitleLabel;//！快速登陆

@property (nonatomic, strong) UIButton    *wechatButton;        //！微信登陆
@property (nonatomic, strong) UIButton    *tencentButton;       //！QQ的登陆

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setupNavigationBar {
    self.wdNavigationBar.backgroundColor = RGBCOLOR(66, 146, 183);
    [self.wdNavigationBar.centerButton setTitle:@"用户登录" forState:UIControlStateNormal];
    [self.wdNavigationBar.centerButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}

- (void)setupSubviews {
    self.logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sweet_hom_full_logo"]];
    self.logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.logoImageView];
    
    self.accountTextField = [self textFiledWithPlaceholder:@"请输入注册手机号" leftImageName:@"userCenter"];
    [self.view addSubview:self.accountTextField];
    
    self.accountLineView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self.view addSubview:self.accountLineView];
    
    self.passwordTextField = [self textFiledWithPlaceholder:@"请输入登录密码" leftImageName:@"userCenter"];
    self.passwordTextField.secureTextEntry = true;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:self.passwordTextField];
    
    self.passwordLineView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self.view addSubview:self.passwordLineView];
    
    self.loginButton = [[UIButton alloc] init];
    [self.loginButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    self.loginButton.backgroundColor = UIColor.orangeColor;
    self.loginButton.layer.cornerRadius = 10;
    self.loginButton.layer.borderColor = UIColor.redColor.CGColor;
    self.loginButton.layer.borderWidth = 0.5;
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.loginButton];
    
    
    self.wechatButton = [self setupButtonWithImageName:@"" title:@"微信登录"];
    [self.view addSubview:self.wechatButton];
    
    self.tencentButton = [self setupButtonWithImageName:@"" title:@"QQ登录"];
    [self.view addSubview:self.tencentButton];
    
    self.speedLoginTitleLabel = [[UILabel alloc] init];
    self.speedLoginTitleLabel.text = @"快速登录";
    self.speedLoginTitleLabel.textColor = UIColor.grayColor;
    self.speedLoginTitleLabel.font = [UIFont systemFontOfSize:13];
    self.speedLoginTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.speedLoginTitleLabel];
    
    self.leftLine = [self lineWithBackGroundColor:UIColor.grayColor];
    [self.view addSubview:self.leftLine];
    
    self.rightLine = [self lineWithBackGroundColor:UIColor.grayColor];
    [self.view addSubview:self.rightLine];
    
    self.registerButton = [self buttonWithTitle:@"用户注册" tag:1001];
    [self.view addSubview:self.registerButton];
    
    self.findPasswordButton = [self buttonWithTitle:@"找回密码" tag:1002];
    [self.view addSubview:self.findPasswordButton];
}

- (void)setupSubviewsConstraints {
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view).inset(80 * kScreenRate);
        make.top.mas_equalTo(self.wdNavigationBar.mas_bottom).mas_offset(30 * kScreenRate);
    }];
    
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view).inset(80 * kScreenRate);
        make.height.mas_equalTo(30 * kScreenRate);
        make.bottom.mas_equalTo(self.view.mas_centerY).mas_offset(-15 * kScreenRate);
    }];
    
    [self.accountLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.accountTextField);
        make.top.mas_equalTo(self.accountTextField.mas_bottom).mas_offset(3 * kScreenRate);
        make.height.mas_equalTo(2);
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.accountTextField);
        make.height.mas_equalTo(self.accountTextField);
        make.top.mas_equalTo(self.view.mas_centerY).mas_offset(15 * kScreenRate);
    }];
    
    [self.passwordLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.accountTextField);
        make.top.mas_equalTo(self.passwordTextField.mas_bottom).mas_offset(3 * kScreenRate);
        make.height.mas_equalTo(2);
    }];
    
    
    [self.wechatButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view);
        }
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.mas_equalTo(80 * kScreenRate);
    }];
    
    [self.tencentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.view);
        make.height.width.bottom.mas_equalTo(self.wechatButton);
    }];
    
    [self.wechatButton layoutIfNeeded];
    [self.wechatButton wd_buttonLayoutWithSpace:15 layoutStyle:UIButtonLayoutStyleTop];
    
    [self.tencentButton layoutIfNeeded];
    [self.tencentButton wd_buttonLayoutWithSpace:15 layoutStyle:UIButtonLayoutStyleTop];
    
    [self.speedLoginTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.wechatButton.mas_top).mas_offset(-10 * kScreenRate);
    }];
    
    [self.leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view);
        make.height.mas_equalTo(1);
        make.centerY.mas_equalTo(self.speedLoginTitleLabel);
        make.trailing.mas_equalTo(self.speedLoginTitleLabel.mas_leading).mas_offset(-10 * kScreenRate);
    }];
    
    [self.rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.view);
        make.height.mas_equalTo(1);
        make.centerY.mas_equalTo(self.speedLoginTitleLabel);
        make.leading.mas_equalTo(self.speedLoginTitleLabel.mas_trailing).mas_offset(10 * kScreenRate);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.logoImageView);
        make.height.mas_equalTo(45 * kScreenRate);
        make.bottom.mas_equalTo(self.speedLoginTitleLabel.mas_top).mas_offset(-80 * kScreenRate);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.loginButton);
        make.top.mas_equalTo(self.loginButton.mas_bottom).mas_offset(10 * kScreenRate);
    }];
    
    [self.findPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.loginButton);
        make.top.mas_equalTo(self.loginButton.mas_bottom).mas_offset(10 * kScreenRate);
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

- (UIButton *)setupButtonWithImageName:(NSString *)imageName title:(NSString *)title {
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    [b setTitle:title forState:UIControlStateNormal];
    [b setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
    [b setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    b.imageView.contentMode = UIViewContentModeScaleAspectFit;
    b.titleLabel.font = [UIFont systemFontOfSize:13];
    return b;
}

- (UIButton *)buttonWithTitle:(NSString *)title tag:(NSInteger)tag {
    UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
    [b setTitle:title forState:UIControlStateNormal];
    [b setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
    b.titleLabel.font = [UIFont systemFontOfSize:13];
    b.tag = tag;
    [b addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    return b;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:true];
}

- (void)buttonTouched:(UIButton *)sender {
    switch (sender.tag) {
            case 1001:
        {
            RegisterViewController *controller = [[RegisterViewController alloc] init];
            controller.fromController = NSStringFromClass([self class]);
            [self.navigationController pushViewController:controller animated:true];
        }
            break;
            
            case 1002:
        {
            FindPasswordViewController *controller = [[FindPasswordViewController alloc] init];
            controller.fromController = NSStringFromClass([self class]);
            [self.navigationController pushViewController:controller animated:true];
        }
        default:
            break;
    }
}

@end
