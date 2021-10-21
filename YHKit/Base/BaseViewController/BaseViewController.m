//
//  BaseViewController.m
//  YHKit
//
//  Created by 毛云河 on 2020/4/12.
//  Copyright © 2020 小河. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseViewController+DefaultSetting.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIButton *leftBtnItem;

@end

@implementation BaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        //配置View的默认设置
        [self cofingViewDefaultSetting];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        //配置View的默认设置
        [self cofingViewDefaultSetting];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //.设置scrollView不自动下压
    [self setupScrollViewDefaultFarme];
    //.设置系统导航默认返回按钮
    [self setupDefaultNavSubViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //.记录根视图状态
    [self recordRootPageStatue];
    //.根据根视图的状态决定返回按钮是否隐藏
    self.leftBtnItem.hidden = self.isRootPage;
    //.设置导航默认状态
    [self setupNavDefaultStatus];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //.开启手势交互识别器
    [self openInteractivePopGestureRecognizer];
}

//设置系统导航默认返回按钮
- (void)setupDefaultNavSubViews {
    //设置返回按钮
    self.leftBtnItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.leftBtnItem setBackgroundImage:[UIImage imageNamed:@"nav_default_back_icon"] forState:UIControlStateNormal];
    [self.leftBtnItem addTarget:self action:@selector(navDefaultBackClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftBtnItem];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)navDefaultBackClick:(UIButton *)sender {
    UIViewController * controller = [self.navigationController.viewControllers objectAtIndex:0];
    if(controller == self) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/**
 * 设置导航标题
 */
- (void)configNavTitle:(NSString *)navtTitle {
    self.title = navtTitle;
}

/**
 * 设置导航中间视图
 */
- (void)configNavBarCenterView:(UIView *)customView {
    self.navigationItem.titleView.frame = customView.frame;
    self.navigationItem.titleView = customView;
}

/**
 * 设置导航左按钮
 */
- (void)configLeftButtonItems:(NSMutableArray *)items {
    NSMutableArray *lefttItems = [NSMutableArray array];
    NSInteger index = 1;
    for (NSString *item in items) {
        UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        itemBtn.tag = index;
        [itemBtn addTarget:self action:@selector(leftItemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        if([item containsString:@"T-"]) {
            NSString *title = [item stringByReplacingOccurrencesOfString:@"T-" withString:@""];
            [itemBtn setTitle:title forState:UIControlStateNormal];
            itemBtn.titleLabel.font = FontWithSize(14);
            
        }else {
            NSString *imageNamed = item;
            [itemBtn setImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
        }
        UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
        [lefttItems addObject:barBtnItem];
        index++;
    }
    
    self.navigationItem.leftBarButtonItems = lefttItems;
}

/**
 * 导航左按钮的回调
 */
- (void)leftItemBtnClick:(UIButton *)sender {
    if (self.leftButtonItemBlock) {
        self.leftButtonItemBlock(sender.tag);
    }
}

/**
 * 设置导航右按钮
 */
- (void)configRightButtonItems:(NSMutableArray *)items {
    NSMutableArray *rightItems = [NSMutableArray array];
    NSInteger index = 1;
    for (NSString *item in items) {
        UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        itemBtn.tag = index;
        [itemBtn addTarget:self action:@selector(rightItemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        if([item containsString:@"T-"]) {
            NSString *title = [item stringByReplacingOccurrencesOfString:@"T-" withString:@""];
            [itemBtn setTitle:title forState:UIControlStateNormal];
            itemBtn.titleLabel.font = FontWithSize(14);
            [itemBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        }else {
            NSString *imageNamed = item;
            [itemBtn setImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
        }
        UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
        [rightItems addObject:barBtnItem];
        index++;
    }
    
    self.navigationItem.rightBarButtonItems = rightItems;
}

/**
 * 导航右按钮的回调
 */
- (void)rightItemBtnClick:(UIButton *)sender {
    if (self.rightButtonItemBlock) {
        self.rightButtonItemBlock(sender.tag);
    }
}










@end
