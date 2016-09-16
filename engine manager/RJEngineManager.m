//
//  RJEngineManager.m
//  chatDemo
//
//  Created by vd on 16/7/31.
//  Copyright © 2016年 123. All rights reserved.
//

#import "RJEngineManager.h"
#import "LeftSlideViewController.h"
#import "LeftSortsViewController.h"
@implementation RJEngineManager
+(instancetype)shareManager{
    static RJEngineManager * instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}
-(UIViewController *)leftViewController{
    if(_leftViewController == nil){
        LeftSortsViewController *leftVC = [[LeftSortsViewController alloc] init];
        _leftViewController = [[LeftSlideViewController alloc] initWithLeftView:leftVC andMainView:self.tabbarController];
        
    }
    return _leftViewController;
}
-(UITabBarController *)tabbarController{
    if(_tabbarController==nil){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"RJTabbarController" bundle:nil];
        _tabbarController = [storyboard instantiateViewControllerWithIdentifier:@"TabbarController"];
    }
    return _tabbarController;

}
-(UIViewController *)loginViewControlelr{
    if(_loginViewControlelr == nil){
        UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        _loginViewControlelr = [storyboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
    
    }
    return _loginViewControlelr;


}
@end
