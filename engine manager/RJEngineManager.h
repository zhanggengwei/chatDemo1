//
//  RJEngineManager.h
//  chatDemo
//
//  Created by vd on 16/7/31.
//  Copyright © 2016年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RJEngineManager : NSObject
+(instancetype)shareManager;
@property (nonatomic,strong) UITabBarController * tabbarController;
@property (nonatomic,strong) UIViewController * leftViewController;
@property (nonatomic,strong) UIViewController * loginViewControlelr;

@end
