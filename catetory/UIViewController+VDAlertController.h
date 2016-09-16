//
//  UIViewController+VDAlertController.h
//  chatDemo
//
//  Created by vd on 16/9/16.
//  Copyright © 2016年 vd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewController (VDAlertController)
- (void)createAlertControllerTitle:(NSString *)title messageString:(NSString *)message ActionTitles:(NSArray<NSString *>*)actionTitles SelectorName:(NSArray <NSString *> *)selectorArr;

@end
