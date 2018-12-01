//
//  RootViewController.m
//  SweetHome
//
//  Created by wudan on 2018/11/30.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "RootViewController.h"
#import <objc/runtime.h>

@interface RootViewController () 

@end

@implementation RootViewController

- (void)dealloc {
    KLLog(@"==== %@ ==== 销毁", NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = true;
    
    [self initializationDefaultData];
    
    [self setupNavigationBar];
    
    [self setupSubviews];
    
    [self setupSubviewsConstraints];    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * const reuserIdentify = @"baseCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserIdentify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserIdentify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"默认文字-------%ld",(long)indexPath.section + 1];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

#pragma mark - Getter

- (WDNavigationBar *)wdNavigationBar {
    if (!_wdNavigationBar) {
        _wdNavigationBar = [[WDNavigationBar alloc] init];
        _wdNavigationBar.isShowBottomLine = false;
        _wdNavigationBar.backgroundColor = UIColor.orangeColor;
        [_wdNavigationBar.leftButton setImage:[UIImage imageNamed:@"nav_back_white"] forState:UIControlStateNormal];
        [self.view addSubview:_wdNavigationBar];
        [_wdNavigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.top.mas_equalTo(self.view);
            make.height.mas_equalTo(UIApplication.sharedApplication.statusBarFrame.size.height + 44);
        }];
    }
    return _wdNavigationBar;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView                    = [[UITableView alloc] init];
        _tableView.backgroundColor    = UIColor.groupTableViewBackgroundColor;
        _tableView.delegate           = self;
        _tableView.dataSource         = self;
        _tableView.rowHeight          = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 65.f;
        _tableView.tableFooterView    = UIView.new;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

@end

#pragma mark  页面布局
@implementation RootViewController (ViewLayout)

- (void)initializationDefaultData { }

- (void)setupNavigationBar { }

- (void)setupSubviews { }

- (void)setupSubviewsConstraints { }

@end




