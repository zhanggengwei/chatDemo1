//
//  RJTabViewController.m
//  chatDemo
//
//  Created by vd on 16/7/30.
//  Copyright © 2016年 123. All rights reserved.
//

#import "RJTabViewController.h"

@interface RJTabViewController ()

@end

@implementation RJTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"fdsfdsdfs";
    self.viewControllers[0].tabBarItem.image = [self reSizeImage:[UIImage imageNamed:@"msg"] toSize:CGSizeMake(30, 28)];
   
    
     self.viewControllers[0].tabBarItem.selectedImage = [self reSizeImage:[UIImage imageNamed:@"sel_msg"] toSize:CGSizeMake(30, 28)];
    [self.viewControllers[0].tabBarItem setTitle:@"我的消息"];
    self.viewControllers[1].tabBarItem.image = [self reSizeImage:[UIImage imageNamed:@"contact"] toSize:CGSizeMake(30, 28)];
    [self.viewControllers[1].tabBarItem setTitle:@"联系人"];
    self.viewControllers[1].tabBarItem.selectedImage = [self reSizeImage:[UIImage imageNamed:@"sel_contact"] toSize:CGSizeMake(30, 28)];
    
    self.viewControllers[2].tabBarItem.image = [self reSizeImage:[UIImage imageNamed:@"mydy"] toSize:CGSizeMake(30, 28)];
    self.viewControllers[2].tabBarItem.selectedImage = [self reSizeImage:[UIImage imageNamed:@"sel_mydy"] toSize:CGSizeMake(30, 28)];
     [self.viewControllers[2].tabBarItem setTitle:@"我的动态"];
    self.selectedIndex = 0;
    
    // Do any additional setup after loading the view.
}

- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize


{
    
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    return reSizeImage;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
