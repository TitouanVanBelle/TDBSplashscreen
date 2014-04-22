//
//  3dBSplashscreen.h
//  3dB
//
//  Created by Tito on 21/04/2014.
//  Copyright (c) 2014 3dB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDBSplashViewController.h"

@interface TDBSplashscreen : NSObject

@property (strong, nonatomic) TDBSplashViewController *viewController;


#pragma mark - Singleton

+ (id)sharedInstance;


#pragma mark - Actions

+ (void)show;
+ (void)dismiss;
+ (void)dismissWithAnimation:(UIModalTransitionStyle)animation;
+ (void)dismissWithAnimation:(UIModalTransitionStyle)animation completion:(void (^)(void))completion;

@end
