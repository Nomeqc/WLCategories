//
//  NSObject+WLNotificationObserve.m
//  WLCategories_Example
//
//  Created by Fallrainy on 2018/9/25.
//  Copyright © 2018年 nomeqc@gmail.com. All rights reserved.
//

#import "NSObject+WLNotificationObserve.h"
#import <objc/message.h>


@interface __WLNotificationHandler : NSObject

- (void)observeNotificationWithName:(NSString *)notificationName object:(id)object handler:(WLNotificationHandlerBlock)handler;

@end

@interface __WLNotificationHandler ()

@property (nonatomic) NSMutableDictionary<NSString *, WLNotificationHandlerBlock> *handlerMap;

@end


@implementation __WLNotificationHandler

//- (void)dealloc {
//    NSLog(@"%s",__func__);
//}

- (void)observeNotificationWithName:(NSString *)name object:(id)object handler:(WLNotificationHandlerBlock)handler {
    NSParameterAssert([name isKindOfClass:[NSString class]]);
    _handlerMap = [NSMutableDictionary dictionaryWithDictionary:_handlerMap];
    BOOL inObserving = (BOOL)_handlerMap[name];
    //如果没有监听通知，则监听此通知
    if (!inObserving) {
        if (handler) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveNotification:) name:name object:object];
        }
    } else if (!handler) {//如果已监听此通知且handler为nil,则移除此通知
        [[NSNotificationCenter defaultCenter] removeObserver:self name:name object:object];
    }
    _handlerMap[name] = [handler copy];
}

- (void)didReceiveNotification:(NSNotification *)notification {
    WLNotificationHandlerBlock block = _handlerMap[notification.name];
    if (block) {
        block(notification);
    }
}

@end


static void *NSObjectNotificationHandlerKey = &NSObjectNotificationHandlerKey;

@implementation NSObject (WLNotificationObserve)

- (void)wl_observeNotificationWithName:(NSString *)name object:(id)object handler:(WLNotificationHandlerBlock)handlerBlock {
    __WLNotificationHandler *handler = [self wl_notificationHandler];
    [handler observeNotificationWithName:name object:object handler:handlerBlock];
}

- (__WLNotificationHandler *)wl_notificationHandler {
    id handler = objc_getAssociatedObject(self, NSObjectNotificationHandlerKey);
    if (!handler) {
        handler = [[__WLNotificationHandler alloc] init];
        objc_setAssociatedObject(self, NSObjectNotificationHandlerKey, handler, OBJC_ASSOCIATION_RETAIN);
    }
    return handler;
}



@end
