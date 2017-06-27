//
//  NSURL+CCPURL.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "NSURL+CCPURL.h"

@implementation NSURL (CCPURL)

/*
 * 类似于string的format方法
 */
+ (NSURL *)url_format:(NSString *)format,... {
    va_list args;
    va_start(args, format);
    NSString *str = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    return [self URLWithString:str];
}

@end
