//
//  HomeViewController.m
//  SweetHome
//
//  Created by wudan on 2018/11/30.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController () <UIScrollViewDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

// ======== 默认的四个方法
- (void)initializationDefaultData {

}

- (void)setupNavigationBar {
    [self.view addSubview:self.wdNavigationBar];
    self.wdNavigationBar.alpha = 0;
    [self.wdNavigationBar.centerButton setTitle:@"首页" forState:UIControlStateNormal];
    self.wdNavigationBar.leftButton.hidden = true;
}

- (void)setupSubviews {
    [self.view addSubview:self.tableView];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view bringSubviewToFront:self.wdNavigationBar];
    
}

- (void)setupSubviewsConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

// ========== END

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
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

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alpha = offsetY / (UIApplication.sharedApplication.statusBarFrame.size.height + 44);
    if (offsetY + (UIApplication.sharedApplication.statusBarFrame.size.height + 44) < 0) {
        self.wdNavigationBar.alpha = 0;
    } else {
        self.wdNavigationBar.alpha = alpha;
    }
}

@end
