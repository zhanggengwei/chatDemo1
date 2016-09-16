//
//  VDRequestEngine.m
//  chatDemo
//
//  Created by Donald on 16/9/10.
//  Copyright © 2016年 123. All rights reserved.
//

#import "VDRequestEngine.h"
#import "VDHTTPRequestOperationManager.h"
#import "VDHttpResponse.h"

@implementation VDRequestEngine
+ (instancetype)shareEngine
{
    static VDRequestEngine * engine;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        engine = [VDRequestEngine new];
    });
    return engine;
}
- (void)saveUserInfoPrivateInfoAccount:(NSString *)account token:(NSString *)tokenString
{
    [SFHFKeychainUtils storeUsername:account andPassword:tokenString forServiceName:VDServiceName updateExisting:YES error:nil];
    
    
}
- (void)_completeWithResponse:(VDHttpResponse *)aResponse block:(PPResponseBlock())aResponseBlock
{
    if (aResponseBlock) {
        aResponseBlock(aResponse);
    }
}
- (void)requsetLoginResonse:(PPResponseBlock())responseBlock Account:(NSString *)account passWord:(NSString *)pasWord
{
    VDHTTPRequestOperationManager * manager = [VDHTTPRequestOperationManager manager];
    NSDictionary * dict = @{@"account":[@"+86" stringByAppendingString: account],@"password":pasWord,@"type":@"1",@"device":@"1"};
    [manager GET:KPPUrlLogin parameters:dict success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSError * error;
        VDLoginResponse * info = [[VDLoginResponse alloc]initWithData:responseObject error:&error];
        if(info.code.integerValue == kppRequestSucessCode)
        {
            [self saveUserInfoPrivateInfoAccount:info.authorization.account token:info.authorization.token];
            [[VDUserInfoEngine shareEngine]saveUserInfo:info.object];
            VDImUser * user = info.object.imUser;
            
            [[RJChatTools shareManager] login:user.userName andPassword:user.password];
        }
        [self _completeWithResponse:info block:responseBlock];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        VDHttpResponse * response = [VDHttpResponse responseWithError:error];
      [self _completeWithResponse:response block:responseBlock];
        
    }];
}

- (void)requestResetPassWordResponse:(PPResponseBlock())responseBlock Account:(NSString *)account passWord:(NSString *)pasWord Code:(NSString *)code
{
    VDHTTPRequestOperationManager * manager = [VDHTTPRequestOperationManager manager];
    NSDictionary * dict = @{@"account":[@"+86" stringByAppendingString: account],@"password":pasWord,@"code":code};
    
    [manager POST:KPPUrlResetPassWord parameters:dict success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSError * error;
        VDLoginResponse * info1 = [[VDLoginResponse alloc]initWithData:responseObject error:&error];
        [self _completeWithResponse:info1 block:responseBlock];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        VDHttpResponse * response = [VDHttpResponse responseWithError:error];
        [self _completeWithResponse:response block:responseBlock];
        
    }];
}
- (void)requestRegisterResponse:(PPResponseBlock())responseBlock Account:(NSString *)account passWord:(NSString *)passWord userNickName:(NSString *)nickName  Code:(NSString *)code Birthday:(NSString *)birthday weChatID:(NSString *)weChatID Sex:(NSString *)sex iconImageFiles:(UIImage *)image
{
     VDHTTPRequestOperationManager * manager = [VDHTTPRequestOperationManager manager];
    
    NSMutableDictionary * dict = [NSMutableDictionary new];
    if([account isValid])
    {
        [dict setObject:[@"" stringByAppendingString:account] forKey:@"account"];
    }
    if([passWord isValid])
    {
        [dict setObject:passWord forKey:@"password"];
    }
    if([code isValid])
    {
        [dict setObject:code forKey:@"code"];
    }
    if([birthday isValid])
    {
        [dict setObject:birthday forKey:@"birthday"];
        
    }
    if([weChatID isValid])
    {
        [dict setObject:weChatID forKey:@"wechatId"];
        
    }
    if([sex isValid])
    {
        [dict setObject:sex forKey:@"sex"];
    }
    if([nickName isValid])
    {
        [dict setObject:nickName forKey:@"nickName"];
        
    }
    [manager POST:kPPUrlRegister parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.9) name:@"uploadfile" fileName:fileName mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSError * error;
        VDLoginResponse * info1 = [[VDLoginResponse alloc]initWithData:responseObject error:&error];
        [self _completeWithResponse:info1 block:responseBlock];
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        VDHttpResponse * response = [VDHttpResponse responseWithError:error];
        [self _completeWithResponse:response block:responseBlock];
    }];
}


- (void)requestUpdatePassWord:(PPResponseBlock())responseBlock oldPassWord:(NSString *)oldPassword newPassWord:(NSString *)passWord
{
    VDHTTPRequestOperationManager * manager = [VDHTTPRequestOperationManager manager];
      [manager.requestSerializer setValue:[VDUserInfoEngine shareEngine].token forHTTPHeaderField:@"Authorization"];
    
    NSDictionary * parm = @{@"oldPassword":oldPassword,@"password":passWord};
    [manager POST:kPPUrlUpdatePassWord parameters:parm success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];
}

- (void)requestGetUserInfo:(PPResponseBlock())responseBlock
{
    VDHTTPRequestOperationManager * manager = [VDHTTPRequestOperationManager manager];
    
    [manager.requestSerializer setValue:[VDUserInfoEngine shareEngine].token forHTTPHeaderField:@"Authorization"];
    
    [manager GET:kPPUrlGetInfo parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];
    
}
- (void)requsetSearchUser:(PPResponseBlock())responseBlock identify:(NSString *)aidentify
{
    VDHTTPRequestOperationManager * manager = [VDHTTPRequestOperationManager manager];
    
    [manager.requestSerializer setValue:[VDUserInfoEngine shareEngine].token forHTTPHeaderField:@"Authorization"];
    [manager GET:kPPUrlSearchUsers parameters:@{@"identify":aidentify} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
    }];
    
}

- (void)requsetBindPhone:(PPResponseBlock())responseBlock phone:(NSString *)aphoneNumber Code:(NSString *)acode PassWord:(NSString *)apassWord
{
    VDHTTPRequestOperationManager * manager = [VDHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:[VDUserInfoEngine shareEngine].token forHTTPHeaderField:@"Authorization"];
    NSMutableDictionary * parm = [NSMutableDictionary new];
    [parm setObject:acode forKey:@"code"];
    [parm setObject:apassWord forKey:@"password"];
    [parm setObject:aphoneNumber forKey:@"phone"];
    [manager POST:kPPUrlBindPhone parameters:parm success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];
    
}

- (void)requsetBindWeChat:(PPResponseBlock())responseBlock weChatId:(NSString *)aweChatId
{
    VDHTTPRequestOperationManager * manager = [VDHTTPRequestOperationManager manager];
     [manager.requestSerializer setValue:[VDUserInfoEngine shareEngine].token forHTTPHeaderField:@"Authorization"];
    [manager POST:kPPUrlBindWeChat parameters:@{@"weChatId":aweChatId} success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];
}

@end
