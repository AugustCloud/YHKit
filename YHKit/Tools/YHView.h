//
//  YHView.h
//  YHKit
//
//  Created by 毛云河 on 2020/5/8.
//  Copyright © 2020 小河. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHView : UIView

@property (nonatomic, strong) NSDictionary *dict;

- (void)setupData:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
