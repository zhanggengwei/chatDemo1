//
//  VDHttpResponse.m
//  chatDemo
//
//  Created by Donald on 16/9/10.
//  Copyright © 2016年 123. All rights reserved.
//

#import "VDHttpResponse.h"

@implementation VDHttpResponse
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
+ (id)responseWithError:(NSError *)aError
{
    VDHttpResponse *response = [[[self class] alloc] init];
    response.message = [aError localizedDescription];
    return response;
}
@end
@implementation VDAuthorization
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
@end
@implementation VDUserInfo
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
@end
@implementation VDAddress
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
@end
@implementation VDImUser
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
@end
@implementation VDInterestListModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
@end
@implementation VDAlbum
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
@end

@implementation VDJobListModel
+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"ID",
                                                }];
}
@end
@implementation VDAuthorizationResponse
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
    
}
@end
@implementation VDLoginResponse
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
    
}
@end

@implementation  VDSearchResponse
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return  YES;
}
@end