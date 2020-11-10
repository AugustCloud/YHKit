//
//  BaseMacro.h
//  YHKit
//
//  Created by 毛云河 on 2020/4/22.
//  Copyright © 2020 小河. All rights reserved.
//

#ifndef BaseMacro_h
#define BaseMacro_h
/**
 * 这个是为了在开发和发布环境下，取到不同的值
 * #ifdef DEBUG
 *  在debug模式下会被引用的宏
 * #else
 *  在release模式下会被引用的宏
 * #endif
 */
#ifdef DEBUG

#define ISDEBUG YES
#define NSLog(...) NSLog(__VA_ARGS__)

#else

#define ISDEBUG NO
#define NSLog(...)

#endif

/*!
 * @-- iOS版本
 */
#define IOS_VERSION   [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS7_V        (IOS_VERSION >= 7.0f)
#define IOS8_V        (IOS_VERSION >= 8.0f)
#define IOS9_V        (IOS_VERSION >= 9.0f)
#define IOS10_V       (IOS_VERSION >= 10.0f)
#define IOS11_V       (IOS_VERSION >= 11.0f)
#define IOS11_3_V     (IOS_VERSION >= 11.3.0f)
#define IOS12_V       (IOS_VERSION >= 12.0f)
#define IOS13_V       (IOS_VERSION >= 13.0f)

/*!
 * @-- 屏幕大小
 */
#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREENBOUNDS [UIScreen mainScreen].bounds

/*!
 * @-- iOS型号
 */
#define IPhone4       ([UIScreen mainScreen].bounds.size.height == 480.0f)
#define IPhone5       ([UIScreen mainScreen].bounds.size.height == 568.0f)
#define IPhone6       ([UIScreen mainScreen].bounds.size.height == 667.0f)
#define IPhone6P      ([UIScreen mainScreen].bounds.size.height == 736.0f)
#define IPhone_X      (([[UIApplication sharedApplication] statusBarFrame].size.height == 44) ? YES : NO)

/*!
 * @-- 状态栏高度
 */
#define NavBarHeight         44.0f
#define TabBarHeight         49.0f
#define kTopStatusHeight    (IPhone_X?24:0)
#define kTopStatusBarHeight (IPhone_X?44:20)
#define kNavBarViewHeight   (IPhone_X?88:64)
#define kTabBarViewHeight   (IPhone_X?83:49)
#define BottomSafeHeight    (IPhone_X?34:0)

/*!
 * @-- 全局屏幕比例
 */
#define AutoSizeScaleX SCREENWIDTH/375
/*!
 * @-- 按X轴相对于4.7寸屏幕的比例缩放尺寸
 */
#define SizeX(size) AutoSizeScaleX*size

/*!
 * @-- USERDEFAULTS设置-本地存储键值
 * @-- get  取值
 * @-- save 存值
 */
#define USER_DEFAULTS_GET(key)         [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define USER_DEFAULTS_SAVE(value, key) [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];\
[[NSUserDefaults standardUserDefaults] synchronize]

/*!
 * @-- 弱引用，防止循环引用
 */
#define kWeakObject(object) __weak __typeof(object) weakObject = object

/*!
 * @-- 发送通知
 */
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];

/*!
 * @-- 接受通知
 */
#define KAddNotification(key,name)  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(key:) name:name object:nil];

/*!
 * @-- 平方常规
 */
#define FontWithSize(s)       [[[UIDevice currentDevice]systemVersion] floatValue] >= 9.0?[UIFont fontWithName:@"PingFangSC-Regular" size:s]:[UIFont fontWithName:@"Helvetica" size:s]
/*!
 * @-- 平方半黑体
 */
#define FontSemiboldSize(s)   [[[UIDevice currentDevice]systemVersion] floatValue] >= 9.0?[UIFont fontWithName:@"PingFangSC-Semibold" size:s]:[UIFont fontWithName:@"Helvetica" size:s]
/*!
 * @-- 平方粗体
 */
#define FontMediumWithSize(s) [[[UIDevice currentDevice]systemVersion] floatValue] >= 9.0?[UIFont fontWithName:@"PingFangSC-Medium" size:s]:[UIFont fontWithName:@"Helvetica" size:s]

/*!
 * @-- 颜色
 */
#define UIColorFromHex(s)  [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >>8))/255.0 blue:((s & 0xFF))/255.0 alpha:1.0]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define color(r, g, b)     [UIColor colorWithRed: r / 255.0 green: g / 255.0 blue: b / 255.0 alpha: 1.0]

#define HexWithAlpha(s,a)  [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >>8))/255.0 blue:((s & 0xFF))/255.0 alpha:a];

/**
 *  判断是否是空字符串 非空字符串 ＝ yes
 *
 *  @param string
 *
 *  @return
 */
#define  NOEmptyStr(string)  [string isKindOfClass:[NSNull class]] || string == nil || [string length] < 1 || [string isEqualToString:@"(null)"] || [string isEqualToString:@"<null>"] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0 ? NO : YES

/**
 *  判断是否是空字符串 空字符串 = yes
 *
 *  @param string
 *
 *  @return
 */
#define  IsEmptyStr(string) ([string isKindOfClass:[NSNull class]] || string == nil || [string length] < 1 || [string isEqualToString:@"(null)"] || [string isEqualToString:@"<null>"] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0)

/**
 *  APP 名称
 */
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

/**
 *  APP Build版本号
 */
#define APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/**
 *  APP 版本号
 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/**
 *  APP BundleID
 */
#define APP_BUNDLEID [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]


#endif /* BaseMacro_h */
