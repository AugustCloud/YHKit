//
//  YHCustomDotView.h
//  YHKit
//
//  Created by 毛云河 on 2020/5/8.
//  Copyright © 2020 小河. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 分页控件类型，默认为classic
///
/// - none: 无page
/// - classic: 系统自带经典样式
/// - custom: 自定义类型
typedef NS_ENUM(NSInteger, PageControlType) {
    none = 0,
    classic,
    custom
};

/// 自定义分页控件类型（即：self.pageControlType == .custom），默认为hollow
///
/// - hollow: 空心
/// - solid: 实心
/// - image: 图片
typedef NS_ENUM(NSInteger, YHCustomDotViewType) {
    hollow = 0,
    solid,
    image
};

/// 分页控件位置
///
/// - center: 中偏下位置
/// - right: 右偏下位置
/// - left: 左偏下位置
typedef NS_ENUM(NSInteger, PageControlAliment) {
    center = 0,
    right,
    left
};

@interface YHCustomDotView : UIView

@property (nonatomic, strong) UIColor *currentPageDotColor;//选中分页控件的颜色
@property (nonatomic, strong) UIColor *pageDotColor;//未选中分页控件的颜色
@property (nonatomic, readonly) YHCustomDotViewType customDotViewType;//自定义分页控件类型
@property (nonatomic, strong) UIImage *pageDotImage;//未选中分页控件：图片方式
@property (nonatomic, strong) UIImage *currentPageDotImage;//选中分页控件：图片方式


@property (nonatomic, strong) UIImageView *pageDotImageView;//分页控件：图片方式


@end

NS_ASSUME_NONNULL_END
