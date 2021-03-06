//
//  UILabel+CCPLabel.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "UILabel+CCPLabel.h"

@implementation UILabel (CCPLabel)

/*
 * 固定高度 自适应宽度
 * h 高度
 */
- (CGFloat)widthBy:(CGFloat)h {
    NSDictionary *arsDic = @{NSFontAttributeName:self.font,NSForegroundColorAttributeName:self.textColor};
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(10000, h) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:arsDic context:nil];
    return rect.size.width;
}
/*
 * 固定宽度 自适应高度
 * w 宽度
 */
- (CGFloat)heightBy:(CGFloat)w {
    NSDictionary *arsDic = @{NSFontAttributeName:self.font,NSForegroundColorAttributeName:self.textColor};
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake(w,10000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:arsDic context:nil];
    return rect.size.height;
}

/*
 * 添加下划线
 * color 下划线颜色 默认和label同色
 */
- (void)underLine:(UIColor *)color {
    if (color == nil) {
        color = self.textColor;
    }
    NSDictionary *atd = @{NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle),NSUnderlineColorAttributeName:color};
    NSMutableAttributedString *ats = [[NSMutableAttributedString alloc] initWithString:self.text attributes:atd];
    self.attributedText = ats;
}
/*
 * 添加中划线
 * color 中划线颜色 默认和label同色
 */
- (void)middleLine:(UIColor *)color {
    if (color == nil) {
        color = self.textColor;
    }
    NSDictionary *atd = @{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),NSUnderlineColorAttributeName:color};
    NSMutableAttributedString *ats = [[NSMutableAttributedString alloc] initWithString:self.text attributes:atd];
    self.attributedText = ats;
}


/*
 * 虚线边框
 * color: 边框颜色 默认为红色
 * corner: 边框圆角
 */
- (void)dotted_line_board:(UIColor *)color corner:(CGFloat)corner{
    color = color?:[UIColor redColor];
    self.layer.cornerRadius = corner;
    self.clipsToBounds = YES;
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = color.CGColor;
    border.fillColor = [UIColor clearColor].CGColor;
    border.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:corner].CGPath;
    border.lineWidth = 1.0;
    border.lineDashPattern = @[@2,@1];
    [self.layer addSublayer:border];
}
@end
