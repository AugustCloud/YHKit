//
//  YHView.m
//  YHKit
//
//  Created by 毛云河 on 2020/5/8.
//  Copyright © 2020 小河. All rights reserved.
//

#import "YHView.h"

@interface YHView ()

@property (nonatomic, strong) UILabel *label;


@end

@implementation YHView

- (instancetype)init {
    self = [super init];
    
    if (self) {
        UILabel *label = [[UILabel alloc] init];
        [self addSubview:label];
        label.frame = CGRectMake(0, 0, 100, 20);
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor blueColor];
        label.backgroundColor = [UIColor whiteColor];
        self.label = label;
    }
    
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor redColor];
    
}

- (void)setDict:(NSDictionary *)dict {
    _dict = dict;
    self.label.text = _dict[@"title"];
}

- (void)setupData:(NSDictionary *)dict {
    self.label.text = [NSString stringWithFormat:@"%@",dict[@"title"]];
}

@end
