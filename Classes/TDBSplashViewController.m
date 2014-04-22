//
//  TDBSplashViewController.m
//  TDBSplashscreen
//
//  Created by Titouan Van Belle on 22/04/14.
//  Copyright (c) 2014 3dB. All rights reserved.
//

#import "TDBSplashViewController.h"

@interface TDBSplashViewController ()

@end

@implementation TDBSplashViewController


#pragma mark - Initialization

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}


-(void)viewDidLayoutSubviews
{
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImage.image = [self launchImage];
    
    [self.view addSubview:backgroundImage];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Status Bar Methods

- (BOOL)prefersStatusBarHidden
{
    return [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"UIStatusBarHidden"] intValue];
}


#pragma mark - Launch Image Methods

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
                launchImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LaunchImage-700@2x" ofType:@"png"]];
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
