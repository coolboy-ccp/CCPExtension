//
//  UIView+CCPView.h
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CCPView)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint point;
@property (nonatomic, assign, readonly) CGFloat maxX;
@property (nonatomic, assign, readonly) CGFloat maxY;
@property (nonatomic, assign, readonly) CGFloat midX;
@property (nonatomic, assign, readonly) CGFloat midY;
@property (nonatomic, assign, readonly) CGFloat minX;
@property (nonatomic, assign, readonly) CGFloat minY;

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
/*
 * 完全复制当前view
 */
- (__kindof UIView *)copy;
/*
 * 获取当前页面截图
 * frame 截图范围
 */
- (UIImage *)renderImgIn:(CGRect)frame;

@end
