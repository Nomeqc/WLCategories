//
//  UIAlertController+WLAdditions.m
//  WLCategories
//
//  Created by Fallrainy on 2018/7/19.
//

#import "UIAlertController+WLAdditions.h"

@implementation UIAlertController (WLAdditions)

+ (UIAlertController *)wl_showWithTitle:(NSString *)title
                             message:(NSString *)message
                   cancelButtonTitle:(NSString *)cancelButtonTitle
                   otherButtonTitles:(NSArray *)otherButtonTitles
                            tapBlock:(UIAlertControllerCompletionBlock)tapBlock {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    void (^handler) (UIAlertAction *) = ^(UIAlertAction *action) {
        if (!tapBlock) {
            return;
        }
        NSInteger buttonIndex = [alertController.actions indexOfObject:action];
        tapBlock(alertController, buttonIndex);
    };
    [alertController addAction:[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:handler]];
    for (NSString *buttonTitle in otherButtonTitles) {
        [alertController addAction:[UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:handler]];
    }
    // Note: This viewController might not be visible anymore
    [alertController wl_presentFromRootViewController];
    return alertController;
}

- (void)wl_presentFromRootViewController {
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:self animated:YES completion:NULL];
}


- (void)setWl_preferredActionIndex:(NSUInteger)wl_preferredActionIndex {
    if (wl_preferredActionIndex < self.actions.count) {
        UIAlertAction *action = self.actions[wl_preferredActionIndex];
        if (@available(iOS 9, *)) {
            [self setPreferredAction:action];
        }
    }
}

- (NSUInteger)wl_preferredActionIndex {
    if (@available(iOS 9, *)) {
        if (self.preferredAction) {
            return [self.actions indexOfObject:self.preferredAction];
        }
    }
    return NSNotFound;
}

@end
