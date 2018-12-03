//
//  CraftsmanCertificationTableViewCell.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "CraftsmanCertificationTableViewCell.h"

@interface CraftsmanCertificationTableViewCell ()

@property (nonatomic, strong) UIImageView *logImageView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *currentStateLabel;
@property (nonatomic, strong) UILabel     *detailLabel;

@end


@implementation CraftsmanCertificationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self subupSubViews];
        [self setupSubViewsConstants];
    }
    return self;
}

- (void)subupSubViews {
    self.logImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Tabbar_health"]];
    [self.contentView addSubview:self.logImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"工匠认证";
    self.titleLabel.textColor = UIColor.blackColor;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.titleLabel];
    
    self.currentStateLabel = [[UILabel alloc] init];
    self.currentStateLabel.text = @"正在审核";
    self.currentStateLabel.textColor = UIColor.blackColor;
    self.currentStateLabel.font = [UIFont systemFontOfSize:15];
    self.currentStateLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.currentStateLabel];
    
    self.detailLabel = [[UILabel alloc] init];
    self.detailLabel.text = @"详细";
    self.detailLabel.textColor = UIColor.blackColor;
    self.detailLabel.font = [UIFont systemFontOfSize:15];
    self.detailLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.detailLabel];
}

- (void)setupSubViewsConstants {
    [self.logImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.contentView).inset(15 * kScreenRate);
        make.top.bottom.mas_equalTo(self.contentView).inset(25 * kScreenRate);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.logImageView);
        make.leading.mas_equalTo(self.logImageView.mas_trailing).mas_offset(10 * kScreenRate);
    }];
    
    [self.currentStateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.contentView);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.trailing.mas_equalTo(self.contentView).inset(15 * kScreenRate);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
