//
//  UIButton+CCPButton.h
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CCPButton)

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


@end
