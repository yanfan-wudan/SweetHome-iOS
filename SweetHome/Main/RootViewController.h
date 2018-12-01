//
//  RootViewController.h
//  SweetHome
//
//  Created by wudan on 2018/11/30.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WDNavigationBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface RootViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) WDNavigationBar * _Nullable wdNavigationBar;

/** 默认懒加载TableView，默认不显示，使用只需添加和布局到视图中即可 */
@property (nonatomic, strong) UITableView * _Nullable tableView;

@end

#pragma mark  页面布局
@interface  RootViewController (ViewLayout)

/** 初始化默认数据 */
- (void)initializationDefaultData;

/** 导航栏设置 */
- (void)setupNavigationBar;

/** 配置子控件 */
- (void)setupSubviews;

/** 布局子控件 */
- (void)setupSubviewsConstraints;

@end

NS_ASSUME_NONNULL_END
