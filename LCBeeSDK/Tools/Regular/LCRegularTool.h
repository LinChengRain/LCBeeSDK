//
//  LCRegularTool.h
//  MamiHomeApp
//
//  Created by Changlin Yu on 2017/6/3.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCRegularTool : NSObject
//手机号码验证
+(BOOL)valiDatePhoneNumber:(NSString*)phoneNumber;
//用户名验证
+ (BOOL)validateUserName:(NSString*)name;
//邮箱验证
+ (BOOL)validateEmail:(NSString*)email;
//纯数字
+ (BOOL)validateNumber:(NSString *)textString;
//浮点型:2位小数
+ (BOOL)validateFloat:(NSString *)floatStr;
//正浮点或整数
+ (BOOL)validateNumberOrFloat:(NSString *)str;
//字符串中是否包含汉字
+ (BOOL)validateChinese:(NSString *)string;
@end
