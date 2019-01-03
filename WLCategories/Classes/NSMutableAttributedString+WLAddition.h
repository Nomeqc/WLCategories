//
//  NSMutableAttributedString+WLAddition.h
//  XDBTest_Example
//
//  Created by Fallrainy on 2018/11/30.
//  Copyright © 2018 Nomeqc. All rights reserved.
//

#import <Foundation/Foundation.h>

NSMutableAttributedString *WLAttributedStringMake(NSString *string, UIColor *textColor, UIFont *font);

@interface NSMutableAttributedString (WLAddition)

+ (instancetype)wl_attributedStringWithString:(NSString *)string
                                        color:(UIColor *)color
                                         font:(UIFont *)font;

@end
