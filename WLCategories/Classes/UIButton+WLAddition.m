//
//  UIButton+WLAddition.m
//  XDBUIComponents_Example
//
//  Created by Fallrainy on 2018/5/28.
//  Copyright © 2018年 nomeqc@gmail.com. All rights reserved.
//

#import "UIButton+WLAddition.h"

@implementation UIButton (WLAddition)

+ (instancetype)wl_buttonWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
                              font:(UIFont *)font {
    UIButton *button = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:titleColor forState:UIControlStateNormal];
        button.titleLabel.font = font;
        button;
    });
    return button;
}

@end
