//
//  UIImage+Addition.m
//  SweetHome
//
//  Created by wudan on 2018/11/30.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "UIImage+Addition.h"

@implementation UIImage (Addition)

+ (UIImage *)wd_initTempModeImageWithName:(NSString *)name {
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end
