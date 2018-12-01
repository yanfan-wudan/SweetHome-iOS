//
//  UIButton+Addition.h
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, UIButtonLayoutStyle) {
    UIButtonLayoutStyleTop,       // 上图下字
    UIButtonLayoutStyleLeft,      // 左图右字
    UIButtonLayoutStyleRigtht,    // 右图左字
    UIButtonLayoutStyleBottom,    // 下图上字
};

@interface UIButton (Addition)

/**
 图片布局
 
 @param space 图文间距
 @param style 布局样式
 */
- (void)wd_buttonLayoutWithSpace:(CGFloat)space layoutStyle:(UIButtonLayoutStyle)style;

@end

NS_ASSUME_NONNULL_END
