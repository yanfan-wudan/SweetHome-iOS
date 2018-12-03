//
//  DecorationServiceViewController.m
//  SweetHome
//
//  Created by wudan on 2018/11/30.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "DecorationServiceViewController.h"

// View
#import "DecorationServiceLeftView.h"
#import "DecorationServiceCatrgoryView.h"

@interface DecorationServiceViewController () <DecorationServiceLeftViewDismissDelegate>

@property (nonatomic, strong) DecorationServiceLeftView *leftView;
@property (nonatomic, assign) BOOL isShowLeft;
@property (nonatomic, strong) DecorationServiceCatrgoryView *categoryView;

@end

@implementation DecorationServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initializationDefaultData {
    self.isShowLeft = false;
}

- (void)setupNavigationBar {
    self.wdNavigationBar.backgroundColor = RGBCOLOR(66, 146, 183);
    [self.wdNavigationBar.leftButton setTitle:@"三" forState:UIControlStateNormal];
    [self.wdNavigationBar.leftButton setImage:nil forState:UIControlStateNormal];
    [self.wdNavigationBar.leftButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    
    self.leftView = [[DecorationServiceLeftView alloc] init];
    self.leftView.delegate = self;
    
    __weak typeof(self) weakSelf = self;
    self.wdNavigationBar.leftButtonBlock = ^{
        [weakSelf showLeftView:weakSelf.isShowLeft];
    };
    
    [self.wdNavigationBar.leftSecondButton setTitle:@"查找工匠" forState:UIControlStateNormal];
    [self.wdNavigationBar.leftSecondButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.categoryView showView];
}

- (void)showLeftView:(BOOL)isShow {
    if (isShow) {
        self.wdNavigationBar.leftButton.transform = CGAffineTransformMakeRotation(-M_PI);
        [self.wdNavigationBar.leftButton setTitle:@"三" forState:UIControlStateNormal];
        self.isShowLeft = false;
        [self.leftView dismissView];
    } else {
         self.isShowLeft = true;
        self.wdNavigationBar.leftButton.transform = CGAffineTransformMakeRotation(-M_PI);
        [self.wdNavigationBar.leftButton setTitle:@"->" forState:UIControlStateNormal];
        [self.leftView showViewInView:self.view];
    }
}

#pragma mark - DecorationServiceLeftViewDismissDelegate

- (void)decorationServiceLeftViewDismiss:(DecorationServiceLeftView *)view dismissAction:(id)action {
    self.isShowLeft = false;
    self.wdNavigationBar.leftButton.transform = CGAffineTransformMakeRotation(-M_PI);
    [self.wdNavigationBar.leftButton setTitle:@"三" forState:UIControlStateNormal];
}

- (DecorationServiceCatrgoryView *)categoryView {
    if (!_categoryView) {
        _categoryView = [[DecorationServiceCatrgoryView alloc] init];
    }
    return _categoryView;
}

@end
