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

- (MainTableView *)tableView {
    if (!_tableView) {
        _tableView = [[MainTableView alloc] initWithFrame:CGRectMake(0, self.view.top, SCREENWIDTH, SCREENHEIGHT-NavBarHeight-BottomSafeHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor orangeColor];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tableView.mainTableViewDelegate = self;
    }
    
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置底部tabbar隐藏
    self.hidesBottomBarWhenPushed = NO;
    [self updateNavigationBarStyle];
}

- (void)setupSubViews {
    [self.view addSubview:self.tableView];
}

- (void)mainTableViewDidScroll:(UIScrollView *)scrollerView {
    [self updateNavigationBarStyle];
}

- (void)mainTableViewDidSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[BannerViewController new] animated:YES];
    }
    
    [YHHUD hudShowMessage:@"哈哈哈哈哈"];
}

#pragma mark - Update navigation style
- (void)updateNavigationBarStyle {
    if (self.navigationController == nil) {
        return;
    }
    if (self.tableView.contentOffset.y < 200) {
        NSMutableDictionary *titleTextAttributes = [UINavigationBar appearance].titleTextAttributes.mutableCopy;
        [titleTextAttributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
        [titleTextAttributes setObject:FontMediumWithSize(20) forKey:NSFontAttributeName];
        [self updateTitle:[[NSAttributedString alloc] initWithString:@"首页" attributes:titleTextAttributes]];
        
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
        self.navigationController.navigationBar.translucent = YES;
        if (self.tableView.contentOffset.y <= 0) {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
        } else {
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[RGBACOLOR(237, 121, 133, 1) colorWithAlphaComponent:(self.tableView.contentOffset.y/200)]] forBarMetrics:UIBarMetricsDefault];
        }
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
    } else {
        NSMutableDictionary *titleTextAttributes = [UINavigationBar appearance].titleTextAttributes.mutableCopy;
        [titleTextAttributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
        [titleTextAttributes setObject:FontMediumWithSize(20) forKey:NSFontAttributeName];
        [self updateTitle:[[NSAttributedString alloc] initWithString:@"我的" attributes:titleTextAttributes]];
       
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
        self.navigationController.navigationBar.translucent = NO;
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:RGBACOLOR(237, 121, 133, 1)] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationController.navigationBar.shadowImage = [UIImage imageNamed:@"ic_slide_shadow"];
    }
    
    [self.navigationController.navigationBar.layer addAnimation:self.transition forKey:@"navigationBarAnimation"];
}


@end
