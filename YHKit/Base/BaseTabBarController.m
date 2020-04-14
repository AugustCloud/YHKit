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
    [self addChildViewController:main title:@"首页" imageName:@"" selectImageName:@""];
    
    ExploreViewController *explore = [[ExploreViewController alloc] init];
    [self addChildViewController:explore title:@"探索" imageName:@"" selectImageName:@""];
    
    MyViewController *my = [[MyViewController alloc] init];
    [self addChildViewController:my title:@"我的" imageName:@"" selectImageName:@""];
}


- (void)addChildViewController:(UIViewController *)childController title:(NSString *)titlt imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName
{
    childController.title = titlt;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childController];
    
//    [nav setNavigationBarHidden:YES];
    self.tabBar.tintColor = [UIColor orangeColor];
    self.tabBar.translucent = NO;
    [self addChildViewController:nav];
    
}


@end
