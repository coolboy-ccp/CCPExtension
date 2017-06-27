//
//  UIImage+CCPImage.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "UIImage+CCPImage.h"

@implementation UIImage (CCPImage)

/*
 * 压缩图片
 * ps 用于网络上传
 */
- (NSString *)compress:(CGFloat)scale {
    return [UIImageJPEGRepresentation(self, scale) base64EncodedStringWithOptions:0];
}

@end
