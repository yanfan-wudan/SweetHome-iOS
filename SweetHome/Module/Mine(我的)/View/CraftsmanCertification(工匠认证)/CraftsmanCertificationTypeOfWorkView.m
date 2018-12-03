//
//  CraftsmanCertificationTypeOfWorkView.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "CraftsmanCertificationTypeOfWorkView.h"
#import "WDTagView.h"

@interface CraftsmanCertificationTypeOfWorkView () <TagViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *spaceLine;
@property (nonatomic, strong) WDTagView *tagView;

@end

@implementation CraftsmanCertificationTypeOfWorkView

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
    self.titleLabel.text = @"工种认证（最多选择4项）";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    self.titleLabel.textColor = UIColor.darkGrayColor;
    [self addSubview:self.titleLabel];
    
    self.spaceLine = [[UIView alloc] init];
    self.spaceLine.backgroundColor = UIColor.darkGrayColor;
    [self addSubview:self.spaceLine];
    

    self.tagView = [[WDTagView alloc] init];
    self.tagView.delegate = self;
    [self addSubview:self.tagView];
}

- (void)setTagArray:(NSArray<NSString *> *)tagArray {
    _tagArray = tagArray;
    self.tagView.arr = tagArray;
    NSLog(@"%f", [self.tagView getHeight]);
}

- (CGFloat)getHeight {
    return [self.tagView getHeight];
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
    
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.spaceLine.mas_bottom).mas_offset(10 * kScreenRate);
        make.bottom.mas_equalTo(self);
    }];
}

- (void)handleSelectTag:(NSString *)keyWord {
    NSLog(@"%@", keyWord);
}

@end
