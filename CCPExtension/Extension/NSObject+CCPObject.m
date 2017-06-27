//
//  NSObject+CCPObject.m
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import "NSObject+CCPObject.h"
#import <objc/runtime.h>
#import "NSArray+CCPArray.h"

@implementation NSObject (CCPObject)

/*
 * 获得所有属性名称
 */
- (NSArray *)propertys_name {
    u_int count;
    objc_property_t *ptys = class_copyPropertyList([self class], &count);
    NSMutableArray *marr = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        const char *ptyName = property_getName(ptys[i]);
        [marr addObject:[NSString stringWithUTF8String:ptyName]];
    }
    return marr;
}
/*
 * 获得所有属性类型
 */
- (NSArray *)propertys_type {
    u_int count;
    objc_property_t *ptys = class_copyPropertyList([self class], &count);
    NSMutableArray *marr = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        const char *type_c = property_getAttributes(ptys[i]);
        NSString *type_obj = [NSString stringWithUTF8String:type_c];
        type_obj = [type_obj componentsSeparatedByString:@"\","].firstObject;
        type_obj = [type_obj componentsSeparatedByString:@"T@\""].lastObject;
        [marr addObject:NSClassFromString(type_obj)];
    }
    return marr;
}
/*
 * 处理赋值时为空的情况
 * ps 若为空 返回
 * 1.@[]
 * 2.@{}
 * 3.@""
 */
//1.
- (NSArray *)arr:(id)oArr {
    NSArray *arr = @[];
    if (oArr != nil && oArr != [NSNull null] && [oArr isKindOfClass:[NSDictionary class]]) {
        arr = oArr;
    }
    return arr;
}
//2.
- (NSDictionary *)dic:(id)oDic {
    NSDictionary *dic = @{};
    if (oDic != nil && oDic != [NSNull null] && [oDic isKindOfClass:[NSDictionary class]]) {
        dic = oDic;
    }
    return dic;
}
//3.
- (NSString *)str:(id)oStr _default:(NSString *)df {
    NSCAssert(df, @"df can't be nil");
    NSString *str = df;
    if (oStr != nil && oStr != [NSNull null]) {
        str = [NSString stringWithFormat:@"%@",oStr];
    }
    return str;
}
/*
 * 从json中获取数据
 * sc : 获取成功 主线程
 * ps 以下两方法只能获取在mainBundle中的数据
 */
/*-------global--------*/
- (void)json_arr:(NSString *)name success:(void(^)(NSArray *arr))sc {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        id obj = [self bundle_obj:name type:@"geojson"];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (sc) {
                sc([self arr:obj]);
            }
        });
    });
}

- (void)json_dic:(NSString *)name success:(void(^)(NSDictionary *dic))sc {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        id obj = [self bundle_obj:name type:@"geojson"];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (sc) {
                sc([self dic:obj]);
            }
        });
    });
}

/*---------main-----------*/
- (void)main_json_arr:(NSString *)name success:(void(^)(NSArray *arr))sc {
    id obj = [self bundle_obj:name type:@"geojson"];
    if (sc) {
        sc([self arr:obj]);
    }
}

- (void)main_json_dic:(NSString *)name success:(void(^)(NSDictionary *dic))sc {
    id obj = [self bundle_obj:name type:@"geojson"];
    if (sc) {
        sc([self dic:obj]);
    }
}

/*
 * 从plist中获取数据
 * sc : 获取成功 主线程
 * ps 以下两方法只能获取在mainBundle中的数据
 */
/*---------global--------------*/
- (void)plist_arr:(NSString *)name success:(void(^)(NSArray *arr))sc {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        id obj = [self bundle_obj:name type:@"plist"];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (sc) {
                sc([self arr:obj]);
            }
        });
    });
}

- (void)plist_dic:(NSString *)name success:(void(^)(NSDictionary *dic))sc {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        id obj = [self bundle_obj:name type:@"plist"];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (sc) {
                sc([self dic:obj]);
            }
        });
    });
}

/*---------main-----------*/
- (void)main_plist_arr:(NSString *)name success:(void(^)(NSArray *arr))sc {
    id obj = [self bundle_obj:name type:@"plist"];
    if (sc) {
        sc([self arr:obj]);
    }
}

- (void)main_plist_dic:(NSString *)name success:(void(^)(NSDictionary *dic))sc {
    id obj = [self bundle_obj:name type:@"plist"];
    if (sc) {
        sc([self dic:obj]);
    }
}

- (id)bundle_obj:(NSString *)name type:(NSString *)type {
    NSString *pth = [[NSBundle mainBundle] pathForResource:name ofType:type];
    NSData *data = [NSData dataWithContentsOfFile:pth];
    id plistObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    return plistObj;
}
/*
 * 从txt文件中获取文字
 * sc : 获取成功 主线程
 * ps 以下方法只能获取在mainBundle中的数据
 */
/*-----global-----*/
- (void)txt:(NSString *)name success:(void(^)(NSString *str))sc {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        id obj = [self bundle_obj:name type:@"txt"];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (sc) {
                sc([self str:obj _default:@""]);
            }
        });
    });
}

/*---------main-----------*/
- (void)main_txt:(NSString *)name success:(void(^)(NSString *str))sc {
    id obj = [self bundle_obj:name type:@"txt"];
    if (sc) {
        sc([self str:obj _default:@""]);
    }
}




@end
