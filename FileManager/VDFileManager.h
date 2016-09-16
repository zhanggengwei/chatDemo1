//
//  PPFileManager.h
//  PPDate
//
//  Created by bobo on 16/4/25.
//  Copyright © 2016年 郭远强. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_OPTIONS(NSUInteger, PPFileDirDomain)
{
    //下面的目录都不会被ICloud
    PPFileDirDomain_Temp,
    PPFileDirDomain_Pub,                    // Public 公用的文件夹
    PPFileDirDomain_User,                   // User 用户相关的数据
    PPFileDirDomain_Options,                // LDFileDirDomain_Pub/Options 备选项
};

@interface VDFileManager : NSObject

+ (instancetype)sharedManager;


- (NSString *)pathForDomain:(PPFileDirDomain)aDirDomain;
- (NSString *)pathForDomain:(PPFileDirDomain)aDirDomain appendPathName:(NSString *)aAppendPathName;

- (BOOL)saveDic:(NSDictionary *)aDic atFilePath:(NSString *)aFilePath;
- (NSDictionary *)loadDicAtFilePath:(NSString *)aFilePath;

- (BOOL)saveObject:(id)aObject atFilePath:(NSString *)aFilePath;
- (id)loadObjectAtFilePath:(NSString *)aFilePath;

- (BOOL)saveOptionsDic:(NSDictionary *)aDic withOptionFileName:(NSString *)aFileName;
- (NSDictionary *)loadOptionsDicWithOptionFileName:(NSString *)aFileName;

- (void)removeFileAtPath:(NSString *)aPath;

- (NSArray *)fileListAtPath:(NSString *)aPath;

- (void)createPath:(NSString *)path;
@end
