//
//  GeneralLocationModel.h
//  SansiSecurityLamp
//
//  Created by don on 2019/5/15.
//  Copyright © 2019 zhouqitian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>

@interface DSTEndDSTGeneralLocationModel : NSObject
@property (nonatomic, assign) NSInteger *Day;
@property (nonatomic, assign) NSInteger *Hour;
@property (nonatomic, assign) NSInteger *Minute;
@property (nonatomic, assign) NSInteger *Month;
@property (nonatomic, assign) NSInteger *Week;
@property (nonatomic, assign) NSInteger *Year;
@end

@interface DSTGeneralLocationModel : NSObject
@property (nonatomic, copy) DSTEndDSTGeneralLocationModel *DSTEnd;
@property (nonatomic, copy) NSString *DSTRule;
@property (nonatomic, copy) DSTEndDSTGeneralLocationModel *DSTStart;
@property (nonatomic, copy) NSString *DateFormat;
@property (nonatomic, copy) NSString *DateSeparator;
@property (nonatomic, assign) NSInteger *IranCalendar;
@property (nonatomic, copy) NSString *Language;
@property (nonatomic, copy) NSString *TimeFormat;
@property (nonatomic, copy) NSString *VideoFormat;
@property (nonatomic, assign) NSInteger *WorkDay;

@end

@interface GeneralLocationModel : NSObject
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *eeet;
@property (nonatomic, copy) NSString *SessionID;
@property (nonatomic, copy) DSTGeneralLocationModel *dSTGeneralLocationModel;
@end

