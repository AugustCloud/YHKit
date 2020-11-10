#import "SceneDelegate.h"
#import "BaseNavigationController.h"
#import "BaseTabBarController.h"
#import "MainViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    NSLog(@"2");
    
    
    self.window.rootViewController = [[BaseTabBarController alloc] init];
    [self.window resignKeyWindow];
}

#pragma mark - 当场景被系统释放时调用。后台杀掉app时调用(杀死 1)
- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}

#pragma mark - 场景进入活跃状态 (激活 2)
- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.当场景从非活动状态移动到活动状态时调用。
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.使用此方法可以重新启动场景处于非活动状态时已暂停（或尚未开始）的所有任务。
    NSLog(@"4");
}

#pragma mark - 场景将要辞去活跃状态(退出 1)
- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.当场景从活动状态移动到非活动状态时调用。
    // This may occur due to temporary interruptions (ex. an incoming phone call).这可能是由于临时中断(如来电)造成的。
}

#pragma mark - 当场景从背景过渡到前景时调用。(激活 1)
- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.当场景从背景过渡到前景时调用。
    // Use this method to undo the changes made on entering the background.使用此方法撤消进入后台时所做的更改。
    NSLog(@"3");
}

#pragma mark - 当场景从前景过渡到背景时调用。(退出 2)
- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.当场景从前景过渡到背景时调用。
    // Use this method to save data, release shared resources, and store enough scene-specific state information使用此方法来保存数据、释放共享资源和存储足够的场景特定的状态信息
    // to restore the scene back to its current state.将场景恢复到当前状态。
}


@end
