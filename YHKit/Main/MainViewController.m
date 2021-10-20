//
//  MainViewController.m
//  YHKit
//
//  Created by 毛云河 on 2020/4/12.
//  Copyright © 2020 小河. All rights reserved.
//

#import "MainViewController.h"
#import "YHCycleScrollView.h"
#import "MainTableView.h"
#import "BannerViewController.h"
#import "YHHUD.h"


@interface MainViewController ()<MainTableViewDelegate>
 
@property (nonatomic, strong) MainTableView *tableView;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger beginTime;

@end

@implementation MainViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubViews];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configNavTitle:@"首页"];
    [self scrollUploadNavBarStyleWithOffsetY:self.tableView.contentOffset.y
                                  viewHeight:200.f];
}


- (void)setupSubViews {
    [self.view addSubview:self.tableView];
}

- (void)mainTableViewDidScroll:(UIScrollView *)scrollerView {
    [self scrollUploadNavBarStyleWithOffsetY:scrollerView.contentOffset.y
                                  viewHeight:200.f];
}

- (void)mainTableViewDidSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[BannerViewController new] animated:YES];
    }else if (indexPath.row == 1) {
        //分页控制
        
    }
    
    [YHHUD hudShowMessage:@"哈哈哈哈哈"];
}

- (MainTableView *)tableView {
    if (!_tableView) {
        _tableView = [[MainTableView alloc] initWithFrame:CGRectMake(0, self.view.top, SCREENWIDTH, SCREENHEIGHT-NavBarHeight-BottomSafeHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor orangeColor];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.mainTableViewDelegate = self;
    }
    
    return _tableView;
}

@end
