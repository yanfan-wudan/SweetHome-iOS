//
//  CraftsmanCertificationTypeOfWorkView.h
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CraftsmanCertificationTypeOfWorkView : UIView

@property (nonatomic, strong) NSArray<NSString *> *tagArray;
- (CGFloat)getHeight;

@end

NS_ASSUME_NONNULL_END
