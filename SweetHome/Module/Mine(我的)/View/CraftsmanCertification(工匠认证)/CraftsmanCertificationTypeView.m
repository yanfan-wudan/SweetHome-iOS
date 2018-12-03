//
//  CraftsmanCertificationTypeView.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "CraftsmanCertificationTypeView.h"
#import "UIImage+Addition.h"
#import "UIButton+Addition.h"
#import "WDComboBoxControl.h"


@interface CraftsmanCertificationTypeView ()<WDComboBoxControlDataSource, WDComboBoxControlDelegate>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *chooseTypeButton;
@property (nonatomic, strong) UILabel *chooseTitle;
@property (nonatomic, strong) UIImageView *chooseStatusImageView;

@property (nonatomic, strong) UILabel *feeTitleLabel;
@property (nonatomic, strong) UIButton *price365Button;
@property (nonatomic, strong) UIButton *price200Button;

@end

@implementation CraftsmanCertificationTypeView

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
    self.titleLabel.text = @"认证类型：";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.titleLabel.textColor = UIColor.darkGrayColor;
    [self addSubview:self.titleLabel];
    
    self.chooseTypeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.chooseTypeButton.layer.borderColor = UIColor.grayColor.CGColor;
    self.chooseTypeButton.layer.borderWidth = 1;
    self.chooseTypeButton.layer.cornerRadius = 10;
    [self.chooseTypeButton addTarget:self action:@selector(chooseButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.chooseTypeButton];
    
    self.chooseTitle = [[UILabel alloc] init];
    self.chooseTitle.text = @"工匠认证";
    self.chooseTitle.textColor = UIColor.grayColor;
    self.chooseTitle.font = [UIFont systemFontOfSize:13];
    [self.chooseTypeButton addSubview:self.chooseTitle];
    
    self.chooseStatusImageView = [[UIImageView alloc] initWithImage:[UIImage wd_initTempModeImageWithName:@"abc_spinner_mtrl_am_alpha.9"]];
    self.chooseStatusImageView.transform = CGAffineTransformMakeRotation(-M_PI);
    self.chooseStatusImageView.tintColor = UIColor.grayColor;
    [self.chooseTypeButton addSubview:self.chooseStatusImageView];
    
    self.feeTitleLabel = [[UILabel alloc] init];
    self.feeTitleLabel.text = @"工匠认证费用：";
    self.feeTitleLabel.font = [UIFont systemFontOfSize:15];
    self.feeTitleLabel.textColor = UIColor.grayColor;
    [self addSubview:self.feeTitleLabel];

    self.price365Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.price365Button setTitle:@"365元/年" forState:UIControlStateNormal];
    [self.price365Button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.price365Button setImage:[UIImage wd_initTempModeImageWithName:@"abc_btn_radio_to_on_mtrl_000"] forState:UIControlStateNormal];
    [self.price365Button setImage:[UIImage wd_initTempModeImageWithName:@"abc_btn_radio_to_on_mtrl_015"] forState:UIControlStateSelected];
    self.price365Button.titleLabel.font = [UIFont systemFontOfSize:13];
    self.price365Button.tintColor = UIColor.redColor;
    self.price365Button.tag = 365;
    [self.price365Button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.price365Button];
    
    self.price365Button.selected = true;
    
    self.price200Button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.price200Button setTitle:@"200元/年" forState:UIControlStateNormal];
    [self.price200Button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.price200Button setImage:[UIImage wd_initTempModeImageWithName:@"abc_btn_radio_to_on_mtrl_000"] forState:UIControlStateNormal];
    [self.price200Button setImage:[UIImage wd_initTempModeImageWithName:@"abc_btn_radio_to_on_mtrl_015"] forState:UIControlStateSelected];
    self.price200Button.tintColor = UIColor.redColor;
    self.price200Button.tag = 200;
    self.price200Button.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.price200Button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.price200Button];
}

- (void)setupSubViewsConstants {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).inset(10 * kScreenRate);
        make.top.mas_equalTo(self).inset(20 * kScreenRate);
    }];
    
    [self.chooseTypeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self).inset(10 * kScreenRate);
        make.centerY.mas_equalTo(self.titleLabel);
        make.height.mas_equalTo(self.titleLabel).multipliedBy(2);
        make.leading.mas_equalTo(self.titleLabel.mas_trailing).mas_offset(10 * kScreenRate);
    }];
    
    [self.chooseTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.chooseTypeButton).inset(10 *kScreenRate);
        make.centerY.mas_equalTo(self.chooseTypeButton);
    }];
    
    [self.chooseStatusImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.chooseTypeButton).inset(10 *kScreenRate);
        make.centerY.mas_equalTo(self.chooseTypeButton);
    }];
    
    [self.feeTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.chooseTypeButton.mas_bottom).mas_offset(15 * kScreenRate);
    }];
    
    [self.price365Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self).inset(10 * kScreenRate);
        make.centerY.mas_equalTo(self.feeTitleLabel);
    }];
    
    [self.price200Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.price365Button.mas_bottom).inset(10 * kScreenRate);
        make.bottom.mas_equalTo(self).inset(10 * kScreenRate);
    }];
}

- (void)buttonTouched:(UIButton *)sender {
    sender.selected = true;
    if (sender.tag == 365) {
        self.price200Button.selected = false;
    } else {
        self.price365Button.selected = false;
    }
}

- (void)chooseButtonTouched:(UIButton *)sender {
    self.chooseStatusImageView.transform = CGAffineTransformMakeRotation(M_PI);
    WDComboBoxControl *view = [[WDComboBoxControl alloc] initViewWithMaxHeight:180 fromView:sender showDirection:WDComboBoxControlDirectionBottom];
    view.dataSource = self;
    view.delegate = self;
    view.backgroundButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    [view showInView];
}

#pragma mark =============== WDComBoxControlDataSource ===============
- (NSArray<NSString *> *)titleOfSection {
    return nil;
}

- (NSArray<NSArray<NSString *> *> *)dataSourceOfColunm {
    return @[@[@"工匠认证", @"项目经理认证", @"材料商认证", @"装修公司认证"]];
}

#pragma mark =============== WDComBoxControlDelegate ===============
- (void)selectedAtIndexPath:(NSIndexPath *)indexPath resultTitle:(NSString *)title fromSourceView:(UIView *)sourceView {
    self.chooseTitle.text = title;
}

@end
