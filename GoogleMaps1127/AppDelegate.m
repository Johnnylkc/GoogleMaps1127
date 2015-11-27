//
//  AppDelegate.m
//  GoogleMaps1127
//
//  Created by 劉坤昶 on 2015/11/27.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeTVC.h"
#import "MyOrderTVC.h"
#import "SearchClassTVC.h"
#import "SearchCourtTVC.h"
#import "MoreTVC.h"


@import GoogleMaps;


@interface AppDelegate ()

@property (strong , nonatomic) UITabBarController *tabBarController;
@property (strong , nonatomic) UIImage *tabImage;
@property (strong , nonatomic) UIImage *tabImageSelected;



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    HomeTVC *onePage = [[HomeTVC alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:onePage];
    self.tabImage = [UIImage imageNamed:@"001"];
    self.tabImageSelected = [UIImage imageNamed:@"001"];
    onePage.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"探索" image: self.tabImage selectedImage:self.tabImageSelected];
    

    MyOrderTVC *twoPage = [[MyOrderTVC alloc] init];
    UINavigationController *twoNav = [[UINavigationController alloc] initWithRootViewController:twoPage];
    self.tabImage = [UIImage imageNamed:@"002"];
    self.tabImageSelected = [UIImage imageNamed:@"002"];
    twoPage.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"我的訂課" image: self.tabImage selectedImage:self.tabImageSelected];

    
    SearchClassTVC *threePage = [[SearchClassTVC alloc] init];
    UINavigationController *threeNav = [[UINavigationController alloc] initWithRootViewController:threePage];
    self.tabImage = [UIImage imageNamed:@"003"];
    self.tabImageSelected = [UIImage imageNamed:@"003"];
    threePage.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"找課程" image: self.tabImage selectedImage:self.tabImageSelected];

    
    SearchCourtTVC *fourPage = [[SearchCourtTVC alloc] init];
    UINavigationController *fourNav = [[UINavigationController alloc] initWithRootViewController:fourPage];
    self.tabImage = [UIImage imageNamed:@"004"];
    self.tabImageSelected = [UIImage imageNamed:@"004"];
    fourPage.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"找場館" image: self.tabImage selectedImage:self.tabImageSelected];

    
    
    MoreTVC *fivePage = [[MoreTVC alloc] init];
    UINavigationController *fiveNav = [[UINavigationController alloc] initWithRootViewController:fivePage];
    self.tabImage = [UIImage imageNamed:@"005"];
    self.tabImageSelected = [UIImage imageNamed:@"005"];
    fivePage.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"更多" image: self.tabImage selectedImage:self.tabImageSelected];

    NSArray *allNav = [[NSArray alloc] initWithObjects:homeNav,twoNav,threeNav,fourNav,fiveNav, nil];
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = allNav;
    [[UITabBar appearance] setTintColor:[UIColor cyanColor]];
    
    
    [GMSServices provideAPIKey:@"AIzaSyAiP1Z28oeEuJ2712SKrIgcNGGerugMOto"];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen ].bounds];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
