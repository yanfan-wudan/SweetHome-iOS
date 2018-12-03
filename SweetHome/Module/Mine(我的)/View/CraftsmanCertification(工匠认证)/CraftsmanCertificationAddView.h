//
//  CraftsmanCertificationAddView.h
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CraftsmanCertificationAddView;

@protocol CraftsmanCertificationAddViewDelegate <NSObject>

- (void)craftsmanCertificationAddView:(CraftsmanCertificationAddView *)view touchedAddButton:(UIButton *)addButton;

@end

@interface CraftsmanCertificationAddView : UIView

@property (nonatomic, weak) id <CraftsmanCertificationAddViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
