//
//  NSObject+WLNotificationObserve.h
//  WLCategories_Example
//
//  Created by Fallrainy on 2018/9/25.
//  Copyright © 2018年 nomeqc@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^WLNotificationHandlerBlock)(NSNotification *notification);

@interface NSObject (WLNotificationObserve)

- (void)wl_observeNotificationWithName:(NSString *)name object:(id)object handler:(WLNotificationHandlerBlock)handler;

@end
