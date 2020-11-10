//
//  ExploreViewController.m
//  YHKit
//
//  Created by 毛云河 on 2020/4/14.
//  Copyright © 2020 小河. All rights reserved.
//

#import "ExploreViewController.h"
#import <FWCycleScrollView/FWCycleScrollView-Swift.h>

#import "HyCycleView.h"
#import "HySegmentView.h"
#import "YHView.h"

@interface ExploreViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ExploreViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = NO;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.hidesBottomBarWhenPushed = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.scrollView.backgroundColor = UIColor.clearColor;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 200);
    
//    [self createCycleView];
    [self createView];
    
}

- (void)createCycleView {
    // 例六：轮播自定义视图
    NSArray *customViewArray = @[[self setupUIView:0],
                                 [self setupUIView:1],
                                 [self setupUIView:2],
                                 [self setupUIView:3],
                                 [self setupUIView:4]];
    
    FWCycleScrollView *cycleScrollView6 = [FWCycleScrollView cycleViewWithViewArray:customViewArray frame:CGRectMake(0, 0, self.view.frame.size.width, 140)];
    cycleScrollView6.currentPageDotEnlargeTimes = 1;
    cycleScrollView6.customDotViewType = FWCustomDotViewTypeHollow;
    cycleScrollView6.pageDotColor = [UIColor redColor];
    cycleScrollView6.currentPageDotColor = [UIColor redColor];
    cycleScrollView6.pageControlDotSize = CGSizeMake(12, 12);
    cycleScrollView6.autoScrollTimeInterval = 2;
    cycleScrollView6.itemDidClickedBlock = ^(NSInteger index){
        NSLog(@"当前点击了第 %ld 个广告位",(index + 1));
    };
    cycleScrollView6.itemDidScrollBlock = ^(NSInteger index){
        //        NSLog(@"当前轮播到了第 %ld 个广告位",(index + 1));
    };
    [self.scrollView addSubview:cycleScrollView6];
}

- (UIView *)setupUIView:(int)index
{
    UIView *bgview = [[UIView alloc] init];
    bgview.frame = CGRectMake(10, 10, self.view.frame.size.width-20, 120);
    bgview.backgroundColor =  [UIColor colorWithRed:(float)(1+arc4random()%99)/100 green:(float)(1+arc4random()%99)/100 blue:(float)(1+arc4random()%99)/100 alpha:1];
    return bgview;
}


- (void)createView {
    NSArray *dataArray =@[@{ @"title" : @"春晓"},@{ @"title" : @"春晓"},@{ @"title" : @"春晓"}];
    
    HySegmentView *segment = [self segment];
    segment.backgroundColor = UIColor.clearColor;
    
    HyCycleView *view = [HyCycleView cycleViewWithFrame:CGRectMake(0, 0, self.scrollView.width, 180) configureBlock:^(HyCycleViewConfigure *configure) {
        configure.cycleClasses(@[YHView.class]);
        configure.totalPage(dataArray.count);
        configure.timeInterval(1);
        configure.viewWillAppear(^(HyCycleView *cycleView, YHView *customView, NSInteger index, BOOL isFirstLoad) {
            if (isFirstLoad) {
                [customView setupData:dataArray[index]];
            }
        });
        
        configure.roundingPageChange(^(HyCycleView *cycleView, NSInteger indexs, NSInteger roundingIndex) {
            if (!segment.superview) {
                segment.leftValue((cycleView.width - segment.width)/2);
                segment.bottomValue(cycleView.height - 5);
                [cycleView addSubview:segment];
            }
            [segment clickItemAtIndex:roundingIndex];
        });
        
    }];
    
    [self.scrollView addSubview:view];
    
    
}

- (HySegmentView *)segment {
    HySegmentView *segmentView = [HySegmentView segmentViewWithFrame:CGRectMake(0, 0, 14 * 4 + 18, 7) configureBlock:^(HySegmentViewConfigure *configure) {
        configure.keepingMarginAndInset(YES);
        configure.itemMargin(7);
        configure.numberOfItems(4);
        configure.viewForItemAtIndex(^UIView *(UIView *currentView,
                                               NSInteger index,
                                               CGFloat progress,
                                               HySegmentViewItemPosition position,
                                               NSArray<UIView *> *animationViews)
        {
            UIView *view = currentView;
            if (!view) {
                view = [UIView new];
                view.layer.masksToBounds = YES;
                view.backgroundColor = UIColor.orangeColor;
                view.layer.cornerRadius = 3.5;
            }
            
            if (progress == 0) {
                view.alpha = .5;
                view.sizeValue(7, 7);
            }
            
            if (progress == 1) {
                view.alpha = .85;
                view.sizeValue(16, 7);
            }
            return view;
        }).clickItemAtIndex(^BOOL(NSInteger page,BOOL isRepeat){
            
            return NO;
        });
    }];
    
    return segmentView;
}

@end
