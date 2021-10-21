//
//  BannerViewController.m
//  YHKit
//
//  Created by 毛云河 on 2020/5/27.
//  Copyright © 2020 小河. All rights reserved.
//

#import "BannerViewController.h"
#import "YHDragExchange.h"
#import "BaseViewController+Server.h"

@interface BannerViewController ()

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupSubViews];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configNavTitle:@"banner"];
    [self scrollAfterSettingNavBackgroundImagColor:[UIColor whiteColor]
                                     navTitleColor:[UIColor colorWithHexString:@"333333"]];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)setupSubViews {
    YHDragExchange *view = [[YHDragExchange alloc] initWithFrame:CGRectMake(0, 100, SCREENWIDTH, 141)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
}



@end
