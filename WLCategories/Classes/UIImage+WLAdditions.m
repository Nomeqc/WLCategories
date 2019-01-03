//
//  UIImage+WLAdditions.m
//  AFNetworking
//
//  Created by Fallrainy on 2018/11/7.
//

#import "UIImage+WLAdditions.h"

@implementation UIImage (WLAdditions)

- (UIImage *)wl_imageFitScreenScale {
    return [UIImage imageWithData:UIImagePNGRepresentation(self) scale:[UIScreen mainScreen].scale];
}

+ (UIImage *)appIcon60x60 {
    return [self wl_appIconWithWidth:60];
}

+ (UIImage *)appIcon40x40 {
    return [self wl_appIconWithWidth:40];
}

+ (UIImage *)appIcon29x29 {
    return [self wl_appIconWithWidth:29];
}

+ (UIImage *)appIcon20x20 {
    return [self wl_appIconWithWidth:20];
}

+ (UIImage *)wl_appIconWithWidth:(NSUInteger)width {
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    NSArray *imageNames = [infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"];
    __block NSString *imageName = nil;
    [imageNames enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([name rangeOfString:@(width).stringValue].location != NSNotFound) {
            *stop = YES;
            imageName = name;
        }
    }];
    return [UIImage imageNamed:imageName];
}

@end
