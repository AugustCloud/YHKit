//
//  YHDragExchange.m
//  YHKit
//
//  Created by 小河 on 2021/4/14.
//  Copyright © 2021 小河. All rights reserved.
//

#import "YHDragExchange.h"
#import "DragExchangeCell.h"
#import <Masonry.h>

@interface YHDragExchange ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *pictureMArr;

@end

@implementation YHDragExchange

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews:frame];
        self.pictureMArr = [NSMutableArray array];
    }
    
    return self;
}

- (void)setupSubViews:(CGRect)frame {
    UILabel *titleLab = [[UILabel alloc] init];
    [self addSubview:titleLab];
    titleLab.text = @"上传图片";
    titleLab.font = FontWithSize(14);
    titleLab.textColor = color(74, 74, 74);
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(16);
        make.height.mas_equalTo(20);
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [self addSubview:collection];
    collection.dataSource = self;
    collection.delegate = self;
    collection.backgroundColor = [UIColor whiteColor];
    
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLab.mas_bottom).mas_offset(10);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-10);
    }];
    
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [collection registerNib:[UINib nibWithNibName:@"DragExchangeCell" bundle:nil] forCellWithReuseIdentifier:@"DragExchangeCell"];
    self.collectionView = collection;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lonePressAction:)];
    [collection addGestureRecognizer:longPress];

   
    UIView *line = [[UIView alloc] init];
    [self addSubview:line];
    line.backgroundColor = color(220, 220, 220);
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
}

//四周间隙
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 10, 5, 10);
}

//上下间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5.f;
}

//左右间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5.f;
}

//item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(70, 70);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.pictureMArr.count<3) {
        return self.pictureMArr.count+1;
    }else {
        return self.pictureMArr.count;
    }
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DragExchangeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DragExchangeCell" forIndexPath:indexPath];
    if (indexPath.item < self.pictureMArr.count) {
        NSString *num = self.pictureMArr[indexPath.item];
        cell.cerImg.backgroundColor = color(245, 245, 245);
        if (num.intValue == 1) {
            //cell.backgroundColor = [UIColor lightGrayColor];
        }else if (num.intValue == 2) {
            //cell.backgroundColor = [UIColor orangeColor];
        }else if (num.intValue == 3) {
            //cell.backgroundColor = [UIColor redColor];
        }
    }else {
        cell.cerImg.backgroundColor = color(245, 245, 245);
        cell.cerImg.image = [UIImage imageNamed:@"refund_add_icon"];
        cell.closeIcon.hidden = YES;
    }
    
  
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.pictureMArr.count < 3) {
        if (indexPath.item == self.pictureMArr.count) {
            NSLog(@"1111");
        }
    }
}

// 长按手势触发方法
- (void)lonePressAction:(UILongPressGestureRecognizer *)longPress {
    NSIndexPath *selectIndexPath = [self.collectionView indexPathForItemAtPoint:[longPress locationInView:self.collectionView]];
    UICollectionViewCell *cell =  [self.collectionView cellForItemAtIndexPath:selectIndexPath];
    switch (longPress.state) {
        // 开始操作
        case UIGestureRecognizerStateBegan: {
            
            if (selectIndexPath == nil) {
                break;
            }
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
            break;
        }
        // 移动中
        case UIGestureRecognizerStateChanged: {
            if (selectIndexPath.item < self.pictureMArr.count) {
                [self.collectionView updateInteractiveMovementTargetPosition:[longPress locationInView:longPress.view]];
            }else {
                [self.collectionView cancelInteractiveMovement];
            }
            break;
        }
        // 结束操作
        case UIGestureRecognizerStateEnded: {
            [self.collectionView endInteractiveMovement];
            break;
        }
        // 其它操作
                   
        default: {
                        
            [self.collectionView cancelInteractiveMovement];
                        
            break;
                    
        }
                
    }
    
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item < self.pictureMArr.count) {
        return YES;
    }else {
        return NO;
    }
}

// 移动结束后代理
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath {
    // 1.交换2个cell位置
    //[self.pictureMArr exchangeObjectAtIndex:sourceIndexPath.item withObjectAtIndex:destinationIndexPath.item];
 
    // 2.将cell插入指定位置
    id objc = [self.pictureMArr objectAtIndex:sourceIndexPath.item];
    [self.pictureMArr removeObject:objc];
    [self.pictureMArr insertObject:objc atIndex:destinationIndexPath.item];
    //[self.collectionView reloadData];
}


@end
