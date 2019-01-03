//
//  UIView+WLAddition.m
//  XDBUIComponents_Example
//
//  Created by Fallrainy on 2018/5/28.
//  Copyright © 2018年 nomeqc@gmail.com. All rights reserved.
//

#import "UIView+WLAddition.h"
#import "Masonry.h"

@implementation UIView (WLAddition)

- (UIView *)wl_additionTopHairLineWithColor:(UIColor *)color
                                 marginLeft:(CGFloat)marginLeft
                                marginRight:(CGFloat)marginRight {
    UIView *view = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = color;
        view;
    });
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(marginLeft);
        make.right.offset(-marginRight);
        make.height.mas_equalTo(1/[UIScreen mainScreen].scale);
    }];
    return view;
}

- (UIView *)wl_additionBottomHairLineWithColor:(UIColor *)color
                                    marginLeft:(CGFloat)marginLeft
                                   marginRight:(CGFloat)marginRight {
    UIView *view = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = color;
        view;
    });
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.left.offset(marginLeft);
        make.right.offset(-marginRight);
        make.height.mas_equalTo(1 / [UIScreen mainScreen].scale);
    }];
    return view;
}

- (UIView *)wl_additionLeftHairLineWithColor:(UIColor *)color
                                   marginTop:(CGFloat)marginTop
                                marginBottom:(CGFloat)marginBottom {
    UIView *view = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = color;
        view;
    });
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(marginTop);
        make.bottom.offset(-marginBottom);
        make.width.mas_equalTo(1 / [UIScreen mainScreen].scale);
    }];
    return view;
}

- (UIView *)wl_additionRightHairLineWithColor:(UIColor *)color
                                   marginTop:(CGFloat)marginTop
                                marginBottom:(CGFloat)marginBottom {
    UIView *view = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = color;
        view;
    });
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.offset(marginTop);
        make.bottom.offset(-marginBottom);
        make.width.mas_equalTo(1 / [UIScreen mainScreen].scale);
    }];
    return view;
}

- (void)wl_applyBorderWithColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}

- (void)wl_applyCornerRaidus:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

@end
