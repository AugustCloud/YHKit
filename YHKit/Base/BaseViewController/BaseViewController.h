//
//  BaseViewController.h
//  YHKit
//
//  Created by 毛云河 on 2020/4/12.
//  Copyright © 2020 小河. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

/**
 * 是否是根视图
 */
@property (nonatomic, assign) BOOL isRootPage;

/**
 * index 从左往右一次累加 默认首个为 1
 */
@property (nonatomic, copy) void(^leftButtonItemBlock)(NSInteger index);

/**
 * index 从右往左一次累加 默认首个为 1
 */
@property (nonatomic, copy) void(^rightButtonItemBlock)(NSInteger index);

/**
 * 设置导航标题 (注：需要在viewWillAppear里面调用)
 */
- (void)configNavTitle:(NSString *)title;


/**
 * 设置导航中间视图
 */
- (void)configNavBarCenterView:(UIView *)customView;

/**
 * 添加多个导航左按钮
 * items 传入文字或者图片
 * 当传入文字时需要添加标识符 T-
 * 当传入图片时直接传入图片名字就好
 * 注：当添加多左按钮的时候 在视图上面是从左往右排列的
 * 示例：[@"T-客服",@"imageIcon_name"]
 */
- (void)configLeftButtonItems:(NSMutableArray *)items;

/**
 * 添加多个导航右按钮
 * items 传入文字或者图片
 * 当传入文字时需要添加标识符 T-
 * 当传入图片时直接传入图片名字就好
 * 注：当添加多右按钮的时候 在视图上面是从右往左排列的
 * 示例：[@"T-客服",@"imageIcon_name"]
 */
- (void)configRightButtonItems:(NSMutableArray *)items;

@end

NS_ASSUME_NONNULL_END
