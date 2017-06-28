//
//  UIWebView+CCPWeb.m
//  CCPExtension
//
//  Created by Ceair on 17/6/28.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "UIWebView+CCPWeb.h"

@implementation UIWebView (CCPWeb)

/*
 * 清除缓存
 */
- (void)cleanCache {
    NSURLCache *cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    [cache setDiskCapacity:0];
    [cache setMemoryCapacity:0];
}
/*
 * 清除cookie
 */
- (void)cleanCookie {
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    [[storage cookies] enumerateObjectsUsingBlock:^(NSHTTPCookie * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [storage deleteCookie:obj];
    }];
}

@end
