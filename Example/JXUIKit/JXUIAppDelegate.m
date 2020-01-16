//
//  JXUIAppDelegate.m
//  JXUIKit
//
//  Created by tospery on 01/15/2020.
//  Copyright (c) 2020 tospery. All rights reserved.
//

#import "JXUIAppDelegate.h"
#import "HomeViewController.h"

@implementation JXUIAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *homeNC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    self.window.rootViewController = homeNC;
    [self.window makeKeyAndVisible];
    
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].barTintColor = [UIColor orangeColor];
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName: [UIFont systemFontOfSize:17]};
    
    [self performSelector:@selector(test:) withObject:launchOptions afterDelay:3.0f];
    
    return YES;
}

- (void)test:(NSDictionary *)launchOptions {
    
}

- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
        _window.backgroundColor = UIColor.whiteColor;
    }
    return _window;
}

@end
