//
//  UIButton+WLAddition.h
//  XDBUIComponents_Example
//
//  Created by Fallrainy on 2018/5/28.
//  Copyright © 2018年 nomeqc@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (WLAddition)

///创建button 便利方法-设置标题、标题颜色、字体
+ (instancetype)wl_buttonWithTitle:(NSString *)title
                        titleColor:(UIColor *)titleColor
                              font:(UIFont *)font;

@end
