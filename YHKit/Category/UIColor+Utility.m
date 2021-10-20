//
//  UIColor+Utility.m
//  YHKit
//
//  Created by 小河 on 2021/10/20.
//  Copyright © 2021 小河. All rights reserved.
//

#import "UIColor+Utility.h"

@implementation UIColor (Utility)

+ (UIColor *)colorWithHexString:(NSString *)hexString {
  return [UIColor colorWithHexString:hexString alpha:1.f];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
                          alpha:(CGFloat)alpha {
    
  NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
  
  CGFloat colorAlpha, red, blue, green;
  switch ([colorString length]) {
    case 3:  { // #RGB
      colorAlpha = alpha;
      red   = [self colorComponentFrom: colorString start: 0 length: 1];
      green = [self colorComponentFrom: colorString start: 1 length: 1];
      blue  = [self colorComponentFrom: colorString start: 2 length: 1];
    }
      break;
      
    case 4: { // #ARGB
      colorAlpha = [self colorComponentFrom: colorString start: 0 length: 1];
      red   = [self colorComponentFrom: colorString start: 1 length: 1];
      green = [self colorComponentFrom: colorString start: 2 length: 1];
      blue  = [self colorComponentFrom: colorString start: 3 length: 1];
    }
      break;
      
    case 6: { // #RRGGBB
      colorAlpha = alpha;
      red   = [self colorComponentFrom: colorString start: 0 length: 2];
      green = [self colorComponentFrom: colorString start: 2 length: 2];
      blue  = [self colorComponentFrom: colorString start: 4 length: 2];
    }
      break;
      
    case 8: { // #AARRGGBB
      colorAlpha = [self colorComponentFrom: colorString start: 0 length: 2];
      red   = [self colorComponentFrom: colorString start: 2 length: 2];
      green = [self colorComponentFrom: colorString start: 4 length: 2];
      blue  = [self colorComponentFrom: colorString start: 6 length: 2];
    }
      break;
      
    default:
      return [UIColor blackColor];
      break;
  }
  
  return [UIColor colorWithRed:red
                         green:green
                          blue:blue
                         alpha:colorAlpha];
}

#pragma mark - Private Methods
+ (CGFloat)colorComponentFrom:(NSString *)string
                        start:(NSUInteger)start
                       length:(NSUInteger)length {
    
  NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
  NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
  unsigned hexComponent;
  [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
  
  return hexComponent / 255.0;
}

/*
 *随机颜色
 */
+(UIColor *)randomColor {
    static BOOL    seeded=NO;
    if(!seeded){
        seeded=YES;
        srandom(time(NULL));
    }
    CGFloat red=(CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green=(CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue=(CGFloat)random()/(CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

/** 渐变色
 * view 需要渐变的视图
 * formPoint 开始的锚点 (0,0)为坐上点  (1,1)右下点
 * fromColor 开始的颜色
 * toPoint 结束的锚点
 * toColor 结束的颜色
 */
+ (void )setGradualChangingColor:(UIView *)view
                       formPoint:(CGPoint)formPoint
                       fromColor:(NSString *)fromHexColorStr
                         toPoint:(CGPoint)toPoint
                         toColor:(NSString *)toHexColorStr {
    //CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    //创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:fromHexColorStr].CGColor,(__bridge id)[UIColor colorWithHexString:toHexColorStr].CGColor];
    //设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = formPoint;
    gradientLayer.endPoint = toPoint;
    //设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];
    //添加
    [view.layer insertSublayer:gradientLayer atIndex:0];
    [view.superview layoutIfNeeded];
    gradientLayer.frame = view.bounds;
    
    
    
}

@end
