//
//  NSArray+CCPArray.h
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CCPArray)

/*
 * 创建文件名为 name的plist
 * 将数组存储到 name文件中
 * ps :文件位于document文件夹中
 */
- (void)writeTo:(NSString *_Nonnull)name;
/*
 * 去重
 */
- (NSArray *_Nonnull)removeDuplicate;

- (NSArray *_Nonnull)map:(id _Nonnull(^_Nonnull)(id _Nonnull value))block;

/*
 * 根据条件去重
 */
- (NSArray *_Nonnull)removeDuplicate:(BOOL(^_Nonnull)(id _Nonnull  obj))condition;

/*
 * 去除两个数组中相同元素
 */
- (NSArray *_Nonnull)removeDuplicateBy:(NSArray *_Nonnull)duplicate;

@end
