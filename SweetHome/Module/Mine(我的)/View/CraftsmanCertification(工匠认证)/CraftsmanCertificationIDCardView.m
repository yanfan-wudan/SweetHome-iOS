//
//  CraftsmanCertificationIDCardView.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "CraftsmanCertificationIDCardView.h"

@interface CraftsmanCertificationIDCardView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *spaceLine;

@property (nonatomic, strong) UIButton *fontButton;
@property (nonatomic, strong) UILabel *fontTitleLabel;

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *backTitleLabel;

@property (nonatomic, assign) CGFloat allHeight;

@end

@implementation CraftsmanCertificationIDCardView

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
    self.titleLabel.text = @"上传身份证信息";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.titleLabel.textColor = UIColor.darkGrayColor;
    [self addSubview:self.titleLabel];
    
    self.spaceLine = [[UIView alloc] init];
    self.spaceLine.backgroundColor = UIColor.darkGrayColor;
    [self addSubview:self.spaceLine];
    
    self.fontButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.fontButton setImage:[UIImage imageNamed:@"userid_force"] forState:UIControlStateNormal];
    self.fontButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.fontButton];
    
    self.fontTitleLabel = [[UILabel alloc] init];
    self.fontTitleLabel.text = @"上传身份证个人信息页";
    self.fontTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.fontTitleLabel.font = [UIFont systemFontOfSize:13];
    self.fontTitleLabel.textColor = UIColor.grayColor;
    [self addSubview:self.fontTitleLabel];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"userid_back"] forState:UIControlStateNormal];
    self.backButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.backButton];
    
    self.backTitleLabel = [[UILabel alloc] init];
    self.backTitleLabel.text = @"上传身份证国徽页";
    self.backTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.backTitleLabel.font = [UIFont systemFontOfSize:13];
    self.backTitleLabel.textColor = UIColor.grayColor;
    [self addSubview:self.backTitleLabel];
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
    
    [self.fontButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).inset(10 * kScreenRate);
        make.trailing.mas_equalTo(self.mas_centerX).mas_offset(-5 * kScreenRate);
        make.top.mas_equalTo(self.spaceLine.mas_bottom).mas_offset(10 * kScreenRate);
    }];
    
    [self.fontTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.fontButton);
        make.top.mas_equalTo(self.fontButton.mas_bottom).mas_offset(10 * kScreenRate);
    }];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self).inset(10 * kScreenRate);
        make.leading.mas_equalTo(self.mas_centerX).mas_offset(5 * kScreenRate);
        make.top.mas_equalTo(self.spaceLine.mas_bottom).mas_offset(10 * kScreenRate);
    }];
    
    [self.backTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.backButton);
        make.top.mas_equalTo(self.backButton.mas_bottom).mas_offset(10 * kScreenRate);
    }];
    
    [self layoutIfNeeded];
    self.allHeight = CGRectGetMaxY(self.backTitleLabel.frame);
}

- (CGFloat)getHeight {
    return self.allHeight + 10 * kScreenRate;
}

@end
