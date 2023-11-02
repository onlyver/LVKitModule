//
//  LVTabBarController.h
//  LVKitModule
//
//  Created by LiLver on 2023/10/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define kCustomizeTabBar 0
NSString *kTabBarOrderPrefKey = @"kTabBarOrder";

@interface LVTabBarController : UITabBarController
- (void)saveTabOrder;
@end

NS_ASSUME_NONNULL_END
