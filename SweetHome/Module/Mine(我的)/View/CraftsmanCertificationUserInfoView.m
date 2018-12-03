//
//  CraftsmanCertificationUserInfoView.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "CraftsmanCertificationUserInfoView.h"
#import "UIImage+Addition.h"
#import "UIButton+Addition.h"

@interface CraftsmanCertificationUserInfoView ()

@property (nonatomic, assign) CGFloat allHeight;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *spaceLine;

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UIView *nameBottomView;

@property (nonatomic, strong) UILabel *sexLabel;
@property (nonatomic, strong) UIButton *manButton;
@property (nonatomic, strong) UIButton *womanButton;
@property (nonatomic, strong) UIView *sexBottomView;

@property (nonatomic, strong) UITextField *nativePlaceChooseTextField;
@property (nonatomic, strong) UIView *nativePlaceBottomView;

@property (nonatomic, strong) UITextField *brithdayChooseTextField;
@property (nonatomic, strong) UIView *brithdayBottomView;

@property (nonatomic, strong) UITextField *idNumTextField;
@property (nonatomic, strong) UIView *idNumBottomView;

@property (nonatomic, strong) UITextField *registerPlaceChooseTextField;

@end

@implementation CraftsmanCertificationUserInfoView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self subupSubViews];
        [self setupSubViewsConstants];
    }
    return self;
}

- (void)subupSubViews {
    self.layer.borderColor = UIColor.redColor.CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 10;
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"个人认证信息";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.titleLabel.textColor = UIColor.darkGrayColor;
    [self addSubview:self.titleLabel];
    
    self.spaceLine = [[UIView alloc] init];
    self.spaceLine.backgroundColor = UIColor.darkGrayColor;
    [self addSubview:self.spaceLine];
    
    self.nameTextField = [self textFiledWithPlaceholder:@"姓名" leftImageName:@"userCenter"];
    [self addSubview:self.nameTextField];
    
    self.nameBottomView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self addSubview:self.nameBottomView];
    
    
    self.sexLabel = [[UILabel alloc] init];
    self.sexLabel.text = @"性别：";
    self.sexLabel.textColor = UIColor.lightGrayColor;
    self.sexLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.sexLabel];
    
    self.manButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.manButton setTitle:@"男" forState:UIControlStateNormal];
    [self.manButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.manButton setImage:[UIImage wd_initTempModeImageWithName:@"abc_btn_radio_to_on_mtrl_000"] forState:UIControlStateNormal];
    [self.manButton setImage:[UIImage wd_initTempModeImageWithName:@"abc_btn_radio_to_on_mtrl_015"] forState:UIControlStateSelected];
    self.manButton.titleLabel.font = [UIFont systemFontOfSize:13];
    self.manButton.tintColor = UIColor.redColor;
    self.manButton.tag = 1;
    [self.manButton addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.manButton];
    self.manButton.imageView.contentMode = UIViewContentModeScaleAspectFit;

    self.manButton.selected = true;
    
    self.womanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.womanButton setTitle:@"女" forState:UIControlStateNormal];
    [self.womanButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.womanButton setImage:[UIImage wd_initTempModeImageWithName:@"abc_btn_radio_to_on_mtrl_000"] forState:UIControlStateNormal];
    [self.womanButton setImage:[UIImage wd_initTempModeImageWithName:@"abc_btn_radio_to_on_mtrl_015"] forState:UIControlStateSelected];
    self.womanButton.tintColor = UIColor.redColor;
    self.womanButton.tag = 2;
    self.womanButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.womanButton addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    self.womanButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.womanButton];
    
    self.sexBottomView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self addSubview:self.sexBottomView];
    
    self.nativePlaceChooseTextField = [self textFiledWithPlaceholder:@"籍贯" leftImageName:@"userCenter"];
    [self addSubview:self.nativePlaceChooseTextField];
    
    self.nativePlaceBottomView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self addSubview:self.nativePlaceBottomView];
    
    self.brithdayChooseTextField = [self textFiledWithPlaceholder:@"出生日期" leftImageName:@"userCenter"];
    [self addSubview:self.brithdayChooseTextField];
    
    self.brithdayBottomView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self addSubview:self.brithdayBottomView];
    
    self.idNumTextField = [self textFiledWithPlaceholder:@"身份证号" leftImageName:@"userCenter"];
    [self addSubview:self.idNumTextField];
    
    self.idNumBottomView = [self lineWithBackGroundColor:UIColor.orangeColor];
    [self addSubview:self.idNumBottomView];
    
    self.registerPlaceChooseTextField = [self textFiledWithPlaceholder:@"现注册地" leftImageName:@"userCenter"];
    [self addSubview:self.registerPlaceChooseTextField];
}


