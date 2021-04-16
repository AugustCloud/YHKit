//
//  YHHUD.m
//  ZJFTakeGoods
//
//  Created by 毛云河 on 2020/8/20.
//  Copyright © 2020 小河. All rights reserved.
//

#import "YHHUD.h"
#import <Masonry.h>

typedef NS_ENUM(NSInteger, AlertViewType) {
    defaultType = 0,
    textFieldType = 1
};

@interface YHHUD()

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) UIButton *checkButton;
@property (nonatomic, strong) UIView *verticalLine;

@end


@implementation YHHUD

- (instancetype)initWithContent:(NSString *)content title:(NSString *)title
{
    self = [super init];
    if (self) {
        self.title = title;
        self.content = content;
        self.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
        [self loadUIWithType:defaultType];
    }
    return self;
}

- (instancetype)initTextFieldWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
        self.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
        [self loadUIWithType:textFieldType];
    }
    
    return self;
}


- (void)show {
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
}

- (void)showSingleButton {
    [self.checkButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(SCREENWIDTH - 100);
    }];
    [self.checkButton setTitle:@"确定" forState:UIControlStateNormal];
    self.verticalLine.hidden = YES;
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
}

- (void)loadUIWithType:(AlertViewType)type {
    // 大背景
    UIView *bgView = [[UIView alloc] init];
    [self addSubview:bgView];
    bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    // 白色view
    UIView *whiteView = [[UIView alloc] init];
    [bgView addSubview:whiteView];
    whiteView.clipsToBounds = YES;
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = 5;
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREENWIDTH - 100);
        make.center.mas_equalTo(bgView);
    }];
    
    // 标题
    UILabel *titleLabel = [[UILabel alloc] init];
    [whiteView addSubview:titleLabel];
    titleLabel.backgroundColor = color(245, 245, 245);
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = color(74, 74, 74);
    titleLabel.text = self.title;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(35);
    }];
    
    //内容
    UILabel *couponLabel = [[UILabel alloc] init];
    [whiteView addSubview:couponLabel];
    couponLabel.text = self.content;
    couponLabel.textAlignment = NSTextAlignmentCenter;
    couponLabel.font = [UIFont systemFontOfSize:12];
    couponLabel.numberOfLines = 0;
    
    //输入框
    UITextField *contentTF = [[UITextField alloc] init];
    [whiteView addSubview:contentTF];
    contentTF.font = [UIFont systemFontOfSize:12];
    contentTF.backgroundColor = RGBACOLOR(206, 206, 206, 0.3);
    contentTF.keyboardType = UIKeyboardTypeDecimalPad;
    
    UILabel *timeLabel = [[UILabel alloc] init];
    [whiteView addSubview:timeLabel];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.font = [UIFont systemFontOfSize:14];
    timeLabel.textColor = [UIColor colorWithRed:0.84 green:0.33 blue:0.44 alpha:1.00];
    timeLabel.text = @"";
    
    if (type == defaultType) {
        [couponLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(whiteView).offset(20);
            make.right.mas_equalTo(whiteView).offset(-20);
            make.top.mas_equalTo(titleLabel.mas_bottom).mas_offset(20);
            make.height.mas_equalTo([self heightWithWord:couponLabel.text font:12 width:SCREENWIDTH - 140]);
        }];
        
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(couponLabel);
            make.height.mas_offset(10);
            make.top.mas_equalTo(couponLabel.mas_bottom).mas_offset(10);
        }];
        
    }else if (type == textFieldType) {
        [contentTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(whiteView).offset(33);
            make.right.mas_equalTo(whiteView).offset(-33);
            make.top.mas_equalTo(titleLabel.mas_bottom).mas_offset(20);
            make.height.mas_equalTo(43);
        }];
        
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(couponLabel);
            make.height.mas_offset(0);
            make.top.mas_equalTo(contentTF.mas_bottom).mas_offset(10);
        }];
    }
    
    // 取消按钮
    UIButton *cancelButton = [[UIButton alloc] init];
    cancelButton.backgroundColor = [UIColor whiteColor];
    [cancelButton addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    [whiteView addSubview:cancelButton];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:color(74, 74, 74) forState:UIControlStateNormal];
    [cancelButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(whiteView);
        make.top.mas_equalTo(timeLabel.mas_bottom).mas_offset(10);
        make.right.mas_equalTo(whiteView.mas_centerX);
        make.height.mas_equalTo(36);
    }];
    
    self.checkButton = [[UIButton alloc] init];
    _checkButton.backgroundColor = [UIColor whiteColor];
    [whiteView addSubview:_checkButton];
    [_checkButton setTitle:@"确定" forState:UIControlStateNormal];
    [_checkButton.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [_checkButton setTitleColor:color(255, 45, 81) forState:UIControlStateNormal];
    [_checkButton addTarget:self action:@selector(okAction) forControlEvents:UIControlEventTouchUpInside];
    [_checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(cancelButton);
        make.width.mas_offset((SCREENWIDTH - 100) / 2);
        make.right.equalTo(whiteView);
        make.bottom.mas_equalTo(whiteView).offset(2);
    }];
    
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(cancelButton.mas_bottom).offset(-2);
    }];
    
    // 横线灰色线
    UIView *grayLineView1 = [[UIView alloc] init];
    [whiteView addSubview:grayLineView1];
    grayLineView1.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    [grayLineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(timeLabel.mas_bottom).mas_offset(10);
    }];

    // 竖向灰色线
    UIView *grayLineView2 = [[UIView alloc] init];
    [whiteView addSubview:grayLineView2];
    grayLineView2.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    [grayLineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(grayLineView1.mas_bottom);
        make.bottom.mas_equalTo(whiteView);
        make.centerX.mas_equalTo(whiteView);
        make.width.mas_equalTo(1);
    }];
    self.verticalLine = grayLineView2;
}

