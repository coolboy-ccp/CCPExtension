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

@end
