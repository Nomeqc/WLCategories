//
//  UILabel+WLAddition.h
//  XDBUIComponents_Example
//
//  Created by Fallrainy on 2018/5/28.
//  Copyright © 2018年 nomeqc@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WLAddition)

+ (instancetype)wl_labelWithText:(NSString *)text
                       textColor:(UIColor *)textColor
                            font:(UIFont *)font;

+ (instancetype)wl_labelWithTextColor:(UIColor *)textColor
                                 font:(UIFont *)font;

@end
