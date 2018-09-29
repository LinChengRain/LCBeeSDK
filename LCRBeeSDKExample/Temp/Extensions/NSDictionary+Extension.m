//
//  NSDictionary+Extension.m
//  LCRBeeSDK
//
//  Created by yuchanglin on 2017/12/27.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

- (NSString *)toJSONStringForDictionary
{
    NSData *paramsJSONData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:paramsJSONData encoding:NSUTF8StringEncoding];
}

@end
