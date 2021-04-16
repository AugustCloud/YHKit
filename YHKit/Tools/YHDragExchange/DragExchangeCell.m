//
//  DragExchangeCell.m
//  YHKit
//
//  Created by 小河 on 2021/4/16.
//  Copyright © 2021 小河. All rights reserved.
//

#import "DragExchangeCell.h"

@implementation DragExchangeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.cerImg.layer.cornerRadius = 5;
    self.cerImg.layer.masksToBounds = YES;
}

- (IBAction)closeBtnClick:(UIButton *)sender {
    if (self.blockCloseBtnClick) {
        self.blockCloseBtnClick();
    }
}

@end
