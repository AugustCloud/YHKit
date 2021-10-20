//
//  YHCategoryView.m
//  YHKit
//
//  Created by 小河 on 2021/9/14.
//  Copyright © 2021 小河. All rights reserved.
//

#import "YHCategoryView.h"
#import <Masonry/Masonry.h>

@interface YHCategoryView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *underline;//标题下面的分割线

@end

@implementation YHCategoryView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    [self addSubview:self.underline];
    [self.underline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40-self.underLineHeight);
    }];
    
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.bounces = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    
    return _collectionView;
}

- (UIView *)underline {
    if (!_underline) {
        _underline = [[UIView alloc] init];
    }
    
    return _underline;
}

@end