- (void)okAction {
    [self dismiss];
    if (self.mySureBlock) {
        self.mySureBlock(1);
    }
}

- (void)cancelAction {
    [self dismiss];
}

- (void)dismiss {
    [self removeFromSuperview];
}

- (float)heightWithWord:(NSString *)word font:(NSInteger)font width:(float)width {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 10)];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:font];
    label.text = word;
    [label sizeToFit];
    return label.bounds.size.height;
}

+ (void)hudShowMessage:(NSString *)message {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    //要加这个属性，不然上面会一直有一个蒙版，无法显示自定义的颜色
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
    hud.contentColor = [UIColor whiteColor];
    hud.label.text = NSLocalizedString(message, nil);
    hud.label.font = FontWithSize(12);
    hud.mode = MBProgressHUDModeCustomView;
    [hud hideAnimated:YES afterDelay:1];
}

+ (MBProgressHUD *)createMbprogressHudWith:(UIViewController *)VC {
    MBProgressHUD  *HUD = [MBProgressHUD showHUDAddedTo:VC.view animated:YES];
    HUD.contentColor=[UIColor whiteColor];
    HUD.bezelView.color=[UIColor blackColor];
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.label.text= @"加载中";
    HUD.removeFromSuperViewOnHide=YES;
    [VC.view addSubview:HUD];
    [HUD showAnimated:YES];
    //3,设置背景框的圆角值，默认是10
    HUD.bezelView.layer.cornerRadius = 10.0;
    HUD.bezelView.layer.masksToBounds = YES;
    //4,设置提示信息 信息颜色，字体
    HUD.label.font = FontWithSize(15);
    //10，设置各个元素距离矩形边框的距离
    HUD.margin = 0;
    //11，背景框的最小大小
    HUD.minSize = CGSizeMake(80,80);
    //14,设置显示和隐藏动画类型  有三种动画效果，如下
    HUD.animationType = MBProgressHUDAnimationFade; //和上一个相反，前近，最后淡化消失
    return HUD;
}

@end
