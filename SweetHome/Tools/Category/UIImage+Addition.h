//
//  UIImage+Addition.h
//  SweetHome
//
//  Created by wudan on 2018/11/30.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Addition)

/** 初始化Image对象读取为Template */
+ (UIImage *)wd_initTempModeImageWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
