//
//  3dBSplashscreen.m
//  3dB
//
//  Created by Tito on 21/04/2014.
//  Copyright (c) 2014 3dB. All rights reserved.
//

#import "TDBSplashscreen.h"

@implementation TDBSplashscreen

#pragma mark - Initialization

+ (UIViewController *)init
{
    return [TDBSplashscreen sharedInstance];
}

+ (id)sharedInstance
{
    static TDBSplashscreen *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithLove];
    });
    return sharedInstance;
}

- (id)initWithLove
{
    self = [super init];
    
    if (self) {
        self.viewController = [[TDBSplashViewController alloc] initWithNibName:nil bundle:nil];
    }
    
    return self;
}


#pragma mark - Shortcuts

+ (void)show
{
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    TDBSplashscreen *this = [TDBSplashscreen sharedInstance];
    
    [window.rootViewController presentViewController:this.viewController animated:NO completion:nil];
}


+ (void)dismiss
{
    [TDBSplashscreen dismissWithAnimation:UIModalTransitionStyleCoverVertical completion:nil];
}


+ (void)dismissWithAnimation:(UIModalTransitionStyle)animation
{
    [TDBSplashscreen dismissWithAnimation:animation completion:nil];
}


+ (void)dismissWithAnimation:(UIModalTransitionStyle)animation completion:(void (^)(void))completion
{
    TDBSplashscreen *this = [TDBSplashscreen sharedInstance];
    
    if (animation) {
        this.viewController.modalTransitionStyle = animation;
    }
    
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    [window.rootViewController dismissViewControllerAnimated:YES completion:^{
        if (completion) {
            completion();
        }
    }];
}

@end
