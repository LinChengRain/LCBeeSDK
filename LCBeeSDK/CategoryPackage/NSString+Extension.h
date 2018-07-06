//
//  NSString+Extension.h
//  LCBeeSDK
//
//  Created by yuchanglin on 2017/12/26.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

+ (NSString *)lc_stringDate;

+ (NSString *)clearAllSpaceString:(NSString *)string;
+ (NSString *)clearSpaceString:(NSString *)string;
//进制转换
+ (NSString *)toBinarySystemWithDecimalSystem:(NSInteger)decimal;
+ (NSInteger)getDecimalByBinary:(NSString *)binary;

+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
@end
