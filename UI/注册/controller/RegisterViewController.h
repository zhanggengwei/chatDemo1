//
//  RegisterViewController.h
//  chatDemoWDdemo
//
//  Created by 123 on 16/6/9.
//  Copyright © 2016年 123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RJBaseViewController.h"
typedef NS_ENUM(NSInteger,ControlerStyle)
{
    VDReginsterController,
    VDResetPassWordController
 
};



@interface RegisterViewController : RJBaseViewController
@property (nonatomic,assign) ControlerStyle style;

@end
