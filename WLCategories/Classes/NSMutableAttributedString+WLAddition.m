//
//  NSMutableAttributedString+WLAddition.m
//  XDBTest_Example
//
//  Created by Fallrainy on 2018/11/30.
//  Copyright © 2018 Nomeqc. All rights reserved.
//

#import "NSMutableAttributedString+WLAddition.h"
#import "NSAttributedString+YYText.h"

NSMutableAttributedString *WLAttributedStringMake(NSString *string, UIColor *textColor, UIFont *font) {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string? :@""];
    attributedString.yy_color = textColor;
    attributedString.yy_font = font;
    return  attributedString;
}

@implementation NSMutableAttributedString (WLAddition)

+ (instancetype)wl_attributedStringWithString:(NSString *)string color:(UIColor *)color font:(UIFont *)font {
    return WLAttributedStringMake(string, color, font);
}

@end
