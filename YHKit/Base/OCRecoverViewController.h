//
//  OCRecoverViewController.h
//  YHKit
//
//  Created by 毛云河 on 2020/5/27.
//  Copyright © 2020 小河. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCRecoverViewController : BaseViewController

@property (nonatomic, readonly, strong) UINavigationController *storedNavigationController;
@property (nonatomic, readonly, assign) BOOL storedNavigationBarIsTranslucent;
@property (nonatomic, readonly, assign) UIBarStyle storedNavigationBarBarStyle;
@property (nonatomic, readonly, strong) UIColor *storedNavigationBarBarTintColor;
@property (nonatomic, readonly, strong) UIColor *storedNavigationBarTintColor;

@property (nonatomic, readonly, strong) UIImage *storedNavigationBarShadowImage;
@property (nonatomic, readonly, strong) UIImage *storedNavigationBarBackgroundImage;

@property (nonatomic, readonly, strong) CATransition *transition;

/** 滚动更新导航的背景颜色
 *
 */
- (void)scrollUploadNavBarStyleWithOffsetY:(CGFloat)offsetY
                                viewHeight:(CGFloat)viewHeight;

@end

NS_ASSUME_NONNULL_END
