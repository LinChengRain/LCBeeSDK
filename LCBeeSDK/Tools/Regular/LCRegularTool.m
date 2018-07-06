//
//  LCRegularTool.m
//  MamiHomeApp
//
//  Created by Changlin Yu on 2017/6/3.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "LCRegularTool.h"

@implementation LCRegularTool

+(BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]{2,3}";
   
    NSPredicate *predicat = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [predicat evaluateWithObject:email];
}

+(BOOL)validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[a-zA-Z]\\w{4,19}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [predicate evaluateWithObject:name];
}
+(BOOL)valiDatePhoneNumber:(NSString *)phoneNumber
{
    //@"^\\d{7,15}$"   7-15纯数字
    NSString *userNameRegex = @"^(\\+)?\\d{7,15}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [predicate evaluateWithObject:phoneNumber];
}
+ (BOOL)validateNumber:(NSString *)textString
{
    NSString* number=@"^[0-9]*$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:textString];
}

+ (BOOL)validateFloat:(NSString *)floatStr
{
    
    NSString* number=@"^([1-9][0-9]*)+(.[0-9]{1,2})?$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:floatStr];
}
+ (BOOL)validateNumberOrFloat:(NSString *)str
{
    NSString* number=@"^[+]?\\d*\\.?\\d*$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:str];
}
+ (BOOL)validateChinese:(NSString *)string
{
    NSString* chineseStr = @"[\\u4E00-\\u9FA5]+$";
    NSPredicate *chinesePre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",chineseStr];
    
    NSLog(@"%d", [chinesePre evaluateWithObject:string]);
    return [chinesePre evaluateWithObject:string];
}
@end
