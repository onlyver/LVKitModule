//
//  LVTabBarController.m
//  LVKitModule
//
//  Created by LiLver on 2023/10/29.
//

#import "LVTabBarController.h"

@interface LVTabBarController ()

@end

@implementation LVTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}

/**进入后台时保存tab排序*/
- (void)saveTabOrder
{
    // Store the tab-order to preferences.
    NSMutableArray *classNames = [[NSMutableArray alloc] init];
    for (UIViewController *controller in self.viewControllers)
    {
        if ([controller isKindOfClass:[UINavigationController class]])
        {
            UINavigationController *navController = (UINavigationController *)controller;
            
            [classNames addObject:NSStringFromClass([navController.topViewController class])];
        }
        else
        {
            [classNames addObject:NSStringFromClass([controller class])];
        }
    }
    [[NSUserDefaults standardUserDefaults] setObject:classNames forKey:kTabBarOrderPrefKey];
    
}

@end
