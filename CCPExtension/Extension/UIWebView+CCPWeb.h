//
//  UIWebView+CCPWeb.h
//  CCPExtension
//
//  Created by Ceair on 17/6/28.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (CCPWeb)
/*
 * 清除缓存
 */
- (void)cleanCache;
/*
 * 清除cookie
 */
- (void)cleanCookie;
@end
