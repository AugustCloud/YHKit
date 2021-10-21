//
//  OCRecoverViewController.m
//  YHKit
//
//  Created by 毛云河 on 2020/5/27.
//  Copyright © 2020 小河. All rights reserved.
//

#import "OCRecoverViewController.h"


@interface OCRecoverViewController ()

@end

@implementation OCRecoverViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        /*说明extendedLayoutIncludesOpaqueBars属性
        不设置的话，有的时候tableView上方导航设为透明的时候即translucent属性为Yes，
        然后tableview滑动设置导航为不透明的时候即translucent属性为NO的时候会出现跳动
        */
        self.extendedLayoutIncludesOpaqueBars = YES;//设置扩展布局包括不透明条
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.extendedLayoutIncludesOpaqueBars = YES;//设置扩展布局包括不透明条
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}





@end
