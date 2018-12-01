//
//  WDNavigationBar.m
//  SweetHome
//
//  Created by wudan on 2018/12/1.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "WDNavigationBar.h"


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
    [self addSubview:button];
    return button;
}

@end