- (void)setupSubViewsConstants {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).inset(10 * kScreenRate);
        make.top.mas_equalTo(self).inset(15 * kScreenRate);
    }];
    
    [self.spaceLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(15 * kScreenRate);
        make.height.mas_equalTo(1);
    }];
    
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.spaceLine.mas_bottom).mas_offset(10 * kScreenRate);
        make.height.mas_equalTo(30 * kScreenRate);
    }];
    
    [self.nameBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.nameTextField);
        make.top.mas_equalTo(self.nameTextField.mas_bottom).mas_offset(3 * kScreenRate);
        make.height.mas_equalTo(1);
    }];
    
    [self.sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.nameBottomView.mas_bottom).mas_offset(10 * kScreenRate);
        make.height.mas_equalTo(30 * kScreenRate);
    }];
    
    [self.manButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.sexLabel.mas_trailing).mas_offset(10 * kScreenRate);
        make.height.centerY.mas_equalTo(self.sexLabel);
    }];
    
    [self.womanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.manButton.mas_trailing).mas_offset(10 * kScreenRate);
        make.height.centerY.mas_equalTo(self.sexLabel);
    }];
    
    [self.sexBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.nameTextField);
        make.top.mas_equalTo(self.sexLabel.mas_bottom).mas_offset(3 * kScreenRate);
        make.height.mas_equalTo(1);
    }];
    
    [self.nativePlaceChooseTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.sexBottomView.mas_bottom).mas_offset(10 * kScreenRate);
        make.height.mas_equalTo(30 * kScreenRate);
    }];
    
    [self.nativePlaceBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.nameTextField);
        make.top.mas_equalTo(self.nativePlaceChooseTextField.mas_bottom).mas_offset(3 * kScreenRate);
        make.height.mas_equalTo(1);
    }];
    
    [self.brithdayChooseTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.nativePlaceBottomView.mas_bottom).mas_offset(10 * kScreenRate);
        make.height.mas_equalTo(30 * kScreenRate);
    }];
    
    [self.brithdayBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.nameTextField);
        make.top.mas_equalTo(self.brithdayChooseTextField.mas_bottom).mas_offset(3 * kScreenRate);
        make.height.mas_equalTo(1);
    }];
    
    [self.idNumTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.brithdayBottomView.mas_bottom).mas_offset(10 * kScreenRate);
        make.height.mas_equalTo(30 * kScreenRate);
    }];
    
    [self.idNumBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.nameTextField);
        make.top.mas_equalTo(self.idNumTextField.mas_bottom).mas_offset(3 * kScreenRate);
        make.height.mas_equalTo(1);
    }];
    
    [self.registerPlaceChooseTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.idNumBottomView.mas_bottom).mas_offset(10 * kScreenRate);
        make.height.mas_equalTo(35 * kScreenRate);
    }];
    
    [self layoutIfNeeded];
    self.allHeight = CGRectGetMaxY(self.registerPlaceChooseTextField.frame);
}

- (CGFloat)getHeight {
    return self.allHeight;
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

- (void)buttonTouched:(UIButton *)sender {
    sender.selected = true;
    if (sender.tag == 1) {
        self.womanButton.selected = false;
    } else {
        self.manButton.selected = false;
    }
}

@end
