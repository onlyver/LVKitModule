//
//  LVAppDelegate.m
//  LVKitModule
//
//  Created by onlyver on 10/29/2023.
//  Copyright (c) 2023 onlyver. All rights reserved.
//

#import "LVAppDelegate.h"
#import <LVKitModule/LVKitModule.h>
#import "CrossfadeAnimationController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveVC.h"
#import "SixVC.h"

@interface LVAppDelegate () <UIApplicationDelegate, UITabBarControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) LVTabBarController *myTabBarController;
@property (nonatomic, strong) CrossfadeAnimationController *animationController;

@end

@implementation LVAppDelegate

- (LVTabBarController *)myTabBarController{
    if (!_myTabBarController){
        _myTabBarController = LVTabBarController.new;
        _myTabBarController.viewControllers = @[OneViewController.new,TwoViewController.new,ThreeViewController.new,FourViewController.new,FiveVC.new,SixVC.new];
        #if kCustomizeTabBar
            self.myTabBarController.tabBar.barTintColor = [UIColor greenColor];
            self.myTabBarController.tabBar.tintColor = [UIColor systemPinkColor];
            // Note:
            // 1) You can also apply additional custom appearance to UITabBar using:
            // "backgroundImage" and "selectionIndicatorImage".
            // 2) You can also customize the appearance of individual UITabBarItems as well.
        #endif
        
            NSArray *classNames = [[NSUserDefaults standardUserDefaults] arrayForKey:kTabBarOrderPrefKey];
            if (classNames.count > 0)
            {
                NSMutableArray *controllers = [[NSMutableArray alloc] init];
                for (NSString *className in classNames)
                {
                    for (UIViewController* controller in _myTabBarController.viewControllers)
                    {
                        NSString* controllerClassName = nil;
        
                        if ([controller isKindOfClass:[UINavigationController class]])
                        {
                            controllerClassName = NSStringFromClass([((UINavigationController *)controller).topViewController class]);
                        }
                        else
                        {
                            controllerClassName = NSStringFromClass([controller class]);
                        }
        
                        if ([className isEqualToString:controllerClassName])
                        {
                            [controllers addObject:controller];
                            break;
                        }
                    }
                }
        
                if (controllers.count == _myTabBarController.viewControllers.count)
                {
                    _myTabBarController.viewControllers = controllers;
                }
        
            }
        
        _myTabBarController.moreNavigationController.delegate = self;
         NSMutableArray *customizeableViewControllers = (NSMutableArray *)_myTabBarController.viewControllers;
         for (UIViewController *viewController in customizeableViewControllers)
         {
             if ([viewController isKindOfClass:[FiveVC class]])
             {
                 [customizeableViewControllers removeObject:viewController];
                 break;
             }
         }
        _myTabBarController.customizableViewControllers = customizeableViewControllers;
         _animationController = [[CrossfadeAnimationController alloc] init];
         self.animationController.duration = 0.5;
    }
    return _myTabBarController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window.rootViewController = self.myTabBarController;
  
    return YES;
}
#pragma mark -


#pragma mark - UITabBarControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                              toViewController:(UIViewController *)toVC
{
    CrossfadeAnimationController *animator = nil;
    
    NSUInteger fromVCIdx = [tabBarController.viewControllers indexOfObject:fromVC];
    NSUInteger toVCIdx = [tabBarController.viewControllers indexOfObject:toVC];
    
    // For this particular example only cross-fade animate between tab 1 to tab 2.
    if ((fromVCIdx == 0 && toVCIdx == 1) || (fromVCIdx == 1 && toVCIdx == 0))
    {
        animator = self.animationController;
        self.animationController.reverse = fromVCIdx < toVCIdx;
    }
    
    return animator;
}

#pragma mark - UINavigationControllerDelegate (More screen)

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.myTabBarController.moreNavigationController.viewControllers[0])
    {
        // Returned to the More page.
    }
}

#pragma mark -
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self.myTabBarController saveTabOrder];
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
