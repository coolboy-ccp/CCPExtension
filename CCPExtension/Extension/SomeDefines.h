//
//  SomeDefines.h
//  CCPExtension
//
//  Created by Ceair on 17/6/30.
//  Copyright © 2017年 ccp. All rights reserved.
//

#ifndef SomeDefines_h
#define SomeDefines_h

/*
 * 打印设置
 * 测试模式打印
 * 非测试模式不打印
 * 更换环境路径:
 * 1.Target->BuildSettings->Preprocessor Macros->Debug
 * 2.Product->Scheme->SchemeEdit Scheme
 */

#ifdef DEBUG
#define NSLog(...) NSLog(@"func:%s line: \n%@\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

/*
 * 沙盒目录
 */
#define path_temp             NSTemporaryDirectory()
#define path_document         [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, \
                              NSUserDomainMask, YES) firstObject]
#define path_cache            [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, \
                              NSUserDomainMask, YES) firstObject]
//UIKIT_EXTERN(extern) NSString *const

/*
 * dispatch
 */
#define dispatch_main(block)     dispatch_async(dispatch_get_main_queue(), block);
#define dispatch_global(block)   dispatch_async(dispatch_get_global_queue \
                                 (DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
/*
 * 一些界面设方法
 */
#define rgba(r,g,b,a)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 \
                                 alpha:a/1.0]
#define main_bounds              [UIScreen mainScreen].bounds
#define main_width               [UIScreen mainScreen].bounds.size.width
#define main_height              [UIScreen mainScreen].bounds.size.height

/*
 * 引用修饰
 */
#define WS(obj) /*autoreleasepool{}*/ __weak typeof(obj) obj##Weak = obj;
#define SS(obj) __strong typeof(obj) obj##Strong = obj;
#define BS(obj) autoreleasepool{} __block typeof(obj) obj##Block = obj;

//当前系统语言
#define current_language         [[NSLocale preferredLanguages] objectAtIndex:0]

/*
 * 快速单例
 */
#undef   singleton_def
#define  singleton_def(__class) \
+ (__class *)shareInstance**__class;

#undef singleton_imp
#define singleton_imp(__class) \
+ (__class *)shareInstance##__class { \
static dispatch_once_t once; \
static __class *__singleton__; \
dispatch_once(&once,^{__singleton__ = [[__class alloc] init];}); \
return __singleton__; \
}



#endif /* SomeDefines_h */
