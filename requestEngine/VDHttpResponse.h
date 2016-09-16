//
//  VDHttpResponse.h
//  chatDemo
//
//  Created by Donald on 16/9/10.
//  Copyright © 2016年 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VDImUser;
@class VDAddress;
@class VDInterestListModel;
@class VDJobListModel;
@class VDAlbum;
@interface VDAuthorization : JSONModel
@property (nonatomic,strong) NSString * account;
@property (nonatomic,strong) NSString * token;
@end
@interface VDUserInfo : JSONModel
@property (nonatomic,strong) NSString * userId;
@property (nonatomic,strong) NSString * avatarId;
@property (nonatomic,strong) NSString * identify;
@property (nonatomic,strong) NSString * avatarUrl;
@property (nonatomic,strong) NSString * nickName;
@property (nonatomic,strong) NSString * nickNameChar;
@property (nonatomic,strong) NSString * sex;
@property (nonatomic,strong) VDImUser * imUser;
@property (nonatomic,strong) NSString * sign;
@property (nonatomic,strong) NSString * birthday;
@property (nonatomic,strong) NSString * constellation;//星座
@property (nonatomic,strong) VDAddress *comeFrom;
@property (nonatomic,strong) VDInterestListModel * interestList;
@property (nonatomic,strong) VDJobListModel * jobList;
@property (nonatomic,strong) NSArray<VDAlbum *> * album;
@property (nonatomic,strong) NSString * friendUpdateTime;
@end

@interface VDAddress : JSONModel
@property (nonatomic,strong) NSString * province;
@property (nonatomic,strong) NSString * provinceid;
@property (nonatomic,strong) NSString * city;
@property (nonatomic,strong) NSString * cityid;
@property (nonatomic,strong) NSString * area;
@property (nonatomic,strong) NSString * areaid;
@end

@interface VDImUser : JSONModel

@property (nonatomic,strong) NSString * password;
@property (nonatomic,strong) NSString * userName;
@end

@interface VDInterestListModel : JSONModel
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSString * ID;
@property (nonatomic,assign) BOOL isSelected;
@end


@interface VDAlbum : JSONModel

@property (nonatomic,strong) NSString * albumPhotoId;
@property (nonatomic,assign) NSInteger * imageId;
@property (nonatomic,strong) NSString * imageUrl;
@property (nonatomic,assign) BOOL isAvartar;

@end

@interface VDJobListModel : VDInterestListModel
@end

@interface VDHttpResponse : JSONModel
@property (nonatomic,copy) NSString * code;
@property (nonatomic,copy) NSString * message;
+ (id)responseWithError:(NSError *)aError;
@end

@interface VDAuthorizationResponse : VDHttpResponse
@property (nonatomic,strong) VDAuthorization *  authorization;
@end

@interface VDLoginResponse : VDHttpResponse
@property (nonatomic,strong) VDAuthorization *authorization;
@property (nonatomic,strong) VDUserInfo * object;

@end

@interface  VDSearchResponse:VDHttpResponse
@property (nonatomic,assign) BOOL isFriend;
@property (nonatomic,strong) VDUserInfo * object;

@end

