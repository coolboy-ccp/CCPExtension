//
//  NSURL+CCPURL.h
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (CCPURL)

/*
 * 类似于string的format方法
 */
+ (NSURL *)url_format:(NSString *)format,...;
@end
