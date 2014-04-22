# TDBSplashscreen

TDBSplashscreen is a pod that allow you to show your splashscreen a little longer while loading new data into your app

## Requirements

- ARC only
- iOS 7.0+
- iPhone (iPad soon)
- Portrait orientation only (Landscape soon)

## Install

Just add the following line to your Podfile and run `pod install`

```ruby
pod 'AALaunchTransition'
```

## Usage

Here's an example of how you should use TDBSplashscreen

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    // Create your root view controller
    RootViewController *rootViewController = [[RootViewController alloc] initWithNibName@"RootViewController" bundle:nil];
    self.window.rootViewController = rootViewController;

    [TDBSplashscreen show];
    
    // Hide splashscreen in callback
    [[PayloadManager sharedInstance] loadInitialData:^{
        // callback
        [TDBSplashscreen dismiss];
    }];
    
    return YES;
}
```

You can also dismiss the splashscreen with a different animation
```objective-c
[TDBSplashscreen dismissWithAnimation:UIModalTransitionStyleCrossDissolve];
```

You can also add a completion handler to execute code when the splashscreen had been hidden
```objective-c
[TDBSplashscreen dismissWithAnimation:UIModalTransitionStyleCrossDissolve completion:^{
            
    // Splashscreen has been dismissed
            
}];
```
