//
//  VDTDBEnginer.h
//  chatDemo
//
//  Created by vd on 16/9/11.
//  Copyright © 2016年 vd. All rights reserved.
//

#import <Foundation/Foundation.h>
@class VDUserInfo;
@interface VDTDBEnginer : NSObject
+(instancetype)shareManager;

- (void)saveUserInfo:(VDUserInfo *)info;
- (VDUserInfo*)queryUserInfo;
@end
