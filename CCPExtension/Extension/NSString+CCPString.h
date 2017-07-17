//
//  NSString+CCPString.h
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CCPString)


/*
 * 拼接
 */
- (NSString *_Nonnull)add:(NSString *_Nonnull)string;
/*
 * 返回一个富文本
 * dic 富文本属性
 * sub 需要特殊化的文本
 */
- (NSAttributedString *_Nonnull)ats:(NSDictionary *_Nonnull)dic sub:(NSString *_Nonnull)sub;
/*
 * 返回中英文首字母
 */
- (NSString *_Nonnull)char_first;
/*
 * 返回带图片的富文本
 * imgName 图片名称
 */
- (NSMutableAttributedString *_Nonnull)ats:(NSString *_Nonnull)imgName;

@end
