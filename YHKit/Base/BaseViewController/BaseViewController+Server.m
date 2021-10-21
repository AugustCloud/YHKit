//
//  BaseViewController+Server.m
//  YHKit
//
//  Created by 小河 on 2021/10/21.
//  Copyright © 2021 小河. All rights reserved.
//

#import "BaseViewController+Server.h"

@implementation BaseViewController (Server)

/** 滚动更新导航的背景颜色
 * offsetY 滚动视图的Y的偏移量
 * viewHeight 设置头部图片视图的高度
 */
- (void)scrollUploadNavBarStyleWithOffsetY:(CGFloat)offsetY
                                viewHeight:(CGFloat)viewHeight {
    if (self.navigationController == nil) {
        return;
    }
    
    //.设置状态栏
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    //.设置富文本属性
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];
    [titleTextAttributes setObject:offsetY<=5?[UIColor clearColor]:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [titleTextAttributes setObject:FontMediumWithSize(20) forKey:NSFontAttributeName];
    
    //
    if (@available(iOS 13, *)) {
        UINavigationBarAppearance *barApp = [[UINavigationBarAppearance alloc] init];
        //设置导航字体大小和颜色
        barApp.titleTextAttributes = titleTextAttributes;
        //重置导航的背景和阴影属性
        [barApp configureWithTransparentBackground];
        //设置导航背景图片
        barApp.backgroundImage = [UIImage imageWithColor:[RGBACOLOR(237, 121, 133, 1) colorWithAlphaComponent:(offsetY/viewHeight)]];
        
        self.navigationController.navigationBar.scrollEdgeAppearance = barApp;//带scroll滑动的页面
        self.navigationController.navigationBar.standardAppearance = barApp; // 常规页面
    }else {
        //设置导航字体大小和颜色
        self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
        //重置导航的背景和阴影属性
        self.navigationController.navigationBar.translucent = NO;
        //设置导航背景图片
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[RGBACOLOR(237, 121, 133, 1) colorWithAlphaComponent:(offsetY/viewHeight)]] forBarMetrics:UIBarMetricsDefault];
    }
    
}

/** 如果上级页面设置了滚动改变导航（调用了scrollUploadNavBarStyleWithOffsetY:viewHeight:方法）
 * 本界面要更改导航背景颜色和导航字体颜色，就调用该方法
 */
- (void)scrollAfterSettingNavBackgroundImagColor:(UIColor *)bgColor
                                   navTitleColor:(UIColor *)navTitleColor {
    //.设置状态栏
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];
    [titleTextAttributes setObject:navTitleColor forKey:NSForegroundColorAttributeName];
    [titleTextAttributes setObject:FontMediumWithSize(20) forKey:NSFontAttributeName];
    if (@available(iOS 13, *)) {
        UINavigationBarAppearance *barApp = [[UINavigationBarAppearance alloc] init];
        //设置导航字体大小和颜色
        barApp.titleTextAttributes = titleTextAttributes;
        //重置导航的背景和阴影属性
        [barApp configureWithTransparentBackground];
        //设置导航背景图片
        barApp.backgroundImage = [UIImage imageWithColor:bgColor];
        
        self.navigationController.navigationBar.scrollEdgeAppearance = barApp;//带scroll滑动的页面
        self.navigationController.navigationBar.standardAppearance = barApp; // 常规页面
    }else {
        //设置导航字体大小和颜色
        self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
        //重置导航的背景和阴影属性
        self.navigationController.navigationBar.translucent = NO;
        //设置导航背景图片
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:bgColor]  forBarMetrics:UIBarMetricsDefault];
    }
}


@end
