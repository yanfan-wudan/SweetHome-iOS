//
//  MineViewController.m
//  SweetHome
//
//  Created by wudan on 2018/11/30.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "MineViewController.h"

// View
#import "MineHeaderView.h"
#import "MineOrderOperationView.h"

// Controller
#import "LoginViewController.h"

@interface MineViewController () <MineHeaderViewDelegate, MineOrderOperationViewDelagte>

// UI
@property (nonatomic, strong) MineHeaderView *tableViewHeaderView;

// Data
@property (nonatomic, copy) NSArray<NSArray *> *titleArray;
@property (nonatomic, copy) NSArray<NSArray *> *vcArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)initializationDefaultData {
    NSArray *lastArray = @[@"工匠认证", @"我的积分", @"我的小窝", @"二手商品", @"用户反馈", @"系统设置"];
    self.titleArray = @[@[@"我的动态"], @[@"我的订单"], lastArray];
    
    self.vcArray = @[@[@"MyDynamicViewController"],
                     @[@"MyWorkOrderViewController"],
                     @[@"CraftsmanCertificationViewController",
                       @"MyPointsViewController",
                       @"MyHomeViewController",
                       @"SecondHandGoodsViewController",
                       @"UserFeedbackViewController",
                       @"SystemSettingViewControler"]];
}

- (void)setupNavigationBar {
    self.wdNavigationBar.backgroundColor = RGBCOLOR(66, 146, 183);
    [self.wdNavigationBar.leftButton setTitle:@" 签到 " forState:UIControlStateNormal];
    self.wdNavigationBar.leftButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.wdNavigationBar.leftButton setImage:nil forState:UIControlStateNormal];
    [self.wdNavigationBar.leftButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.wdNavigationBar.leftButton.layer.borderColor = UIColor.whiteColor.CGColor;
    self.wdNavigationBar.leftButton.layer.cornerRadius = 5;
    self.wdNavigationBar.leftButton.layer.borderWidth = 1;
}

- (void)setupSubviews {
    [self.view addSubview:self.tableView];
    self.tableViewHeaderView = [[MineHeaderView alloc] init];
    self.tableViewHeaderView.delegate = self;
    [self.tableViewHeaderView setupIfWithoutLogin];
    self.tableView.tableHeaderView = self.tableViewHeaderView;
}

- (void)setupSubviewsConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.wdNavigationBar.mas_bottom);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.titleArray[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section > 0 ? 15 : 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return UIView.new;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return  section == 1 ? 60 * kScreenRate : 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 1) {
        MineOrderOperationView *view = [[MineOrderOperationView alloc] init];
        view.delegate = self;
        return view;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * const reuserIdentify = @"baseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserIdentify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserIdentify];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.titleArray[indexPath.section][indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    Class class = NSClassFromString(self.vcArray[indexPath.section][indexPath.row]);
    UIViewController *vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}

#pragma mark - MineHeaderViewDelegate

- (void)mineHeaderView:(MineHeaderView *)headerView loginButtonTouched:(UIButton *)button {
    LoginViewController *controller = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:controller animated:true];
}

#pragma mark - MineOrderOperationViewDelagte

- (void)mineOrderOperationView:(MineOrderOperationView *)view didselectedType:(MineOrderOperationType)type {
    NSLog(@"%ld", type);
}

@end
