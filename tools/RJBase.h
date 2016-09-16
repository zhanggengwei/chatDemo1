//
//  RJBase.h
//  chatDemo
//
//  Created by vd on 16/7/31.
//  Copyright © 2016年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RJBase : NSObject
UINavigationController* rootViewController();
UIViewController *lastPresentedController();
@end
