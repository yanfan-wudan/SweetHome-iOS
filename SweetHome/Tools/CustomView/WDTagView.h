//
//  WDTagView.h
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TagViewDelegate <NSObject>

@optional

- (void)handleSelectTag:(NSString *)keyWord;

@end

@interface WDTagView : UIView

@property (nonatomic, weak) id <TagViewDelegate> delegate;
@property (nonatomic, strong) NSArray * arr;

- (CGFloat)getHeight;

@end

NS_ASSUME_NONNULL_END
