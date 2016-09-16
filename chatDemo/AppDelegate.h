//
//  AppDelegate.h
//  chatDemo
//
//  Created by 123 on 16/6/10.
//  Copyright © 2016年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftSlideViewController.h"
@class LeftSlideViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) LeftSlideViewController *LeftSlideVC;
@property (strong, nonatomic) UITabBarController *mainNavigationController;

@end

