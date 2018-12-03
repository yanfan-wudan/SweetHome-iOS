//
//  MineOrderOperationView.h
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MineOrderOperationView;

typedef NS_ENUM(NSInteger, MineOrderOperationType) {
    MineOrderOperationTypeWaitForOrder   = 0,   // 待接单
    MineOrderOperationTypePendingPayment = 1,   // 待付款
    MineOrderOperationTypeToBeComplete   = 2,   // 待完工
    MineOrderOperationTypeToBeEvaluated  = 3    // 待评价
};

@protocol MineOrderOperationViewDelagte <NSObject>

- (void)mineOrderOperationView:(MineOrderOperationView *)view didselectedType:(MineOrderOperationType)type;

@end

@interface MineOrderOperationView : UIView

@property (nonatomic, weak) id <MineOrderOperationViewDelagte> delegate;

@end

NS_ASSUME_NONNULL_END
