//
//  UILabel+CCPLabel.h
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CCPLabel)
/*
 * 固定高度 自适应宽度
 * h 高度
 */
- (CGFloat)widthBy:(CGFloat)h;
/*
 * 固定宽度 自适应高度
 * w 宽度
 */
- (CGFloat)heightBy:(CGFloat)w;
/*
 * 添加下划线
 * color 下划线颜色 默认和label同色
 */
- (void)underLine:(UIColor *)color;
/*
 * 添加中划线
 * color 中划线颜色 默认和label同色
 */
- (void)middleLine:(UIColor *)color;
/*
 * 虚线边框
 * color: 边框颜色 默认为红色
 * corner: 边框圆角
 */
- (void)dotted_line_board:(UIColor *)color corner:(CGFloat)corner;
@end
