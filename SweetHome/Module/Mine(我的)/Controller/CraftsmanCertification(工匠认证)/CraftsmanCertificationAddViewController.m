//
//  CraftsmanCertificationAddViewController.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "CraftsmanCertificationAddViewController.h"

// View
#import "CraftsmanCertificationTypeView.h"
#import "CraftsmanCertificationTypeOfWorkView.h"
#import "CraftsmanCertificationUserInfoView.h"
#import "CraftsmanCertificationIDCardView.h"

@interface CraftsmanCertificationAddViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) CraftsmanCertificationTypeView *typeView;
@property (nonatomic, strong) CraftsmanCertificationTypeOfWorkView *typeOfWorkChooseView;
@property (nonatomic, strong) CraftsmanCertificationUserInfoView *userInfoView;
@property (nonatomic, strong) CraftsmanCertificationIDCardView *idCardView;

@property (nonatomic, strong) UIButton *sureSubmitButton;


@end

@implementation CraftsmanCertificationAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupNavigationBar {
    self.wdNavigationBar.backgroundColor = RGBCOLOR(66, 146, 183);
    [self.wdNavigationBar.centerButton setTitle:@"工匠认证" forState:UIControlStateNormal];
    [self.wdNavigationBar.centerButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}

- (void)setupSubviews {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.view addSubview:self.scrollView];
    
    self.containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = UIColor.whiteColor;
    [self.scrollView addSubview:self.containerView];
    
    self.typeView = [[CraftsmanCertificationTypeView alloc] init];
    self.typeView.backgroundColor = UIColor.whiteColor;
    [self.containerView addSubview:self.typeView];
    
    self.typeOfWorkChooseView = [[CraftsmanCertificationTypeOfWorkView alloc] init];
    self.typeOfWorkChooseView.backgroundColor = UIColor.whiteColor;
    self.typeOfWorkChooseView.tagArray = @[@"电工", @"焊工", @"打墙工", @"油漆工", @"瓦工", @"打孔工", @"搬运工", @"木工"];
    [self.containerView addSubview:self.typeOfWorkChooseView];
    
    self.userInfoView = [[CraftsmanCertificationUserInfoView alloc] init];
    [self.containerView addSubview:self.userInfoView];
    
    self.idCardView = [[CraftsmanCertificationIDCardView alloc] init];
    [self.containerView addSubview:self.idCardView];
    
    self.sureSubmitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sureSubmitButton setTitle:@"信息确认提交" forState:UIControlStateNormal];
    [self.sureSubmitButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.sureSubmitButton.backgroundColor = UIColor.orangeColor;
    self.sureSubmitButton.layer.cornerRadius = 20 * kScreenRate;
    [self.containerView addSubview:self.sureSubmitButton];
}

- (void)setupSubviewsConstraints {
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view);
        make.top.mas_equalTo(self.wdNavigationBar.mas_bottom);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view.mas_bottom);
        }
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenWidth);
        make.edges.mas_equalTo(self.scrollView);
    }];
    
    [self.typeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.scrollView).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.scrollView).inset(15 * kScreenRate);
        make.height.mas_equalTo(150 * kScreenRate);
    }];
    
    [self.typeOfWorkChooseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.scrollView).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.typeView.mas_bottom).mas_offset(15 * kScreenRate);
        make.height.mas_equalTo(60 * kScreenRate + [self.typeOfWorkChooseView getHeight]);
    }];
    
    [self.userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.scrollView).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.typeOfWorkChooseView.mas_bottom).mas_offset(15 * kScreenRate);
        make.height.mas_equalTo([self.userInfoView getHeight]);
    }];
    
    [self.idCardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.scrollView).inset(10 * kScreenRate);
        make.top.mas_equalTo(self.userInfoView.mas_bottom).mas_offset(15 * kScreenRate);
        make.height.mas_equalTo([self.idCardView getHeight]);
    }];
    
    [self.sureSubmitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.idCardView.mas_bottom).mas_offset(30 * kScreenRate);
        make.centerX.mas_equalTo(self.scrollView);
        make.width.mas_equalTo(kScreenWidth * 0.4);
        make.height.mas_equalTo(45 * kScreenRate);
    }];
    
    [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenWidth);
        make.bottom.mas_equalTo(self.sureSubmitButton.mas_bottom).mas_offset(15 * kScreenRate);
    }];
}

@end
