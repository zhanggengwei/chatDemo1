//
//  RJChatTools.m
//  chatDemo
//
//  Created by vd on 16/7/29.
//  Copyright © 2016年 123. All rights reserved.
//

#import "RJChatTools.h"
@interface RJChatTools ()<EMClientDelegate,EMContactManagerDelegate>
@end

@implementation RJChatTools
+(instancetype)shareManager{
    static RJChatTools * instance;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        instance = [self new];
    });
    
    return instance;
}
-(BOOL)isAutoLogin{
   return  [self.client isAutoLogin];

}

-(instancetype)init{

    self = [super init];
    if(self){
        
        [self.client addDelegate:self delegateQueue:nil];
    
        [[EMClient sharedClient].contactManager addDelegate:self delegateQueue:nil];
        
      
    }
    return self;
    
}

-(NSString *)username{

  return  self.client.currentUsername;
}

-(void)login:(NSString *)username andPassword:(NSString *)passWord{

    [self.client loginWithUsername:username password:passWord completion:^(NSString *aUsername, EMError *aError) {
        NSLog(@"aerror==%@",aError);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.client.options setIsAutoLogin:YES];
            [[NSNotificationCenter defaultCenter]postNotificationName:LOGINSUCESS object:@(YES)];
        });
    }];
    

}

-(void)addPerson:(NSString *)userID andUserMessage:(NSString *)message{
    

    
    
    
  EMError * error =  [self.client.contactManager addContact:userID message:@"nihao"];
    
    if(error){
        NSLog(@"%@");
    }
    
}

//NSArray *userlist = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
//if (!error) {
//    NSLog(@"获取成功 -- %@",buddyList);
//}
-(NSArray *)getContlistFromServer{
    EMError * error;
  NSArray *userlist = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
  return userlist;
    
}


-(EMClient *)client{
    if(_client == nil){
        _client = [EMClient sharedClient];
        
    }
    return _client;

}
//[[EMClient sharedClient].options setIsAutoLogin:YES];
-(void)setIsAutoLogin:(BOOL)state{
    [self.client.options setIsAutoLogin:state];
    

}
-(void)registerAppkey:(NSString *)appkey{
    
    
    EMOptions * option = [EMOptions optionsWithAppkey:appkey];
   EMError * error = [self.client initializeSDKWithOptions:option];
    
    NSLog(@"error==%@",error);
    
}
-(void)logout{
    [self.client asyncLogout:YES success:^{
        NSLog(@"退出登陆成功");
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter]postNotificationName:LOGOUTSUCESS object:@(NO)];
        });
        
    } failure:^(EMError *aError) {
        NSLog(@"退出登陆失败");
        
    }];
    
    

}

/*  \~chinese
*  SDK连接服务器的状态变化时会接收到该回调
*
*  有以下几种情况, 会引起该方法的调用:
*  1. 登录成功后, 手机无法上网时, 会调用该回调
*  2. 登录成功后, 网络状态变化时, 会调用该回调

*/

- (void)didConnectionStateChanged:(EMConnectionState)aConnectionState{
    
}

/*!
 *  \~chinese
 *  自动登录失败时的回调
 *
 *  @param aError 错误信息
 *
 *  \~english
 *  Callback Automatic login fails
 *
 *  @param aError Error
 */
- (void)didAutoLoginWithError:(EMError *)aError{
    
    NSLog(@"用户自动登陆");
    


}

/*!
 *  \~chinese
 *  当前登录账号在其它设备登录时会接收到该回调
 *
 *  \~english
 *  Current login account to log in on other devices will receive the callback
 */
- (void)didLoginFromOtherDevice{

}

/*!
 *  \~chinese
 *  当前登录账号已经被从服务器端删除时会收到该回调
 *
 *  \~english
 *  Current login account will receive the callback is deleted from the server
 */
- (void)didRemovedFromServer{


}


#pragma mark EMContactManagerDelegate


/*!
 *  \~chinese
 *  用户B同意用户A的加好友请求后，用户A会收到这个回调
 *
 *  @param aUsername   用户B
 *
 *  \~english
 *  User A will receive this callback after user B agreed user A's add-friend invitation
 *
 *  @param aUsername   User B
 */
- (void)didReceiveAgreedFromUsername:(NSString *)aUsername{
    
    NSLog(@"用户同意被添加");

}

/*!
 *  \~chinese
 *  用户B拒绝用户A的加好友请求后，用户A会收到这个回调
 *
 *  @param aUsername   用户B
 *
 *  \~english
 *  User A will receive this callback after user B declined user A's add-friend invitation
 *
 *  @param aUsername   User B
 */
- (void)didReceiveDeclinedFromUsername:(NSString *)aUsername{
  NSLog(@"用户同意拒绝");
}

/*!
 *  \~chinese
 *  用户B删除与用户A的好友关系后，用户A会收到这个回调
 *
 *  @param aUsername   用户B
 *
 *  \~english
 *  User A will receive this callback after User B delete the friend relationship between user A
 *
 *  @param aUsername   User B
 */
- (void)didReceiveDeletedFromUsername:(NSString *)aUsername{
   NSLog(@"用户删除");
}

/*!
 *  \~chinese
 *  用户B同意用户A的好友申请后，用户A和用户B都会收到这个回调
 *
 *  @param aUsername   用户好友关系的另一方
 *
 *  \~english
 *  Both user A and B will receive this callback after User B agreed user A's add-friend invitation
 *
 *  @param aUsername   Another user of user‘s friend relationship
 */
- (void)didReceiveAddedFromUsername:(NSString *)aUsername{
  NSLog(@"用户");

}
- (void)didReceiveFriendInvitationFromUsername:(NSString *)aUsername
                                       message:(NSString *)aMessage{
  NSLog(@"用户申请");

}




@end
