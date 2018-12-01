//
//  RegisterViewController.m
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "FindPasswordViewController.h"

@interface RegisterViewController ()

//！ 系统login
@property (nonatomic, strong) UIImageView *logoImageView;

//！ 注册账号
@property (nonatomic, strong) UITextField *accountTextField;
@property (nonatomic, strong) UIView *accountBottomView;

//！ 验证码
@property (nonatomic, strong) UITextField *codeTextTextField;
@property (nonatomic, strong) UIView *codeBottomView;
@property (nonatomic, strong) UIButton *getCodeButton;

//！ 密码
@property (nonatomic, strong) UITextField *passwordTextTextField;
@property (nonatomic, strong) UIView *passswordButtomView;
@property (nonatomic, strong) UIImageView *remindLogImageView;
@property (nonatomic, strong) UILabel *remindLabel;

//！ 再次输入密码
@property (nonatomic, strong) UITextField *againPasswordTextTextField;
@property (nonatomic, strong) UIView *againPassswordButtomView;

//！ 注册协议
@property (nonatomic, strong) UIButton *protolSelectButton;
@property (nonatomic, strong) UILabel *protoLabel;
@property (nonatomic, strong) UIButton *protolButton;

//！ 注册
@property (nonatomic, strong) UIButton *registerButton;

//！ 登陆
@property (nonatomic, strong) UIButton *loginButton;

//！ 找回密码
@property (nonatomic, strong) UIButton *findPasswordButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setupNavigationBar {
    self.wdNavigationBar.backgroundColor = RGBCOLOR(66, 146, 183);
    [self.wdNavigationBar.centerButton setTitle:@"用户注册" forState:UIControlStateNormal];
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
    
    self.passwordTextTextField = [self textFiledWithPlaceholder:@"请输入密码" leftImageName:@"userCenter"];
    [self.view addSubview:self.passwordTextTextField];
    
    self.passswordButtomView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self.view addSubview:self.passswordButtomView];
    
    self.remindLogImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    [self.view addSubview:self.remindLogImageView];
    
    self.remindLabel = [[UILabel alloc] init];
    self.remindLabel.text = @"密码组成可以为字母、数字、特殊符号及下划线，长度为6~20个字符长度";
    self.remindLabel.textColor = UIColor.darkGrayColor;
    self.remindLabel.font = [UIFont systemFontOfSize:13];
    self.remindLabel.numberOfLines = 0;
    [self.view addSubview:self.remindLabel];
    

    self.againPasswordTextTextField = [self textFiledWithPlaceholder:@"请重复输入密码" leftImageName:@"userCenter"];
    [self.view addSubview:self.againPasswordTextTextField];
    
    self.againPassswordButtomView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self.view addSubview:self.againPassswordButtomView];
    
    self.protolSelectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.protolSelectButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.protolSelectButton setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    [self.view addSubview:self.protolSelectButton];
    
    self.protoLabel = [[UILabel alloc] init];
    self.protoLabel.text = @"我同意小窝家居";
    self.protoLabel.textColor = UIColor.blackColor;
    self.protoLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.protoLabel];
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:@"《用户注册协议》"];
    [attString addAttribute:NSForegroundColorAttributeName value:UIColor.redColor range:NSMakeRange(0, attString.length)];
    [attString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, attString.length)];
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, attString.length)];
    
    self.protolButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.protolButton setAttributedTitle:attString forState:UIControlStateNormal];
    CGAffineTransform matrix = CGAffineTransformMake(1,0,tanf(-15 * (CGFloat)M_PI /180),1,0, 0);
    self.protolButton.transform= matrix;
    [self.view addSubview:self.protolButton];
    
    self.registerButton = [[UIButton alloc] init];
    [self.registerButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.registerButton setTitle:@"注 册" forState:UIControlStateNormal];
    self.registerButton.backgroundColor = UIColor.orangeColor;
    self.registerButton.layer.cornerRadius = 10;
    self.registerButton.layer.borderColor = UIColor.redColor.CGColor;
    self.registerButton.layer.borderWidth = 0.5;
    self.registerButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.registerButton];
    
    self.loginButton = [self buttonWithTitle:@"登录" tag:1001];
    [self.view addSubview:self.loginButton];
    
    self.findPasswordButton = [self buttonWithTitle:@"找回密码" tag:1002];
    [self.view addSubview:self.findPasswordButton];
}

