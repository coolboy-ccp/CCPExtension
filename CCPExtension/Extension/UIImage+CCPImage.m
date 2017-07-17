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
- (NSString *)base64By:(CGFloat)scale {
    return [UIImageJPEGRepresentation(self, scale) base64EncodedStringWithOptions:0];
}

/*
 * 添加文字
 */
- (UIImage *)add_text:(NSString *)string attribute:(NSDictionary *)attribute frame:(CGRect)frame {
    UIImage *newImg;
    UIGraphicsBeginImageContext(self.size);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    /*
     * CGRectIntegral
     * origin向下调整到最近整数
     * size向上调整到最近整数
     * 重新生成的cgrect可以完全包含原来的rect
     */
    [string drawInRect:CGRectIntegral(frame) withAttributes:attribute];
    newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImg;
}

/*
 * 修改透明度
 */
- (UIImage *)change_alpha:(CGFloat)alpha {
    UIImage *newImg;
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -rect.size.height);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, rect, self.CGImage);
    newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImg;
}



@end
