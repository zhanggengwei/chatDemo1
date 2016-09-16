//
//  RJChatTools.h
//  chatDemo
//
//  Created by vd on 16/7/29.
//  Copyright © 2016年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RJChatTools : NSObject

+(instancetype)shareManager;
-(void)registerAppkey:(NSString *)appkey;
@property (nonatomic,strong) EMClient * client;
-(BOOL)isAutoLogin;
-(void)setIsAutoLogin:(BOOL)state;
-(void)login:(NSString *)username andPassword:(NSString *)passWord;
-(void)addPerson:(NSString *)userID andUserMessage:(NSString *)message;
// 退出登陆状态
-(void)logout;
-(NSArray *)getContlistFromServer;
-(NSString *)username;
@end