- (void)setupSubviewsConstraints {
    // logo
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view).inset(80 * kScreenRate);
        make.top.mas_equalTo(self.wdNavigationBar.mas_bottom).mas_offset(10 * kScreenRate);
    }];
    
    // 登录
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.logoImageView);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom).inset(10 * kScreenRate);
        } else {
            make.bottom.mas_equalTo(self.view).inset(10 * kScreenRate);
        }
    }];
    
    // 找回密码
    [self.findPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.logoImageView);
        make.bottom.mas_equalTo(self.loginButton);
    }];
    
    // 注册
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.logoImageView);
        make.bottom.mas_equalTo(self.loginButton.mas_top).mas_offset(-10 * kScreenRate);
        make.height.mas_equalTo(45 * kScreenRate);
    }];
    
    // <用户注册协议>
    [self.protolButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(self.registerButton.mas_top).mas_offset(-10 * kScreenRate);
    }];
    
    // 我同意小窝家居
    [self.protoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.view.mas_centerX);
        make.centerY.mas_equalTo(self.protolButton);
    }];
    
    // 协议框
    [self.protolSelectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.protoLabel.mas_leading).mas_offset(- 5 * kScreenRate);
        make.centerY.mas_equalTo(self.protolButton);
    }];
    
    // 获取验证码
    [self.getCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_centerY).mas_offset(-7.5 * kScreenRate);
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
    
    // 账号输入框底部线条
    [self.accountBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.accountTextField);
        make.height.mas_equalTo(2);
        make.bottom.mas_equalTo(self.getCodeButton.mas_top).mas_offset(-15 * kScreenRate);
    }];
    
    // 账号输入框
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view).inset(30 * kScreenRate);
        make.height.mas_equalTo(30 * kScreenRate);
        make.bottom.mas_equalTo(self.accountBottomView.mas_top).mas_offset(-3 * kScreenRate);
    }];
    
    // 密码输入框
    [self.passwordTextTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.accountTextField);
        make.height.mas_equalTo(30 * kScreenRate);
        make.top.mas_equalTo(self.view.mas_centerY).mas_offset(7.5 * kScreenRate);
    }];
    
    // 密码输入框底部线条
    [self.passswordButtomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.accountTextField);
        make.height.mas_equalTo(2);
        make.top.mas_equalTo(self.passwordTextTextField.mas_bottom).mas_offset(3 * kScreenRate);
    }];
    
    // 密码提示Logo
    [self.remindLogImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.passwordTextTextField);
        make.top.mas_equalTo(self.passswordButtomView.mas_bottom);
    }];
    
    // 密码提示文字
    [self.remindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.remindLogImageView.mas_trailing);
        make.top.mas_equalTo(self.passswordButtomView.mas_bottom);
        make.trailing.mas_equalTo(self.passswordButtomView);
    }];
    
    // 密码再次输入密码输入框
    [self.againPasswordTextTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.accountTextField);
        make.height.mas_equalTo(30 * kScreenRate);
        make.top.mas_equalTo(self.remindLabel.mas_bottom).mas_offset(15 * kScreenRate);
    }];
    
    // 密码再次输入密码输入框底部线条
    [self.againPassswordButtomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.accountTextField);
        make.height.mas_equalTo(2);
        make.top.mas_equalTo(self.againPasswordTextTextField.mas_bottom).mas_offset(3 * kScreenRate);
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
            if ([self.fromController isEqualToString:NSStringFromClass([FindPasswordViewController class])]) {
                [self.navigationController popViewControllerAnimated:true];
            } else {
                FindPasswordViewController *controller = [[FindPasswordViewController alloc] init];
                controller.fromController = NSStringFromClass([self class]);
                [self.navigationController pushViewController:controller animated:true];
            }
        }
        default:
            break;
    }
}

@end
