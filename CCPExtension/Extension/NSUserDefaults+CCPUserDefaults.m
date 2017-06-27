//
//  NSUserDefaults+CCPUserDefaults.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "NSUserDefaults+CCPUserDefaults.h"

@implementation NSUserDefaults (CCPUserDefaults)

/*
 * 删除所有记录
 * 无差别 整个工程的清除掉
 */
+ (void)clearAll {
    NSString *bid = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:bid];
}

@end
