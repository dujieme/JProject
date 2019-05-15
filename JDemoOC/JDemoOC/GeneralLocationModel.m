//
//  GeneralLocationModel.m
//  SansiSecurityLamp
//
//  Created by don on 2019/5/15.
//  Copyright © 2019 zhouqitian. All rights reserved.
//

#import "GeneralLocationModel.h"

@implementation DSTGeneralLocationModel

@end

@implementation DSTEndDSTGeneralLocationModel

@end
@implementation GeneralLocationModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"eeet":@"Ret",
             @"dSTGeneralLocationModel" : @"General.Location"
             };
}

-(id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"key==%@",key);
    return [super valueForUndefinedKey:key];
}
@end

