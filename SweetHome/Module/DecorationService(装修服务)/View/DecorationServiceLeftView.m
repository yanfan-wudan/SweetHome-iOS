//
//  DecorationServiceLeftView.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "DecorationServiceLeftView.h"

@interface DecorationServiceLeftView () <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation DecorationServiceLeftView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    self.frame = CGRectMake(0,  (44 + UIApplication.sharedApplication.statusBarFrame.size.height), kScreenWidth, kScreenHeight - (kTabbarHeight + 44 + UIApplication.sharedApplication.statusBarFrame.size.height));
    self.tableView.frame = CGRectMake(-kScreenWidth * 0.8, 0, kScreenWidth * 0.8, self.frame.size.height);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissView)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
}

- (void)showViewInView:(UIView *)view {
    [self addSubview:self.tableView];
    [view addSubview:self];
    self.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
        self.tableView.left = 0;
    }];
}

- (void)dismissView {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
        self.tableView.left = -kScreenWidth * 0.8;
    } completion:^(BOOL finished) {
        [self.tableView removeFromSuperview];
        [self removeFromSuperview];
    }];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(decorationServiceLeftViewDismiss:dismissAction:)]) {
        [self.delegate decorationServiceLeftViewDismiss:self dismissAction:nil];
    }
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

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]){
        return NO;
    }
    
    return  YES;
}


#pragma mark - Getter
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
