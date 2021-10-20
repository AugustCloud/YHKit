//
//  UIColor+Utility.h
//  YHKit
//
//  Created by 小河 on 2021/10/20.
//  Copyright © 2021 小河. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Utility)

/**
 * 十六进制颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString
                          alpha:(CGFloat)alpha;

/**
 * 随机颜色
 */
+(UIColor *)randomColor;

/** 渐变色
 * view 需要渐变的视图
 * formPoint 开始的锚点 (0,0)为坐上点  (1,1)右下点
 * fromColor 开始的颜色
 * toPoint 结束的锚点
 * toColor 结束的颜色
 */
+ (void)setGradualChangingColor:(UIView *)view
                      formPoint:(CGPoint)formPoint
                      fromColor:(NSString *)fromHexColorStr
                        toPoint:(CGPoint)toPoint
                        toColor:(NSString *)toHexColorStr;

@end

NS_ASSUME_NONNULL_END
