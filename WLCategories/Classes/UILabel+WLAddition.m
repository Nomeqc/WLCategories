//
//  UILabel+WLAddition.m
//  XDBUIComponents_Example
//
//  Created by Fallrainy on 2018/5/28.
//  Copyright © 2018年 nomeqc@gmail.com. All rights reserved.
//

#import "UILabel+WLAddition.h"

@implementation UILabel (WLAddition)

+ (instancetype)wl_labelWithText:(NSString *)text
                       textColor:(UIColor *)textColor
                            font:(UIFont *)font {
    UILabel *label = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = text? :@"";
        label.textColor = textColor;
        label.font = font;
        label;
    });
    return label;
}

+ (instancetype)wl_labelWithTextColor:(UIColor *)textColor
                                 font:(UIFont *)font {
   return [self wl_labelWithText:@"" textColor:textColor font:font];
}

@end
