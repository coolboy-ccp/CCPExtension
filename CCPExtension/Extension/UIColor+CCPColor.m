//
//  UIColor+CCPColor.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "UIColor+CCPColor.h"

@implementation UIColor (CCPColor)


/*
 * 判断两种颜色是否相同
 */
- (BOOL)equalTo:(UIColor *)color {
    return CGColorEqualToColor(self.CGColor, color.CGColor);
}

/*
 * 16进制字符串
 */
+ (UIColor *)colorWithHex:(NSString *)hex {
    NSAssert(hex, @"hex can't be nil");
    u_int code = 0;
    u_char red,green,blue;
    NSScanner *sc = [NSScanner scannerWithString:hex];
    (void)[sc scanHexInt:&code];
    red = (u_char)(code >> 16);
    green = (u_char)(code >> 8);
    blue = (u_char)code;
    return [UIColor colorWithRed:(float)red/0xff green:(float)green/0xff blue:(float)blue/0xff alpha:1.0];
}

@end
