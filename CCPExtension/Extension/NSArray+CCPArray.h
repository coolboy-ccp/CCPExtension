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
- (void)writeTo:(NSString *)name;
/*
 * 去重
 */
- (NSArray *)removeDuplicate;

- (NSArray *)map:(id(^)(id value))block;

@end
