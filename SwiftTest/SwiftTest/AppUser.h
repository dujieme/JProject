//
//  AppUser.h
//  ICode7Phone
//
//  Created by Jay on 2018/3/26.
//  Copyright © 2018年 MB. All rights reserved.
//

#import <Foundation/Foundation.h>
//@interface UserInfo : NSObject
//@property (nonatomic,   copy)NSString * userid;
//@property (nonatomic,   copy)NSString * cellphone;
//@property (nonatomic,   assign)BOOL subscribe;
//@property (nonatomic,  copy)NSString * nickname;
//@property (nonatomic,  copy)NSString * avatar;
//@end

@interface AppUser : NSObject
@property (nonatomic, strong)InfoModel *userInfo;
@property (nonatomic, assign)BOOL       hasLogined;
@property (nonatomic,   copy)NSString * accessToken;
@property (nonatomic,   copy)NSString * refreshToken;
@property (nonatomic,   copy)NSString * accessTokenExpire;
@property (nonatomic,   copy)NSString * refreshTokenExpire;
@property (nonatomic,   copy)NSString * accessTokenSaveTime;
@property (nonatomic,   copy)NSString * refreshTokenSaveTime;

- (void)loadUserWithIdentifer:(NSString *)identifier;
- (void)save;
@end
