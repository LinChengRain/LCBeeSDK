//
//  NSDictionary+Extension.h
//  LCRBeeSDK
//
//  Created by yuchanglin on 2017/12/27.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)
/**
 *  字段转成json的字符串
 *
 *  @return json 字符串
 */
- (NSString *)toJSONStringForDictionary;
@end
