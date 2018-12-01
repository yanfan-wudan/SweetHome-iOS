//
//  MineHeaderView.h
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MineHeaderView;

@protocol MineHeaderViewDelegate <NSObject>

- (void)mineHeaderView:(MineHeaderView *)headerView loginButtonTouched:(UIButton *)button;

@end

@interface MineHeaderView : UIView

- (void)setupIfWithoutLogin;

@property (nonatomic, weak) id <MineHeaderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
