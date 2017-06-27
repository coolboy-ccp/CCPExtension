//
//  UIViewController+CCPVC.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "UIViewController+CCPVC.h"

@implementation UIViewController (CCPVC)


/*
 * storyboard 创建vc
 */
- (__kindof UIViewController *)vc:(NSString *)name idf:(NSString *)idf {
    __kindof UIViewController *vc;
    if (idf) {
        vc = [[UIStoryboard storyboardWithName:name bundle:nil] instantiateViewControllerWithIdentifier:idf];
    }
    else {
        vc = [[UIStoryboard storyboardWithName:name bundle:nil] instantiateInitialViewController];
    }
    return vc;
}

/*
 * 返回到navigation的指定界面
 * cls 指定界面类
 */
- (void)back:(Class)cls {
    [self.navigationController.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:cls]) {
            [self.navigationController popToViewController:obj animated:YES];
            *stop = YES;
        }
    }];
}

@end
