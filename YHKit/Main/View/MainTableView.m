//
//  MainTableView.m
//  YHKit
//
//  Created by 毛云河 on 2020/5/27.
//  Copyright © 2020 小河. All rights reserved.
//

#import "MainTableView.h"

@interface MainTableView ()

@property (nonatomic, strong) UIImageView *topBgImg;

@end

@implementation MainTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
        //防止cell的闪动和漂移
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        
        self.delegate = self;
        self.dataSource = self;
        
        self.tableHeaderView = [self setupTableViewTopView];
        self.tableFooterView = [UIView new];
        
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    
    return self;
}

- (UIView *)setupTableViewTopView {
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, SCREENWIDTH, 300);
    headerView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"main_top_bg"]];
    [headerView addSubview:bgImageView];
    bgImageView.frame = CGRectMake(0, 0, SCREENWIDTH, 300);
    bgImageView.backgroundColor = [UIColor lightGrayColor];
    self.topBgImg = bgImageView;
    
    
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"标题-%ld",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.mainTableViewDelegate mainTableViewDidSelectRowAtIndexPath:indexPath];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat yOffset  = scrollView.contentOffset.y;
    NSLog(@"%lf",yOffset);
    CGFloat xOffset = 0.0;
    if (yOffset > 0) {
        xOffset = -(yOffset/2);
    } else {
        xOffset = yOffset/2;
    }
    CGRect rect = self.topBgImg.frame;
    rect.origin.y = yOffset;
    rect.size.height =  -yOffset + (300);
    rect.origin.x = xOffset;
    rect.size.width = SCREENWIDTH + fabs(xOffset)*2;
    self.topBgImg.frame = rect;
    
    [self.mainTableViewDelegate mainTableViewDidScroll:scrollView];
}

@end
