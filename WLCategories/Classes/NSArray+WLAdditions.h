//
//  NSArray+WLAdditions.h
//  XDBUIComponents_Example
//
//  Created by Fallrainy on 2018/6/11.
//  Copyright © 2018年 nomeqc@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray<ObjectType> (WLAdditions)

/** Loops through an array and executes the given block with each object.
 
 @param block A single-argument, void-returning code block.
 */
- (void)wl_each:(void (^)(ObjectType obj))block;

/** Enumerates through an array concurrently and executes
 the given block once for each object.
 
 Enumeration will occur on appropriate background queues. This
 will have a noticeable speed increase, especially on dual-core
 devices, but you *must* be aware of the thread safety of the
 objects you message from within the block. Be aware that the
 order of objects is not necessarily the order each block will
 be called in.
 
 @param block A single-argument, void-returning code block.
 */
- (void)wl_apply:(void (^)(ObjectType obj))block;

/** Loops through an array to find the object matching the block.
 
 bk_match: is functionally identical to bk_select:, but will stop and return
 on the first match.
 
 @param block A single-argument, `BOOL`-returning code block.
 @return Returns the object, if found, or `nil`.
 @see bk_select:
 */
- (id)wl_match:(BOOL (^)(ObjectType obj))block;

/** Loops through an array to find the objects matching the block.
 
 @param block A single-argument, BOOL-returning code block.
 @return Returns an array of the objects found.
 @see bk_match:
 */
- (NSArray<ObjectType> *)wl_select:(BOOL (^)(ObjectType obj))block;

/** Loops through an array to find the objects not matching the block.
 
 This selector performs *literally* the exact same function as bk_select: but in reverse.
 
 This is useful, as one may expect, for removing objects from an array.
 NSArray *new = [computers bk_reject:^BOOL(id obj) {
 return ([obj isUgly]);
 }];
 
 @param block A single-argument, BOOL-returning code block.
 @return Returns an array of all objects not found.
 */
- (NSArray<ObjectType> *)wl_reject:(BOOL (^)(ObjectType obj))block;

/** Call the block once for each object and create an array of the return values.
 
 This is sometimes referred to as a transform, mutating one of each object:
 NSArray *new = [stringArray bk_map:^id(id obj) {
 return [obj stringByAppendingString:@".png"]);
 }];
 
 @param block A single-argument, object-returning code block.
 @return Returns an array of the objects returned by the block.
 */
- (NSArray *)wl_map:(id (^)(ObjectType obj))block;

/** Loops through an array to find whether any object matches the block.
 
 This method is similar to the Scala list `exists`. It is functionally
 identical to bk_match: but returns a `BOOL` instead. It is not recommended
 to use bk_any: as a check condition before executing bk_match:, since it would
 require two loops through the array.
 
 For example, you can find if a string in an array starts with a certain letter:
 
 NSString *letter = @"A";
 BOOL containsLetter = [stringArray bk_any:^(id obj) {
 return [obj hasPrefix:@"A"];
 }];
 
 @param block A single-argument, BOOL-returning code block.
 @return YES for the first time the block returns YES for an object, NO otherwise.
 */
- (BOOL)wl_any:(BOOL (^)(ObjectType obj))block;

/** Loops through an array to find whether no objects match the block.
 
 This selector performs *literally* the exact same function as bk_all: but in reverse.
 
 @param block A single-argument, BOOL-returning code block.
 @return YES if the block returns NO for all objects in the array, NO otherwise.
 */
- (BOOL)wl_none:(BOOL (^)(ObjectType obj))block;

/** Loops through an array to find whether all objects match the block.
 
 @param block A single-argument, BOOL-returning code block.
 @return YES if the block returns YES for all objects in the array, NO otherwise.
 */
- (BOOL)wl_all:(BOOL (^)(ObjectType obj))block;

- (void)wl_enumerateObjectsUsingBlock:(void (NS_NOESCAPE ^)(ObjectType obj, ObjectType lastObj, NSUInteger idx, BOOL *stop))block;

///按照指定大小将元素分组，然后将每组(NSArray)放在一个数组里
- (NSArray<NSArray<ObjectType> *> *)wl_groupArrayWithSize:(NSUInteger)size;

@end
