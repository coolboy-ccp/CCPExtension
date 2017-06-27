//
//  UIView+CCPView.h
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CCPView)

/*
 * 类似于alert的弹出动画
 */
- (void)alert_animation;

/*
 * 自动获取当前视图高度
 * ps:在确定各个子视图的相关约束情况下
 */
- (CGFloat)current_h;
/*
 * 自动获取当前视图宽度
 */
- (CGFloat)current_w;
/*
 * 清除所有子视图
 */
- (void)removeAllSubviews;
/*
 * 获取当前视图所在控制器
 */
- (__kindof UIViewController *)vc;

@end
