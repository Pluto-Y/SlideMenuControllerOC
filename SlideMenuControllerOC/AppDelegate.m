//
//  AppDelegate.m
//  SlideMenuControllerOC
//
//  Created by ChipSea on 16/2/27.
//  Copyright © 2016年 pluto-y. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "ExSlideMenuController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)createMenuView {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainViewController *mainViewController = (MainViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    LeftViewController *leftViewController = (LeftViewController *)[storyboard instantiateViewControllerWithIdentifier:@"LeftViewController"];
    RightViewController *rightViewController = (RightViewController *)[storyboard instantiateViewControllerWithIdentifier:@"RightViewController"];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    [UINavigationBar appearance].tintColor = [UIColor colorFromHexString:@"689F38"];
    
    leftViewController.mainViewControler = nvc;
    
    ExSlideMenuController *slideMenuController = [[ExSlideMenuController alloc] initWithMainViewController:nvc leftMenuViewController:leftViewController rightMenuViewController:rightViewController];
    slideMenuController.automaticallyAdjustsScrollViewInsets = YES;
    slideMenuController.delegate = mainViewController;
    self.window.backgroundColor = [UIColor colorWithRed:236.0 green:238.0 blue:241.0 alpha:1.0];
    self.window.rootViewController = slideMenuController;
    [self.window makeKeyWindow];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self createMenuView];
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
