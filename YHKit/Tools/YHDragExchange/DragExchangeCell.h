//
//  DragExchangeCell.h
//  YHKit
//
//  Created by 小河 on 2021/4/16.
//  Copyright © 2021 小河. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DragExchangeCell : UICollectionViewCell

@property (nonatomic, copy) void(^blockCloseBtnClick)(void);
@property (weak, nonatomic) IBOutlet UIImageView *closeIcon;
@property (weak, nonatomic) IBOutlet UIImageView *cerImg;


@end

NS_ASSUME_NONNULL_END
