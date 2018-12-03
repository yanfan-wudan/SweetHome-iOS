//
//  WDTagView.m
//  SweetHome
//
//  Created by wudan on 2018/12/3.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "WDTagView.h"
#define Tag_ScreenWidth      [UIScreen mainScreen].bounds.size.width - 40 * kScreenRate

@interface WDTagView ()

@property (nonatomic, assign) CGFloat allHeight;
@property (nonatomic, strong) NSMutableArray<UIButton *> *buttonArray;
@property (nonatomic, strong) NSMutableArray<UIButton *> *selectedTitleArray;

@end

@implementation WDTagView

-(void)setArr:(NSArray *)arr{
    _arr = arr;
    self.buttonArray = [NSMutableArray array];
    CGFloat marginX = 5 * kScreenRate;
    CGFloat marginY = 8 * kScreenRate;
    CGFloat height = 28 * kScreenRate;
    UIButton * markBtn;
    for (int i = 0; i < _arr.count; i++) {
        CGFloat width =  [self calculateString:_arr[i] Width:12] +20;
        UIButton * tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (!markBtn) {
            tagBtn.frame = CGRectMake(0, marginY, width, height);
        } else {
            if (markBtn.frame.origin.x + markBtn.frame.size.width + marginX + width + marginX > Tag_ScreenWidth) {
                tagBtn.frame = CGRectMake(marginX, markBtn.frame.origin.y + markBtn.frame.size.height + marginY, width, height);
            } else {
                tagBtn.frame = CGRectMake(markBtn.frame.origin.x + markBtn.frame.size.width + marginX, markBtn.frame.origin.y, width, height);
            }
        }
        [tagBtn setTitle:_arr[i] forState:UIControlStateNormal];
        tagBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [tagBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self makeCornerRadius:5 borderColor:[UIColor lightGrayColor] layer:tagBtn.layer borderWidth:.5];
        markBtn = tagBtn;
        
        [tagBtn addTarget:self action:@selector(clickTo:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:markBtn];
        [self.buttonArray addObject:tagBtn];
    }
    CGRect rect = self.frame;
    rect.size.height = markBtn.frame.origin.y + markBtn.frame.size.height + marginY;
    self.frame = rect;
    self.allHeight = rect.size.height + 10 * kScreenRate;
    
    self.selectedTitleArray = [NSMutableArray array];
}

- (CGFloat)getHeight {
    return self.allHeight;
}

-(void)clickTo:(UIButton *)sender {
    
    if (self.selectedTitleArray.count < 4) {
        [self.selectedTitleArray addObject:sender];
    } else {
        [self.selectedTitleArray removeObjectAtIndex:0];
        [self.selectedTitleArray addObject:sender];
    }
    
    for (UIButton *button in self.buttonArray) {
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button.backgroundColor = UIColor.whiteColor;
        [self makeCornerRadius:5 borderColor:[UIColor lightGrayColor] layer:button.layer borderWidth:.5];
    }
    
    for (UIButton *button in self.selectedTitleArray) {
        button.backgroundColor = UIColor.grayColor;
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    }
    
    if ([self.delegate respondsToSelector:@selector(handleSelectTag:)]) {
        [self.delegate handleSelectTag:sender.titleLabel.text];
    }
}

-(void)makeCornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor layer:(CALayer *)layer borderWidth:(CGFloat)borderWidth {
    layer.cornerRadius = radius;
    layer.masksToBounds = YES;
    layer.borderColor = borderColor.CGColor;
    layer.borderWidth = borderWidth;
}

- (CGFloat)calculateString:(NSString *)str Width:(NSInteger)font {
    CGSize size = [str boundingRectWithSize:CGSizeMake(Tag_ScreenWidth, 100000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil].size;
    return size.width;
}

@end
