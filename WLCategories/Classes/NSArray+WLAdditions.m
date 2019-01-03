//
//  NSArray+WLAdditions.m
//  XDBUIComponents_Example
//
//  Created by Fallrainy on 2018/6/11.
//  Copyright © 2018年 nomeqc@gmail.com. All rights reserved.
//

#import "NSArray+WLAdditions.h"

@implementation NSArray (WLAdditions)

- (void)wl_each:(void (^)(id obj))block
{
    NSParameterAssert(block != nil);
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (void)wl_apply:(void (^)(id obj))block
{
    NSParameterAssert(block != nil);
    
    [self enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (id)wl_match:(BOOL (^)(id obj))block
{
    NSParameterAssert(block != nil);
    
    NSUInteger index = [self indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj);
    }];
    
    if (index == NSNotFound)
        return nil;
    
    return self[index];
}

- (NSArray *)wl_select:(BOOL (^)(id obj))block
{
    NSParameterAssert(block != nil);
    return [self objectsAtIndexes:[self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj);
    }]];
}

- (NSArray *)wl_reject:(BOOL (^)(id obj))block
{
    NSParameterAssert(block != nil);
    return [self wl_select:^BOOL(id obj) {
        return !block(obj);
    }];
}

- (NSArray *)wl_map:(id (^)(id obj))block
{
    NSParameterAssert(block != nil);
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id value = block(obj) ?: [NSNull null];
        [result addObject:value];
    }];
    
    return result;
}

- (BOOL)wl_any:(BOOL (^)(id obj))block
{
    return [self wl_match:block] != nil;
}

- (BOOL)wl_none:(BOOL (^)(id obj))block
{
    return [self wl_match:block] == nil;
}

- (BOOL)wl_all:(BOOL (^)(id obj))block
{
    NSParameterAssert(block != nil);
    
    __block BOOL result = YES;
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (!block(obj)) {
            result = NO;
            *stop = YES;
        }
    }];
    
    return result;
}

- (void)wl_enumerateObjectsUsingBlock:(void (NS_NOESCAPE ^)(id obj, id lastObj, NSUInteger idx, BOOL *stop))block {
    __block id lastObject = nil;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (block) {
            block(obj, lastObject, idx, stop);
        }
        lastObject = obj;
    }];
}

- (NSArray<NSArray *> *)wl_groupArrayWithSize:(NSUInteger)size {
    NSMutableArray *groupArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < self.count; i += size) {
        [groupArray addObject:[self subarrayWithRange:NSMakeRange(i, (i + size) < self.count? size : self.count - i)]];
    }
    return [groupArray copy];
}

@end
