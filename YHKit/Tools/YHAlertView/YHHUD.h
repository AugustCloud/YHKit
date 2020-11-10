//
//  YHHUD.h
//  ZJFTakeGoods
//
//  Created by 毛云河 on 2020/8/20.
//  Copyright © 2020 小河. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SureBlock)(NSInteger itme);

@interface YHHUD : UIView

@property (nonatomic, copy) SureBlock mySureBlock;

/**
 * 展示标题和提示内容弹框
 * content 提示的内容
 * title 弹框的标题
 */
- (instancetype)initWithContent:(NSString *)content title:(NSString *)title;

/**
 * 展示标题和一个输入框的弹框
 * title 弹框的标题
 */
- (instancetype)initTextFieldWithTitle:(NSString *)title;

- (void)show;//展示取消和确认按钮
- (void)showSingleButton;//只展示确认按钮
- (void)dismiss;//取消弹框

//吐司 - 弹出框
+ (void)hudShowMessage:(NSString *)message;
+ (MBProgressHUD *)createMbprogressHudWith:(UIViewController *)VC;

@end

NS_ASSUME_NONNULL_END
