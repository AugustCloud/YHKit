//
//  YHCustomDotView.m
//  YHKit
//
//  Created by 毛云河 on 2020/5/8.
//  Copyright © 2020 小河. All rights reserved.
//

#import "YHCustomDotView.h"

@implementation YHCustomDotView

- (UIImageView *)pageDotImageView {
    if (!_pageDotImageView) {
        _pageDotImageView = [[UIImageView alloc] init];
        [self addSubview:_pageDotImageView];
    }
    return _pageDotImageView;
}

@end
