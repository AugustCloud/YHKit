//
//  BaseViewController+Server.h
//  YHKit
//
//  Created by 小河 on 2021/10/21.
//  Copyright © 2021 小河. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController (Server)

/** 滚动更新导航的背景颜色
 * offsetY 滚动视图的Y的偏移量
 * viewHeight 设置头部图片视图的高度
 */
- (void)scrollUploadNavBarStyleWithOffsetY:(CGFloat)offsetY
                                viewHeight:(CGFloat)viewHeight;

/** 如果上级页面设置了滚动改变导航（调用了scrollUploadNavBarStyleWithOffsetY:viewHeight:方法）
 * 本界面要更改导航背景颜色和导航字体颜色，就调用该方法
 */
- (void)scrollAfterSettingNavBackgroundImagColor:(UIColor *)bgColor
                                   navTitleColor:(UIColor *)navTitleColor;

@end

NS_ASSUME_NONNULL_END
