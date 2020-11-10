//
//  YHCycleScrollView.m
//  YHKit
//
//  Created by 毛云河 on 2020/5/8.
//  Copyright © 2020 小河. All rights reserved.
//

#import "YHCycleScrollView.h"

@interface YHCycleScrollView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *viewArray;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewFlowLayout;

@end

@implementation YHCycleScrollView

- (UICollectionViewFlowLayout *)collectionViewFlowLayout {
    if (!_collectionViewFlowLayout) {
        _collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionViewFlowLayout.minimumLineSpacing = 0;
    }
    return _collectionViewFlowLayout;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:self.collectionViewFlowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollsToTop = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.bounces = NO;
    }
    
    return _collectionView;
}


- (instancetype)initWithFrame:(CGRect)frame cycleViewWithViewArray:(NSArray *)viewArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.viewArray = viewArray;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self addSubview:self.collectionView];
    self.collectionView.frame = self.bounds;
    self.collectionViewFlowLayout.itemSize = self.frame.size;
    self.collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}


@end
