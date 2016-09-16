//
//  VDRequestEngine.h
//  chatDemo
//
//  Created by Donald on 16/9/10.
//  Copyright © 2016年 123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDUrlObject.h"
#define PPResponseBlock(blockName) void(^blockName)(id aTaskResponse)
@interface VDRequestEngine : NSObject
+ (instancetype)shareEngine;
- (void)requsetLoginResonse:(PPResponseBlock())responseBlock Account:(NSString *)account passWord:(NSString *)pasWord;
- (void)requestResetPassWordResponse:(PPResponseBlock())responseBlock Account:(NSString *)account passWord:(NSString *)pasWord Code:(NSString *)code;
- (void)requestRegisterResponse:(PPResponseBlock())responseBlock Account:(NSString *)account passWord:(NSString *)passWord userNickName:(NSString *)nickName  Code:(NSString *)code Birthday:(NSString *)birthday weChatID:(NSString *)weChatID Sex:(NSString *)sex iconImageFiles:(UIImage *)image;
- (void)requestUpdatePassWord:(PPResponseBlock())responseBlock oldPassWord:(NSString *)oldPassword newPassWord:(NSString *)passWord;
- (void)requestGetUserInfo:(PPResponseBlock())responseBlock;

- (void)requsetSearchUser:(PPResponseBlock())responseBlock identify:(NSString *)aidentify;
- (void)requsetBindPhone:(PPResponseBlock())responseBlock phone:(NSString *)aphoneNumber Code:(NSString *)acode PassWord:(NSString *)apassWord;
- (void)requsetBindWeChat:(PPResponseBlock())responseBlock weChatId:(NSString *)aweChatId;



@end
