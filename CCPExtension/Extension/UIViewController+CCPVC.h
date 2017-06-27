//
//  UIViewController+CCPVC.h
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CCPVC)
/*
 * storyboard 创建vc
 */
- (__kindof UIViewController *)vc:(NSString *)name idf:(NSString *)idf;
/*
 * 返回到navigation的指定界面
 * cls 指定界面类
 */
- (void)back:(Class)cls;
@end
