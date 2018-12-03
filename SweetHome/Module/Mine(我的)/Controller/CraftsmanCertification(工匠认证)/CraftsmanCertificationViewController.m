//
//  CraftsmanCertificationViewController.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "CraftsmanCertificationViewController.h"

// View
#import "CraftsmanCertificationAddView.h"
#import "CraftsmanCertificationTableViewCell.h"

// Controller
#import "CraftsmanCertificationAddViewController.h"

@interface CraftsmanCertificationViewController () <CraftsmanCertificationAddViewDelegate>

@end

@implementation CraftsmanCertificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setupNavigationBar {
    self.wdNavigationBar.backgroundColor = RGBCOLOR(66, 146, 183);
    [self.wdNavigationBar.centerButton setTitle:@"我的认证" forState:UIControlStateNormal];
    [self.wdNavigationBar.centerButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}

- (void)setupSubviews {
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[CraftsmanCertificationTableViewCell class] forCellReuseIdentifier:@"CraftsmanCertificationTableViewCell"];
    CraftsmanCertificationAddView *addView = [[CraftsmanCertificationAddView alloc] init];
    addView.delegate = self;
    self.tableView.tableFooterView = addView;
}

- (void)setupSubviewsConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view);
        make.top.mas_equalTo(self.wdNavigationBar.mas_bottom);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view.mas_bottom);
        }
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CraftsmanCertificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CraftsmanCertificationTableViewCell" forIndexPath:indexPath];
    return cell;
}


#pragma mark - CraftsmanCertificationAddViewDelegate

- (void)craftsmanCertificationAddView:(CraftsmanCertificationAddView *)view touchedAddButton:(UIButton *)addButton {
    CraftsmanCertificationAddViewController *controller = [[CraftsmanCertificationAddViewController alloc] init];
    [self.navigationController pushViewController:controller animated:true];
}

@end
