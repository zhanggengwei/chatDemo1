//
//  RJBase.m
//  chatDemo
//
//  Created by vd on 16/7/31.
//  Copyright © 2016年 123. All rights reserved.
//

#import "RJBase.h"

#import "AppDelegate.h"


@implementation RJBase
UINavigationController* rootViewController()
{
    UINavigationController *rootViewControler = (UINavigationController *)[[UIApplication sharedApplication].delegate window].rootViewController;
    return rootViewControler;
}
UIViewController *lastPresentedController()
{
    UIViewController *controller = rootViewController();
    while (controller.presentedViewController)
    {
        controller = controller.presentedViewController;
    }
    return controller;
}

UIViewController *currentViewController()
{
    return nil;
}

@end
