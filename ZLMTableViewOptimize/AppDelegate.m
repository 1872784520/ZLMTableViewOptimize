//
//  AppDelegate.m
//  ZLMTableViewOptimize
//
//  Created by Apple on 2018/9/3.
//  Copyright © 2018年 ruanmeng. All rights reserved.
//

#import "AppDelegate.h"
#import "MyNavigationViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    
    OneViewController *test = [[OneViewController alloc] init];
    
    UINavigationController *navTest = [[UINavigationController alloc] initWithRootViewController:test];
    navTest.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"home_tabbar_one"] selectedImage:[[UIImage imageNamed:@"home_tabbar_one_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]] ;
    navTest.tabBarItem.image = [[UIImage imageNamed:@"home_tabbar_one"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //导航背景2@2x.png
    [navTest.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航背景2"] forBarMetrics:UIBarMetricsDefault];
    
    navTest.navigationItem.title = @"ZLM";
    
    
    TwoViewController *testTwo = [[TwoViewController alloc] init];
    
    MyNavigationViewController *navTestTwo = [[MyNavigationViewController alloc] initWithRootViewController:testTwo];
    navTestTwo.tabBarItem=[[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"home_tabbar_two"] selectedImage:[[UIImage imageNamed:@"home_tabbar_two_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]] ;
    navTestTwo.tabBarItem.image = [[UIImage imageNamed:@"home_tabbar_one"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    
    
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    
    tabbar.viewControllers=@[navTest,navTestTwo];
    self.window.rootViewController = tabbar;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
