//
//  NSObject+CCPObject.h
//  CCPExtension
//
//  Created by Ceair on 17/6/27.
//  Copyright © 2017年 ccp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CCPObject)

/*
 * 创建一个弱引用的单例
 */
+ (instancetype)share_obj;
/*
 * 获得所有属性名称
 */
- (NSArray *)propertys_name;
/*
 * 获得所有属性类型
 */
- (NSArray *)propertys_type;
/*
 * 处理赋值时为空的情况
 * ps 若为空 返回
 * 1.@[]
 * 2.@{}
 * 3.@""
 */
//1.
- (NSArray *)arr:(id)oArr;
//2.
- (NSDictionary *)dic:(id)oDic;
//3. df:默认字符串
- (NSString *)str:(id)oStr _default:(NSString *)df;
/*
 * 从json中获取数据
 * sc : 获取成功 主线程
 * ps 以下两方法只能获取在mainBundle中的数据
 */
/*-------global--------*/
- (void)json_arr:(NSString *)name success:(void(^)(NSArray *arr))sc;
- (void)json_dic:(NSString *)name success:(void(^)(NSDictionary *dic))sc;
/*---------main-----------*/
- (void)main_json_arr:(NSString *)name success:(void(^)(NSArray *arr))sc;
- (void)main_json_dic:(NSString *)name success:(void(^)(NSDictionary *dic))sc;
/*
 * 从plist中获取数据
 * sc : 获取成功 主线程
 * ps 以下两方法只能获取在mainBundle中的数据
 */
/*---------global--------------*/
- (void)plist_arr:(NSString *)name success:(void(^)(NSArray *arr))sc;
- (void)plist_dic:(NSString *)name success:(void(^)(NSDictionary *dic))sc;
/*---------main-----------*/
- (void)main_plist_arr:(NSString *)name success:(void(^)(NSArray *arr))sc;
- (void)main_plist_dic:(NSString *)name success:(void(^)(NSDictionary *dic))sc;
/*
 * 从txt文件中获取文字
 * sc : 获取成功 主线程
 * ps 以下方法只能获取在mainBundle中的数据
 */
/*-----global-----*/
- (void)txt:(NSString *)name success:(void(^)(NSString *str))sc;
/*---------main-----------*/
- (void)main_txt:(NSString *)name success:(void(^)(NSString *str))sc;

/*
 * 方法交换
 * os 原方法
 * ps 交换方法
 */
- (void)exchange_method:(SEL)os place:(SEL)ps;
/*
 * 跳转到设置界面
 */
- (void)skip_setting;
@end
