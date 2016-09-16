//
//  VDUrlObject.h
//  chatDemo
//
//  Created by Donald on 16/9/10.
//  Copyright © 2016年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kPPUrlHttp @"http://www.popoteam.com:8080/"
//#define kPPUrlHttp @"http://192.168.3.170:8080/"
#pragma mark - user module
//登录
#define KPPUrlLogin [NSString stringWithFormat:@"%@app/user/login",kPPUrlHttp]
#define KPPUrlResetPassWord [NSString stringWithFormat:@"%@app/user/resetPassword",kPPUrlHttp]

#define kPPUrlRegister [NSString stringWithFormat:@"%@app/user/register",kPPUrlHttp]

#define kPPUrlUpdatePassWord [NSString stringWithFormat:@"%@app/user/updatePassword",kPPUrlHttp]
//getInfo
#define kPPUrlGetInfo  [NSString stringWithFormat:@"%@app/user/getInfo",kPPUrlHttp]

//bindPhone
/**绑定手机号*/
#define kPPUrlBindPhone [NSString stringWithFormat:@"%@app/user/bindPhone",kPPUrlHttp]
//bindWeChat
#define kPPUrlBindWeChat [NSString stringWithFormat:@"%@app/user/bindWeChat",kPPUrlHttp]

#define kPPUrlSearchUsers [NSString stringWithFormat:@"%@app/user/search",kPPUrlHttp]


@interface VDUrlObject : NSObject

@end
