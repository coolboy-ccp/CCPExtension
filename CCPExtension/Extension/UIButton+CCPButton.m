//
//  UIButton+CCPButton.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "UIButton+CCPButton.h"
#import <objc/runtime.h>

@implementation UIButton (CCPButton)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeIn:self oSEL:@selector(sendAction:to:forEvent:) pSEL:@selector(ccp_sendAction:to:forEvent:)];
    });
}

- (void)ccp_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    //使UITextField失去焦点
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:target forEvent:nil];
    [self ccp_sendAction:action to:target forEvent:event];
}


/*----private------*/
/*
 * 交换方法
 * os: 原方法
 * ps: 交换方法
 * cls: 类
 */
+ (void)exchangeIn:(Class)cls oSEL:(SEL)os pSEL:(SEL)ps {
    Method om = class_getInstanceMethod(cls, os);
    Method pm = class_getInstanceMethod(cls, ps);
    BOOL addM = class_addMethod(cls, os, method_getImplementation(pm), method_getTypeEncoding(pm));
    if (addM) {
        class_replaceMethod(cls, ps, method_getImplementation(om), method_getTypeEncoding(om));
    }
    else {
        method_exchangeImplementations(om, pm);
    }
}

@end
