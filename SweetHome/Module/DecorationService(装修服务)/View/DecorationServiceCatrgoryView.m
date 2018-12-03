//
//  DecorationServiceCatrgoryView.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "DecorationServiceCatrgoryView.h"

@interface DecorationServiceCatrgoryView () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *collectionView;

@end

@implementation DecorationServiceCatrgoryView


- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    
    self.collectionView = [[UIView alloc] init];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];
    
    self.collectionView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, kScreenHeight - kStatusBarHeight);
    
    [self setupRoundedCornersWithView:self.collectionView cutCorners:UIRectCornerTopLeft | UIRectCornerTopRight borderColor:UIColor.whiteColor borderWidth:0 viewColor:UIColor.whiteColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissView)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
}

- (void)showView {
    
    [UIApplication.sharedApplication.delegate.window addSubview:self];
    self.frame = UIScreen.mainScreen.bounds;
    self.alpha = 0;
    [UIView animateWithDuration:1.2 animations:^{
        self.collectionView.top = kStatusBarHeight;
        self.alpha = 1;
    }];
}

/**
 按钮的圆角设置
 
 @param view view类控件
 @param rectCorner UIRectCorner要切除的圆角
 @param borderColor 边框颜色
 @param borderWidth 边框宽度
 @param viewColor view类控件颜色
 */
- (void)setupRoundedCornersWithView:(UIView *)view cutCorners:(UIRectCorner)rectCorner borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth viewColor:(UIColor *)viewColor{
    
    CAShapeLayer *mask=[CAShapeLayer layer];
    UIBezierPath * path= [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(15,10)];
    mask.path=path.CGPath;
    mask.frame=view.bounds;
    
    
    CAShapeLayer *borderLayer=[CAShapeLayer layer];
    borderLayer.path=path.CGPath;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = borderColor.CGColor;
    borderLayer.lineWidth = borderWidth;
    borderLayer.frame = view.bounds;
    view.layer.mask = mask;
    [view.layer addSublayer:borderLayer]; 
}

- (void)dismissView {
    
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
        self.collectionView.top = kScreenHeight;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
