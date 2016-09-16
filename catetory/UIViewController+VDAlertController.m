//
//  UIViewController+VDAlertController.m
//  chatDemo
//
//  Created by vd on 16/9/16.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "UIViewController+VDAlertController.h"

@implementation UIViewController (VDAlertController)
- (void)createAlertControllerTitle:(NSString *)title messageString:(NSString *)message ActionTitles:(NSArray<NSString *>*)actionTitles SelectorName:(NSArray <NSString *> *)selectorArr
{
    if(actionTitles.count!=selectorArr.count)
    {
        return;
    }
    if(actionTitles==nil||selectorArr == NULL)
    {
        return;
    }
    UIAlertController * alertContrller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertContrller addAction:cancelAction];
      [actionTitles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         UIAlertAction * action = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             SEL selector = NSSelectorFromString(selectorArr[idx]);
             SuppressPerformSelectorLeakWarning(
                [self performSelector:selector];);
         }];
         [alertContrller addAction:action];
      }];
    [self presentViewController:alertContrller animated:YES completion:nil];
}
@end
