//
//  UIView+CCPView.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "UIView+CCPView.h"
#import "NSArray+CCPArray.h"

@implementation UIView (CCPView)

/*----------布局属性---------------*/
- (void)setX:(CGFloat)x {
    CGRect rt = self.frame;
    rt.origin.x = x;
    self.frame = rt;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect rt = self.frame;
    rt.origin.y = y;
    self.frame = rt;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setH:(CGFloat)h {
    CGRect rt = self.frame;
    rt.size.height = h;
    self.frame = rt;
}

- (CGFloat)h {
    return self.bounds.size.height;
}

- (void)setW:(CGFloat)w {
    CGRect rt = self.frame;
    rt.size.width = w;
    self.frame = rt;
}

- (CGFloat)w {
    return self.bounds.size.width;
}

- (void)setSize:(CGSize)size {
    CGRect rt = self.frame;
    rt.size = size;
    self.frame = rt;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setPoint:(CGPoint)point {
    CGRect rt = self.frame;
    rt.origin = point;
    self.frame = rt;
}

- (CGPoint)point {
    return self.frame.origin;
}

- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)midX {
    return CGRectGetMidX(self.frame);
}

- (CGFloat)midY {
    return CGRectGetMidY(self.frame);
}

- (CGFloat)minX {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)minY {
    return CGRectGetMinY(self.frame);
}

/*---------以上为位置信息---------------------*/
/*
 * 类似于alert的弹出动画
 */
- (void)alert_animation {
    self.hidden = NO;
    self.alpha = 1.0;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = .35;
    animation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],[NSValue valueWithCATransform3D:CATransform3DIdentity]];
    animation.keyTimes = @[@0,@1];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.layer addAnimation:animation forKey:nil];
}

/*
 * 自动获取当前视图高度
 * ps:在确定各个子视图的相关约束情况下
 */
- (CGFloat)current_h {
    NSArray *hs = [self.subviews map:^id(UIView *value) {
        return @(CGRectGetMaxY(value.frame));
    }];
    CGFloat max = [[hs valueForKeyPath:@"@max.doubleValue"] doubleValue];
    return max;
}
/*
 * 自动获取当前视图宽度
 */
- (CGFloat)current_w {
    NSArray *ws = [self.subviews map:^id(UIView *value) {
        return @(CGRectGetMaxX(value.frame));
    }];
    CGFloat max = [[ws valueForKeyPath:@"@max.doubleValue"] doubleValue];
    return max;
}
/*
 * 清除所有子视图
 */
- (void)removeAllSubviews {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
}

/*
 * 获取当前视图所在控制器
 */
- (__kindof UIViewController *)vc {
    __kindof UIViewController *vc = nil;
    UIResponder *next = self.nextResponder;
    while (next) {
        if ([next isKindOfClass:[UIViewController class]]) {
            vc = (UIViewController *)next;
            break;
        }
        next = next.nextResponder;
    }
    return vc;
}

/*
 * 完全复制当前view
 */
- (__kindof UIView *)copy {
    NSData *ach = [NSKeyedArchiver archivedDataWithRootObject:self];
    return [NSKeyedUnarchiver unarchiveObjectWithData:ach];
}

/*
 * 获取当前页面截图
 * frame 截图范围
 */
- (UIImage *)renderImgIn:(CGRect)frame {
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    UIRectClip(frame);
    [self.layer renderInContext:ctx];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
