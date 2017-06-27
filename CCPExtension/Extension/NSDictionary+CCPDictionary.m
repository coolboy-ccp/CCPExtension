//
//  NSDictionary+CCPDictionary.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "NSDictionary+CCPDictionary.h"

@implementation NSDictionary (CCPDictionary)

- (NSString *)jsonString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}


@end
