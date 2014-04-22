//
//  3dBSplashscreen.h
//  3dB
//
//  Created by Tito on 21/04/2014.
//  Copyright (c) 2014 3dB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDBSplashscreen : NSObject

@property (strong, nonatomic) UIViewController *viewController;


#pragma mark - Singleton

+ (id)sharedInstance;


#pragma mark - Actions

+ (void)show;
+ (void)dismiss;

@end
