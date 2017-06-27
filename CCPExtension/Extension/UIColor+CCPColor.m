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

@end
