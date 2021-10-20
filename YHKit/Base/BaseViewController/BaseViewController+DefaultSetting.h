//
//  BaseViewController+DefaultSetting.h
//  YHKit
//
//  Created by 小河 on 2021/10/20.
//  Copyright © 2021 小河. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController (DefaultSetting)

/**
 * 配置View的默认设置
 */
- (void)cofingViewDefaultSetting;

/**
 * 设置scrollView不自动下压
 */
- (void)setupScrollViewDefaultFarme;

/**
 * 记录根视图状态
 */
- (void)recordRootPageStatue;

/**
 * 设置导航默认状态
 */
- (void)setupNavDefaultStatus;

/**
 * 开启手势交互识别器
 */
- (void)openInteractivePopGestureRecognizer;

@end

NS_ASSUME_NONNULL_END
