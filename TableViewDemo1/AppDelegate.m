//
//  AppDelegate.m
//  TableViewDemo1
//
//  Created by lulu on 15/10/29.
//  Copyright © 2015年 cdlulu. All rights reserved.
//

#import "AppDelegate.h"
#import "UserGuideViewController.h"
#import "HomeTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]] ;
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        NSLog(@"第一次启动");
        //如果是第一次启动的话,使用UserGuideViewController (用户引导页面) 作为根视图
        UserGuideViewController *userGuideViewController = [[UserGuideViewController alloc] init];
        self.window.rootViewController = userGuideViewController;
    }
    else
    {
        NSLog(@"不是第一次启动");
        
//        HomeTableViewController *tranVC = [[HomeTableViewController alloc] init];
//        self.window.rootViewController = tranVC;
        
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController * vc = [story instantiateViewControllerWithIdentifier:@"tabBarVC"];
        self.window.rootViewController = vc;
        
    }
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    
    UIImageView *splashScreen=[[UIImageView alloc] initWithFrame:self.window.bounds];
    splashScreen.image = [UIImage imageNamed:@"splash.jpg"];
    [self.window addSubview:splashScreen];
    
    [UIView animateWithDuration:1.0 animations:^{
        CATransform3D transform = CATransform3DMakeScale(1.5, 1.5, 1.0);
        splashScreen.layer.transform = transform;
        splashScreen.alpha = 0.0;
    } completion:^(BOOL finished) {
        [splashScreen removeFromSuperview];
    }];
    
    
    
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
