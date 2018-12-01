//
//  UIButton+Addition.m
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "UIButton+Addition.h"

@implementation UIButton (Addition)

#pragma mark =============== 设置图文布局样式 ===============

- (void)wd_buttonLayoutWithSpace:(CGFloat)space layoutStyle:(UIButtonLayoutStyle)style {
    [self layoutIfNeeded];
    
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    CGFloat labelWidth = 0;
    CGFloat labelHeight = 0;
    
    if ([UIDevice currentDevice].systemVersion.floatValue >=8.0) {
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    switch (style) {
        case UIButtonLayoutStyleTop: {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, -imageHeight-space/2.0, 0);
        }
            break;
            
        case UIButtonLayoutStyleLeft: {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, space/2.0);
        }
            break;
            
        case UIButtonLayoutStyleBottom: {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, -imageWidth, 0);
        }
            break;
            
        case UIButtonLayoutStyleRigtht: {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - space/2.0, 0, imageWidth+space/2.0);
        }
            break;
            
        default:
            break;
    }
    
    self.titleEdgeInsets = labelEdgeInsets;
    
    self.imageEdgeInsets = imageEdgeInsets;
}


@end
