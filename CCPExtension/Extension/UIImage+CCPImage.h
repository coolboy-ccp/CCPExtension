//
//  UIImage+CCPImage.h
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CCPImage)
/*
 * 压缩图片 
 * ps 用于网络上传
 */
- (NSString *)base64By:(CGFloat)scale;
/*
 * 添加文字
 */
- (UIImage *)add_text:(NSString *)string attribute:(NSDictionary *)attribute frame:(CGRect)frame;
/*
 * 修改透明度
 */
- (UIImage *)change_alpha:(CGFloat)alpha;
@end
