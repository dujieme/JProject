//
//  AppUser.m
//  ICode7Phone
//
//  Created by Jay on 2018/3/26.
//  Copyright © 2018年 MB. All rights reserved.
//

#import "AppUser.h"

#define CSTR_KEY(X)     (long)X==NSIntegerMax?(char*)NSIntegerMax:#X
#define OSTR_KEY(X)     [[NSString stringWithFormat:@"%s",CSTR_KEY(X)] hasPrefix:@"self."] ? \
                        [[NSString stringWithFormat:@"%s",CSTR_KEY(X)] substringFromIndex:[@"self." length]] : \
                        [NSString stringWithFormat:@"%s",CSTR_KEY(X)]

#define UserKey(X)      [NSString stringWithFormat:@"__AppUser_%@",OSTR_KEY(X)]
#define UserValueKey(X) [NSString stringWithFormat:@"__AppUser_%@",X]

@interface AppUser ()
{
    BOOL                  isDirty;
    NSUserDefaults      * userDefaults;
    NSMutableDictionary * mDic;
    NSString            * key;
}
@end

@implementation AppUser

- (instancetype)init
{
    self = [super init];
    if (self) {
        userDefaults   = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (void)loadUserWithIdentifer:(NSString *)identifier
{
    if ([self.userid isEqualToString:identifier]) {  /// 当前是同一个用户
        return;
    }
    [self  save];
    key     = identifier;
    mDic    = [NSMutableDictionary new];
    NSDictionary *dic = [userDefaults dictionaryForKey:UserValueKey(key)];
    if (dic.count > 0) {
        [mDic addEntriesFromDictionary:dic];
        if (mDic[UserKey(self.userid)]) {
            self.userid = mDic[UserKey(self.userid)];
        }
        if (mDic[UserKey(self.cellphone)]) {
            self.cellphone = mDic[UserKey(self.cellphone)];
        }
        if (mDic[UserKey(self.nickname)]) {
            self.nickname = mDic[UserKey(self.nickname)];
        }
        if (mDic[UserKey(self.avatar)]) {
            self.avatar = mDic[UserKey(self.avatar)];
        }
        self.hasLogined  = [mDic[UserKey(self.hasLogined)] boolValue];
        self.subscribe = [mDic[UserKey(self.subscribe)] boolValue];
        if (mDic[UserKey(self.accessToken)]) {
            self.accessToken = mDic[UserKey(self.accessToken)];
        }
        if (mDic[UserKey(self.refreshToken)]) {
            self.refreshToken = mDic[UserKey(self.refreshToken)];
        }
        if (mDic[UserKey(self.accessTokenExpire)]) {
            self.accessTokenExpire = mDic[UserKey(self.accessTokenExpire)];
        }
        if (mDic[UserKey(self.refreshTokenExpire)]) {
            self.refreshTokenExpire     = mDic[UserKey(self.refreshTokenExpire)];
        }
        if (mDic[UserKey(self.accessTokenSaveTime)]) {
            self.accessTokenSaveTime    = mDic[UserKey(self.accessTokenSaveTime)];
        }
        if (mDic[UserKey(self.refreshTokenExpire)]) {
            self.refreshTokenExpire     = mDic[UserKey(self.refreshTokenExpire)];
        }
    }else{
        self.userid = identifier;
    }
}

- (void)setUserid:(NSString *)userid
{
    if (![_userid isEqualToString:userid]) {
        _userid = userid;
        [mDic setObject:userid forKey:UserKey(self.userid)];
        isDirty    = YES;
    }
}

- (void)setCellphone:(NSString *)cellphone
{
    if (![_cellphone isEqualToString:cellphone]) {
        _cellphone = cellphone;
        [mDic setObject:cellphone forKey:UserKey(self.cellphone)];
        isDirty    = YES;
    }
}
    
- (void)setNickname:(NSString *)nickname
{
    if (![_nickname isEqualToString:nickname]) {
        _nickname = nickname;
        [mDic setObject:nickname forKey:UserKey(self.nickname)];
        isDirty    = YES;
    }
}

- (void)setAvatar:(NSString *)avatar{
    if (![_avatar isEqualToString:avatar]) {
        _avatar = avatar;
        [mDic setObject:avatar forKey:UserKey(self.avatar)];
        isDirty    = YES;
    }
}
    
- (void)setHasLogined:(BOOL)hasLogined
{
    if (_hasLogined != hasLogined) {
        _hasLogined = hasLogined;
        [mDic setObject:[NSNumber numberWithBool:_hasLogined] forKey:UserKey(self.hasLogined)];
        isDirty    = YES;
    }
}
    
- (void)setSubscribe:(BOOL)subscribe
    {
        if (_subscribe != subscribe) {
            _subscribe = subscribe;
            [mDic setObject:[NSNumber numberWithBool:_subscribe] forKey:UserKey(self.subscribe)];
            isDirty    = YES;
        }
}

- (void)setAccessToken:(NSString *)accessToken
{
    if (![_accessToken isEqualToString:accessToken]) {
        _accessToken = accessToken;
        [mDic setObject:accessToken forKey:UserKey(self.accessToken)];
        isDirty = YES;
    }
}

- (void)setRefreshToken:(NSString *)refreshToken
{
    if (![_refreshToken isEqualToString:refreshToken]) {
        _refreshToken = refreshToken;
        [mDic setObject:refreshToken forKey:UserKey(self.refreshToken)];
        isDirty = YES;
    }
}

- (void)setAccessTokenExpire:(NSString *)accessTokenExpire
{
    if (![_accessTokenExpire isEqualToString:accessTokenExpire]) {
        _accessTokenExpire = accessTokenExpire;
        [mDic setObject:accessTokenExpire forKey:UserKey(self.accessTokenExpire)];
        isDirty = YES;
    }
}

- (void)setRefreshTokenExpire:(NSString *)refreshTokenExpire
{
    if (![_refreshTokenExpire isEqualToString:refreshTokenExpire]) {
        _refreshTokenExpire = refreshTokenExpire;
        [mDic setObject:refreshTokenExpire forKey:UserKey(self.refreshTokenExpire)];
        isDirty = YES;
    }
}

- (void)setAccessTokenSaveTime:(NSString *)accessTokenSaveTime
{
    if (![_accessTokenSaveTime isEqualToString:accessTokenSaveTime]) {
        _accessTokenSaveTime = accessTokenSaveTime;
        [mDic setObject:accessTokenSaveTime forKey:UserKey(self.accessTokenSaveTime)];
        isDirty = YES;
    }
}

- (void)setRefreshTokenSaveTime:(NSString *)refreshTokenSaveTime
{
    if (![_refreshTokenSaveTime isEqualToString:refreshTokenSaveTime]) {
        _refreshTokenSaveTime = refreshTokenSaveTime;
        [mDic setObject:refreshTokenSaveTime forKey:UserKey(self.refreshTokenSaveTime)];
        isDirty = YES;
    }
}

- (void)save
{
    if (isDirty) {
        [userDefaults setObject:mDic forKey:UserValueKey(key)];
        [userDefaults synchronize];
    }
}

@end

//@interface UserInfo : NSObject
//@property (nonatomic,   copy)NSString * userid;
//@property (nonatomic,   copy)NSString * cellphone;
//@property (nonatomic,   assign)BOOL subscribe;
//@property (nonatomic,  copy)NSString * nickname;
//@property (nonatomic,  copy)NSString * avatar;
//@end

