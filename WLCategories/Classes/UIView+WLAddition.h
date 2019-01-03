//
//  UIView+WLAddition.h
//  XDBUIComponents_Example
//
//  Created by Fallrainy on 2018/5/28.
//  Copyright © 2018年 nomeqc@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WLAddition)

///添加顶部分割线
- (UIView *)wl_additionTopHairLineWithColor:(UIColor *)color
                                 marginLeft:(CGFloat)marginLeft
                                marginRight:(CGFloat)marginRight;

///添加底部分割线
- (UIView *)wl_additionBottomHairLineWithColor:(UIColor *)color
                                 marginLeft:(CGFloat)marginLeft
                                   marginRight:(CGFloat)marginRight;

///添加左边分割线
- (UIView *)wl_additionLeftHairLineWithColor:(UIColor *)color
                                    marginTop:(CGFloat)marginTop
                                marginBottom:(CGFloat)marginBottom;
///添加右边分割线
- (UIView *)wl_additionRightHairLineWithColor:(UIColor *)color
                                   marginTop:(CGFloat)marginTop
                                marginBottom:(CGFloat)marginBottom;

/// 添加边框
- (void)wl_applyBorderWithColor:(UIColor *)borderColor
                    borderWidth:(CGFloat)borderWidth;
/// 添加圆角
- (void)wl_applyCornerRaidus:(CGFloat)cornerRadius;

@end
