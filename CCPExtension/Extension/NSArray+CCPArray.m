//
//  NSArray+CCPArray.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "NSArray+CCPArray.h"
#import "NSString+CCPString.h"

@implementation NSArray (CCPArray)

/*
 * 创建文件名为 name的plist
 * 将数组存储到 name文件中
 */
- (void)writeTo:(NSString *_Nonnull)name {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *baseP = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fp = [baseP add:[name add:@".plist"]];
    if (![fm fileExistsAtPath:fp]) {
        [fm createFileAtPath:fp contents:nil attributes:nil];
    }
    [self writeToFile:fp atomically:YES];
}
/*
 * 去重
 */
- (NSArray *_Nonnull)removeDuplicate {
    return [self valueForKey:@"distinctUnionOfObjects.self"];
}

/*
 * 根据条件去重
 */
- (NSArray *_Nonnull)removeDuplicate:(BOOL(^)(id obj))condition {
    NSMutableArray *marr = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BOOL cd = condition(obj);
        if (cd) {
            [marr addObject:obj];
        }
    }];
    return marr.copy;
}

/*
 * 去除两个数组中相同元素
 */
- (NSArray *_Nonnull)removeDuplicateBy:(NSArray *_Nonnull)duplicate {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",duplicate];
    return [self filteredArrayUsingPredicate:predicate];
}

/*
 * 映射
 * ps 这个不知道有没有问题,目前项目中用到的都没有啥问题,求指点
 */
- (NSArray *)map:(id(^)(id value))block {
    NSMutableArray *marr = self.mutableCopy;
    [marr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id value = block(obj);
        [marr replaceObjectAtIndex:idx withObject:value];
    }];
    return marr.copy;
}


@end
