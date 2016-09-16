//
//  PPFileManager.m
//  PPDate
//
//  Created by bobo on 16/4/25.
//  Copyright © 2016年 郭远强. All rights reserved.
//

#import "VDFileManager.h"
#import "OTFileManager.h"


@implementation VDFileManager

+ (instancetype)sharedManager
{
    static VDFileManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[[self class] alloc] init];
        
        [self initialize];
    });
    
    return _sharedManager;
}

- (void)initialize
{
    OTF_Initialize();
}

- (NSString *)pathForDomain:(PPFileDirDomain)aDirDomain;
{
    NSString *path = nil;
    
    switch (aDirDomain)
    {
        case PPFileDirDomain_Temp:
        {
            path = OTF_PathForDirDomain(OTF_Temp);
        }
            break;
        case PPFileDirDomain_Pub:
        {
            path = OTF_PathForDirDomain(OTF_PrivateDoucuments);
            path = [path stringByAppendingPathComponent:@"Public"];
        }
            break;
        case PPFileDirDomain_User:
        {
            path = OTF_PathForDirDomain(OTF_PrivateDoucuments);
            path = [path stringByAppendingPathComponent:@"User"];
        }
            break;
        case PPFileDirDomain_Options:
        {
            path = [self pathForDomain:PPFileDirDomain_Pub];
            path = [path stringByAppendingPathComponent:@"Options"];
        }
            break;
            
//        case PPFileDirDomain_CurUser:
//        {
//            path = [self pathForDomain:PPFileDirDomain_User];
////            NSString *userToken = [LDSettingsData stringOfKey:LDSettingsStrCurUserId];
////            path = [path stringByAppendingPathComponent:userToken];
//        }
            break;
       
        default:
            break;
    }
    return path;
}

- (NSString *)pathForDomain:(PPFileDirDomain)aDirDomain appendPathName:(NSString *)aAppendPathName
{
    NSString *path = [self pathForDomain:aDirDomain];
    path = [path stringByAppendingPathComponent:aAppendPathName];
    return path;
}

- (void)removeFileAtPath:(NSString *)aPath
{
    OTF_RemoveItem(aPath);
}

- (NSArray *)fileListAtPath:(NSString *)aPath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:aPath error:NULL];
    return fileList;
}


+ (BOOL)isLocalPath:(NSString *)aPath
{
    if ([aPath hasPrefix:@"http://"] || [aPath hasPrefix:@"https://"])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

- (BOOL)saveDic:(NSDictionary *)aDic atFilePath:(NSString *)aFilePath
{
    @try {
        
        NSMutableData *data = [[NSMutableData alloc] init];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [archiver encodeObject:[self objectFromObject:aDic]];
        [archiver finishEncoding];
        
        if (data != nil)
        {
            OTF_CreateFile(aFilePath, YES);
            
            BOOL isSuccess = [data writeToFile:aFilePath atomically:YES];
            return isSuccess;
        }
        else
        {
            return NO;
        }
    }
    @catch (NSException *exception) {
        //DDLogError(@"%@",exception);
        //        NSAssert(0, @"保存到文件错误");
        return NO;
    }
    @finally {
        
    }
    
}

- (NSDictionary *)loadDicAtFilePath:(NSString *)aFilePath
{
    @try {
        
        NSData *data = [NSData dataWithContentsOfFile:aFilePath];
        
        if (data != nil)
        {
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
            NSDictionary *dic = [unarchiver decodeObject];
            [unarchiver finishDecoding];
            
            return dic;
        }
        else
        {
            return nil;
        }
        
    }
    @catch (NSException *exception) {
        //DDLogError(@"%@",exception);
        NSAssert(0, @"从文件中加载错误");
    }
    @finally {
        
    }
}


- (BOOL)saveObject:(id)aObject atFilePath:(NSString *)aFilePath
{
    @try {
        
        NSData *data =  [NSKeyedArchiver archivedDataWithRootObject:aObject];;
        
        if (data != nil)
        {
            OTF_CreateFile(aFilePath, YES);
            
            BOOL isSuccess = [data writeToFile:aFilePath atomically:YES];
            return isSuccess;
        }
        else
        {
            return NO;
        }
    }
    @catch (NSException *exception) {
       // DDLogError(@"%@",exception);
        return NO;
    }
    @finally {
        
    }
}


- (id )loadObjectAtFilePath:(NSString *)aFilePath
{
    @try {
        
        NSData *data = [NSData dataWithContentsOfFile:aFilePath];
        
        if (data != nil)
        {
            return [NSKeyedUnarchiver unarchiveObjectWithData:data];;
        }
        else
        {
            return nil;
        }
        
    }
    @catch (NSException *exception) {
        //DDLogError(@"%@",exception);
    }
    @finally {
        
    }
}


- (id)objectFromObject:(id)aObject
{
    if ([aObject isKindOfClass:[NSString class]] || [aObject isKindOfClass:[NSNumber class]])
    {
        return aObject;
    }
    else if ([aObject isKindOfClass:[NSArray class]])
    {
        NSMutableArray *newArray = [NSMutableArray array];
        for (id arrayObj in aObject)
        {
            id object = [self objectFromObject:arrayObj];
            if (object != nil)
            {
                [newArray addObject:object];
            }
        }
        return newArray;
    }
    else if ([aObject isKindOfClass:[NSDictionary class]])
    {
        NSMutableDictionary *newDic = [NSMutableDictionary dictionary];
        for (NSString *key in [aObject allKeys])
        {
            id object = [self objectFromObject:[aObject objectForKey:key]];
            if (object != nil)
            {
                [newDic setObject:object forKey:key];
            }
        }
        return newDic;
    }
    
    return nil;
}

+ (float) fileSizeAtPath:(NSString*)aFilePath
{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:aFilePath]){
        
        return [[manager attributesOfItemAtPath:aFilePath error:nil] fileSize]/(1024.0*1024);
    }
    return 0;
}
- (void)createPath:(NSString *)path
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:path])
    {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
}
@end

