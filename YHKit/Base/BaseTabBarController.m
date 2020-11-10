//
//  BaseTabBarController.m
//  YHKit
//
//  Created by 毛云河 on 2020/4/12.
//  Copyright © 2020 小河. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "MainViewController.h"
#import "ExploreViewController.h"
#import "MyViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainViewController *main = [[MainViewController alloc] init];
    [self addChildViewController:main title:@"首页" imageName:@"tab_home_dissel" selectImageName:@"tab_home_sel"];
    
    ExploreViewController *explore = [[ExploreViewController alloc] init];
    [self addChildViewController:explore title:@"探索" imageName:@"tab_pedding_dissel" selectImageName:@"tab_pedding_sel"];
    
    MyViewController *my = [[MyViewController alloc] init];
    [self addChildViewController:my title:@"我的" imageName:@"tab_bill_dissel" selectImageName:@"tab_bill_sel"];
}


- (void)addChildViewController:(UIViewController *)childController title:(NSString *)titlt imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName
{
    childController.title = titlt;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childController];
    
    self.tabBar.tintColor = RGBACOLOR(237, 121, 133, 1);
    self.tabBar.translucent = NO;
    [self addChildViewController:nav];
}


@end
