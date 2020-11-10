//
//  UIImage+Color.h
//  TimeBank-User
//
//  Created by dawnnnnn c on 2019/11/15.
//  Copyright © 2019 xiaohe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)aColor;
+ (UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame;

- (UIImage *)imageReplaceWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
