//
//  BaseViewController.m
//  YHKit
//
//  Created by 毛云河 on 2020/4/12.
//  Copyright © 2020 小河. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        //1,设置模态为全屏
        self.modalPresentationStyle = UIModalPresentationFullScreen;
        //2,设置底部tabbar隐藏
        self.hidesBottomBarWhenPushed = YES;
        //3,防止滑动时，改变系统导航状态时产生的跳动
        self.extendedLayoutIncludesOpaqueBars = YES;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        //1,设置模态为全屏
        self.modalPresentationStyle = UIModalPresentationFullScreen;
        //2,设置底部tabbar隐藏
        self.hidesBottomBarWhenPushed = YES;
        //3,防止滑动时，改变系统导航状态时产生的跳动
        self.extendedLayoutIncludesOpaqueBars = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    } else {
        /**
         * automaticallyAdjustsScrollViewInsets 默认情况下自动计算滚动视图的内边距
         */
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [self setupNavBarSubViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupNavDefaultStatus];
}

- (void)setupNavBarSubViews {
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //当不是跟控制器的时候才添加返回按钮
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;//右滑手势开启
    } else  {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;//右滑手势关闭
    }
}

- (void)setupNavDefaultStatus {
    //1.设置导航的风格(这个会影响状态栏颜色的设置)
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    //2.设置导航半透明属性
    self.navigationController.navigationBar.translucent = NO;
    //3.设置导航的背景颜色（通过设置图片来达到这个目的）
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:RGBACOLOR(252, 58, 113, 1)] forBarMetrics:UIBarMetricsDefault];
    //4.设置导航上面的分割线(要和3配合使用)
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    //self.navigationController.navigationBar.shadowImage = [UIImage imageNamed:@"ic_slide_shadow"];
    //5.
    //self.navigationController.navigationBar.tintColor = RGB(74, 74, 74);
    
    
    /** 注：改变状态栏颜色
     *  1、重写下面的方法
     *  - (UIStatusBarStyle)preferredStatusBarStyle{return UIStatusBarStyleLightContent;}
     *  2、plist文件中添加 View controller-based status bar appearance 键，值为 YES
     *  3.如果设置了 navigationBar.barStyle 值，要改变类型，不然会被影响
     */
}

@end
