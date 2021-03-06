//
//  _dBAppDelegate.m
//  3dB
//
//  Created by Tito on 21/04/2014.
//  Copyright (c) 2014 3dB. All rights reserved.
//

#import "TDBAppDelegate.h"
#import "TDBSplashscreen.h"

@implementation _dBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Root view controller
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor redColor];
    self.window.rootViewController = viewController;

    TDBSplashscreen *splashcreen = [TDBSplashscreen sharedInstance];
    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 568, 320, 26)];
    loadingLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:.75];
    loadingLabel.text = @"Downloading new version";
    loadingLabel.font = [UIFont systemFontOfSize:14];
    loadingLabel.textColor = [UIColor whiteColor];
    loadingLabel.textAlignment = NSTextAlignmentCenter;
    [splashcreen.viewController.view addSubview:loadingLabel];
    
    [TDBSplashscreen show];
    
    [UIView animateWithDuration:.3 animations:^{
        loadingLabel.frame = CGRectMake(0, 542, 320, 26);
    }];
    
    // 10 Second Loading time
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [TDBSplashscreen dismissWithAnimation:UIModalTransitionStyleCrossDissolve completion:^{
            
            // Splashscreen has been dismissed
            
        }];
    });
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
