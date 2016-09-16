//
//  VDUserInfoEngine.h
//  chatDemo
//
//  Created by vd on 16/9/10.
//  Copyright © 2016年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VDUserInfoEngine : NSObject
@property (nonatomic,strong,readonly) VDUserInfo * info;
@property (nonatomic,strong,readonly) NSString * token;
@property (nonatomic,strong,readonly) NSString * curentPath;

+(instancetype)shareEngine;

- (void)saveUserInfo:(VDUserInfo *)info;


@end
