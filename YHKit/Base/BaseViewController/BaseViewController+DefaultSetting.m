//
//  BaseViewController+DefaultSetting.m
//  YHKit
//
//  Created by 小河 on 2021/10/20.
//  Copyright © 2021 小河. All rights reserved.
//

#import "BaseViewController+DefaultSetting.h"

@implementation BaseViewController (DefaultSetting)

//配置View的默认设置
- (void)cofingViewDefaultSetting {
    //.设置底部tabbar隐藏
    self.hidesBottomBarWhenPushed = YES;
    //.防止滑动时，改变系统导航状态时产生的跳动
    self.extendedLayoutIncludesOpaqueBars = YES;
    //.设置模态为全屏
    self.modalPresentationStyle = UIModalPresentationFullScreen;
}

//设置scrollView不自动下压
- (void)setupScrollViewDefaultFarme {
    if (@available(iOS 11.0, *)) {
        //不使用最大标题行(在页面上就是scrollView不自动下压)
        self.navigationController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    } else {
        /**
         * automaticallyAdjustsScrollViewInsets 默认情况下自动计算滚动视图的内边距
         * YES 自动计算
         * NO 不自动计算
         */
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

//记录根视图状态
- (void)recordRootPageStatue {
    if (self.navigationController.viewControllers.count > 1) {
        self.isRootPage = NO;
    }else {
        self.isRootPage = YES;
    }
}

//设置导航默认状态
- (void)setupNavDefaultStatus {
    /** .设置导航状态栏颜色
     * 因为UINavigationController是ViewController里的最高层级，他将不会向下传递，会根据自身属性barStyle来决定状态栏颜色
     * UIBarStyleDefault 黑色
     * UIBarStyleBlack 白色
     * 注：在iOS13以上版本中需要在Info.plist里添加Appearance字段，值设置成Light
     */
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    //.设置导航标题富文本属性
    NSMutableDictionary *titleTextAttributes = [NSMutableDictionary dictionary];
    [titleTextAttributes setObject:[UIColor colorWithHexString:@"333333"] forKey:NSForegroundColorAttributeName];
    [titleTextAttributes setObject:FontMediumWithSize(20) forKey:NSFontAttributeName];
    
    /** .关于系统导航自定义的事情
     * 原因：iOS13之后更新了UINavigationBarAppearance这个属性，用它来设置系统导航，iOS15之后强制使用该属性来设置，之前的失效
     */
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *barApp = [[UINavigationBarAppearance alloc] init];
        //.设置导航标题字体的大小和颜色
        barApp.titleTextAttributes = titleTextAttributes;
        //.重置导航背景和阴影属性颜色(关闭毛玻璃效果)
        [barApp configureWithTransparentBackground];
        //.设置系统导航的背景颜色(位于导航最底层，会被背景图片遮住)
        barApp.backgroundColor = [UIColor whiteColor];
        //.设置导航背景图片(利用背景图片来改变系统导航的颜色)
        barApp.backgroundImage = [UIImage imageWithColor:[UIColor whiteColor]];
        //.设置导航分割线阴影图片
        barApp.shadowImage = [UIImage imageWithColor:[UIColor clearColor]];
    }else {
        //.设置导航标题字体的大小和颜色
        self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
        //.设置导航背景和阴影属性颜色(就是关闭毛玻璃效果)
        self.navigationController.navigationBar.translucent = NO;
        //.设置系统导航的背景颜色(位于导航最底层，会被背景图片遮住)
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        //.设置导航背景图片(利用背景图片来改变系统导航的颜色)
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
        //.设置导航分割线阴影图片
        self.navigationController.navigationBar.shadowImage = [UIImage new];
    }
    
}

//开启手势交互识别器
- (void)openInteractivePopGestureRecognizer {
    //.当自定义了leftBarButtonItem,系统自带的右滑返回就失效了，需要重新开启
    if (self.isRootPage == NO) {//当不是根视图的时候开启手势右滑返回
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
        self.navigationController.interactivePopGestureRecognizer.enabled  = YES;
    }
}

@end
