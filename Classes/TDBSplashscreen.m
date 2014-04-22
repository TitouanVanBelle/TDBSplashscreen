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
        self.viewController = [[UIViewController alloc] initWithNibName:nil bundle:nil];
        
        UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.viewController.view.frame];
        backgroundImage.image = [self launchImage];
        
        [self.viewController.view addSubview:backgroundImage];
    }
    
    return self;
}


#pragma mark - Shortcuts

+ (void)show
{
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    TDBSplashscreen *this = [TDBSplashscreen sharedInstance];
        
    [window.rootViewController presentViewController:this.viewController animated:NO completion:^{
        NSLog(@"Shown");
    }];
}


+ (void)dismiss
{
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    [window.rootViewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Dismissed");
    }];
}


#pragma mark - Interface

-(UIImage *)launchImage
{
    UIImage *launchImage;
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            if ([[UIScreen mainScreen] bounds].size.height == 568.0f) {
                launchImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LaunchImage-700-568h@2x" ofType:@"png"]];
            }
            else {
                launchImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"]];
            }
        }
        else {
            launchImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Default-Portrait" ofType:@"png"]];
        }
    } else {
        launchImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Default-Landscape" ofType:@"png"]];
    }
    
    return launchImage;
}


@end
