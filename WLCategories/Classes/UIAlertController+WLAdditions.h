//
//  UIAlertController+WLAdditions.h
//  WLCategories
//
//  Created by Fallrainy on 2018/7/19.
//

#import <UIKit/UIKit.h>

typedef void (^UIAlertControllerCompletionBlock) (UIAlertController *alertController, NSInteger buttonIndex);

@interface UIAlertController (WLAdditions)

+ (UIAlertController *)wl_showWithTitle:(NSString *)title
                             message:(NSString *)message
                   cancelButtonTitle:(NSString *)cancelButtonTitle
                   otherButtonTitles:(NSArray *)otherButtonTitles
                            tapBlock:(UIAlertControllerCompletionBlock)tapBlock;

- (void)wl_presentFromRootViewController;

@property (nonatomic) NSUInteger wl_preferredActionIndex;

@end
