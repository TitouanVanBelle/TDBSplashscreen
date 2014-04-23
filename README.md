# TDBSplashscreen

TDBSplashscreen is a pod that allow you to show your splashscreen a little longer while loading new data into your app

## Requirements

- ARC only
- iOS 7.0+
- iPhone (iPad soon)
- Portrait orientation only (Landscape soon)

## Install

TDBSplashscreen is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

```ruby
pod 'TDBSplashscreen'
```

## Usage

To run the example project run `pod try TDBSplashscreen`. Or go manual way: clone the repo, run `pod install` from the Example directory, open the workspace.

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

## Author

Titouan Van Belle, titouan.vanbelle@gmail.com

## License

TDBSplashscreen is available under the MIT license. See the LICENSE file for more info.
