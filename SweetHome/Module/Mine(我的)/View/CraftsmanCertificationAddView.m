//
//  CraftsmanCertificationAddView.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "CraftsmanCertificationAddView.h"

@interface CraftsmanCertificationAddView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *addButton;

@end

@implementation CraftsmanCertificationAddView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self subupSubViews];
        [self setupSubViewsConstants];
    }
    return self;
}

- (void)subupSubViews {
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addButton.backgroundColor = UIColor.orangeColor;
    [self.addButton setTitle:@"+" forState:UIControlStateNormal];
    [self.addButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.addButton.titleLabel.font = [UIFont systemFontOfSize:20];
    self.addButton.layer.cornerRadius = 25 * kScreenRate;
    [self.addButton addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.addButton];
    
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"点击增加认证";
    self.titleLabel.textColor = UIColor.grayColor;
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
}

- (void)setupSubViewsConstants {
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).inset(15 * kScreenRate);
        make.width.height.mas_equalTo(50 * kScreenRate);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.bottom.mas_equalTo(self);
        make.top.mas_equalTo(self.addButton.mas_bottom).mas_offset(15 * kScreenRate);
    }];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    self.frame = CGRectMake(0, 0, kScreenWidth, 85 * kScreenRate);
}

- (void)buttonTouched:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(craftsmanCertificationAddView:touchedAddButton:)]) {
        [self.delegate craftsmanCertificationAddView:self touchedAddButton:sender];
    }
}

@end
