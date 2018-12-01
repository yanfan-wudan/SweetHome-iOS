//
//  WDNavigationBar.h
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WDNavigationBar : UIView

@property (nonatomic, assign) BOOL isShowBottomLine;

@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *leftSecondButton;
@property (nonatomic, strong) UIButton *centerButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIButton *rightSecondButton;

@property (nonatomic, copy) void (^ leftButtonBlock)(void);
@property (nonatomic, copy) void (^ leftSecondButtonBlock)(void);
@property (nonatomic, copy) void (^ centerButtonBlock)(void);
@property (nonatomic, copy) void (^ rightButtonBlock)(void);
@property (nonatomic, copy) void (^ rightSecondButtonBlock)(void);

@end

NS_ASSUME_NONNULL_END
