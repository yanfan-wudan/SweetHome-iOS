//
//  WDNavigationBar.m
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "WDNavigationBar.h"

@interface WDNavigationBar ()

@property (nullable, nonatomic, readonly) UIViewController *viewController;


@end

@implementation WDNavigationBar

- (void)setIsShowBottomLine:(BOOL)isShowBottomLine {
    _isShowBottomLine = isShowBottomLine;
    self.bottomView.hidden = !isShowBottomLine;
    
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
        [self addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.bottom.mas_equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
    }
    return _bottomView;
}

- (UIButton *)centerButton {
    if (!_centerButton) {
        _centerButton = [self setupButton];
        _centerButton.tag = 100;
        [_centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_bottom).mas_offset(-22);
            make.centerX.mas_equalTo(self);
        }];
    }
    return _centerButton;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [self setupButton];
        _leftButton.tag = 101;
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_bottom).mas_offset(-22);
            make.leading.mas_equalTo(self).inset(15);
        }];
    }
    return _leftButton;
}

- (UIButton *)leftSecondButton {
    if (!_leftSecondButton) {
        _leftSecondButton = [self setupButton];
        _leftSecondButton.tag = 102;
        [_leftSecondButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_bottom).mas_offset(-22);
            make.leading.mas_equalTo(self.leftButton.mas_trailing).mas_offset(10);
            [make.trailing.mas_equalTo(self.centerButton.mas_leading).mas_offset(-10) priorityLow];
        }];
    }
    return _leftSecondButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [self setupButton];
        _rightButton.tag = 103;
        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_bottom).mas_offset(-22);
            make.trailing.mas_equalTo(self).inset(15);
        }];
    }
    return _rightButton;
}

- (UIButton *)rightSecondButton {
    if (!_rightSecondButton) {
        _leftSecondButton = [self setupButton];
        _leftSecondButton.tag = 104;
        [_leftSecondButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_bottom).mas_offset(-22);
            make.trailing.mas_equalTo(self.rightButton.mas_leading).mas_offset(-10);
            [make.leading.mas_equalTo(self.centerButton.mas_leading).mas_offset(10) priorityLow];
        }];
    }
    return _leftSecondButton;
}


- (UIButton *)setupButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    button.adjustsImageWhenHighlighted = NO;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    return button;
}

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark - Private

- (void)buttonTouched:(UIButton *)sender {
    
    switch (sender.tag) {
        case 100:
        {
            if (self.centerButtonBlock) {
                self.centerButtonBlock();
            }
        }
            break;
        case 101:
        {
            [self.viewController.navigationController popViewControllerAnimated:YES];
            if (self.leftButtonBlock) {
                self.leftButtonBlock();
            }
        }
            break;
        case 102:
        {
            if (self.leftSecondButtonBlock) {
                self.leftSecondButtonBlock();
            }
        }
            break;
        case 103:
        {
            if (self.rightButtonBlock) {
                self.rightButtonBlock();
            }
        }
            break;
        case 104:
        {
            if (self.rightSecondButtonBlock) {
                self.rightSecondButtonBlock();
            }
        }
            break;
        default:
            break;
    }
}

@end
