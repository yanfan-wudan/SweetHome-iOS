//
//  DecorationServiceLeftView.h
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DecorationServiceLeftView;

@protocol DecorationServiceLeftViewDismissDelegate <NSObject>

- (void)decorationServiceLeftViewDismiss:(DecorationServiceLeftView *)view dismissAction:(_Nullable id)action;

@end

@interface DecorationServiceLeftView : UIView

@property (nonatomic, weak) id <DecorationServiceLeftViewDismissDelegate> delegate;

- (void)showViewInView:(UIView *)view;

- (void)dismissView;

@end

NS_ASSUME_NONNULL_END
