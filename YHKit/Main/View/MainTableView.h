//
//  MainTableView.h
//  YHKit
//
//  Created by 毛云河 on 2020/5/27.
//  Copyright © 2020 小河. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MainTableViewDelegate <NSObject>
- (void)mainTableViewDidScroll:(UIScrollView *)scrollerView;
- (void)mainTableViewDidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface MainTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<MainTableViewDelegate> mainTableViewDelegate;

@end

NS_ASSUME_NONNULL_END
