//
//  VDUserInfoEngine.m
//  chatDemo
//
//  Created by vd on 16/9/10.
//  Copyright © 2016年 123. All rights reserved.
//

#import "VDUserInfoEngine.h"
#import "VDFileManager.h"

@interface VDUserInfoEngine ()
@property (nonatomic,strong) VDUserInfo * info;
@property (nonatomic,strong) NSString * token;
@property (nonatomic,strong) NSString * curentPath;

@end

@implementation VDUserInfoEngine
@synthesize info = _info;
+(instancetype)shareEngine
{
    static VDUserInfoEngine * engine;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        engine = [VDUserInfoEngine new];
    });
    return engine;
}
-(void)loadUserInfo
{
    
}
- (void)saveUserInfo:(VDUserInfo *)info
{
    self.info = info;
    [[VDTDBEnginer shareManager]saveUserInfo:info];
    
}
- (NSString *)curentPath
{
    if(!self.info)
    {
        return @"";
    }
    VDFileManager * manager = [VDFileManager sharedManager];
    NSString * curPath = [manager pathForDomain:PPFileDirDomain_User appendPathName:[[VDUserInfoEngine shareEngine].info.identify md5]];
    [manager createPath:curPath];
    _curentPath = curPath;
    return _curentPath;
}


@end
