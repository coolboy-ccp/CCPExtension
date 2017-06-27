//
//  NSString+CCPString.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "NSString+CCPString.h"
#import <UIKit/UIKit.h>

@implementation NSString (CCPString)


/*
 * 拼接
 */
- (NSString *_Nonnull)add:(NSString *_Nonnull)string {
    return [self stringByAppendingString:string];
}

/*
 * 返回一个富文本
 * dic 富文本属性
 * sub 需要特殊化的文本
 */
- (NSAttributedString *_Nonnull)ats:(NSDictionary *_Nonnull)dic sub:(NSString *_Nonnull)sub {
    NSMutableAttributedString *mats = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange rg = [self rangeOfString:sub];
    [mats setAttributes:dic range:rg];
    return mats.copy;
}
/*
 * 返回中英文首字母
 */
- (NSString *_Nonnull)char_first {
    NSMutableString *mstr = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mstr, NULL, kCFStringTransformToLatin, NO);
    CFStringTransform((CFMutableStringRef)mstr, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *py = [mstr capitalizedString];
    return [py substringToIndex:1];
}
/*
 * 返回带图片的富文本
 * imgName 图片名称
 */
- (NSMutableAttributedString *_Nonnull)ats:(NSString *_Nonnull)imgName {
    NSMutableAttributedString *mats = [[NSMutableAttributedString alloc] initWithString:self];
    NSTextAttachment *tat = [[NSTextAttachment alloc] init];
    tat.image = [UIImage imageNamed:imgName];
    tat.bounds = CGRectMake(0, 0, tat.image.size.width, tat.image.size.height);
    NSAttributedString *tatString = [NSAttributedString attributedStringWithAttachment:tat];
    [mats appendAttributedString:tatString];
    return mats;
}

@end
