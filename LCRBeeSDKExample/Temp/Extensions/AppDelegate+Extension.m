//
//  AppDelegate+Extension.m
//  ServiceCustomTools
//
//  Created by gz on 2018/6/14.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

#import "AppDelegate+Extension.h"
#import "EmailServiceTool.h"
@implementation AppDelegate (Extension)

- (void)dealExceptionToSend{
    
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
}

void UncaughtExceptionHandler(NSException *exception) {
    NSArray *arr = [exception callStackSymbols];//得到当前调用栈信息
    NSString *reason = [exception reason];//非常重要，就是崩溃的原因
    NSString *name = [exception name];//异常类型
    //设备版本
    NSString * version=[[UIDevice currentDevice]systemVersion];
    // 手机名称
    NSString * model=[[UIDevice currentDevice]model];
    // 崩溃时间
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * dateTime = [formatter stringFromDate:[NSDate date]];
    // app版本
    
    NSString *app_Version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    
    NSString *app_build = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    
    NSString *crashLogInfo = [NSString stringWithFormat:@"device name: %@ \n device version : %@ \n app version : %@ \n app build : %@ \n create time : %@ \n exception type : %@ \n crash reason : %@ \n call stack info : %@", model,version,app_Version,app_build,dateTime,name, reason, arr];
    
//    NSLog(@"********** start record crash log **********");
//    NSLog(@"device name: %@ \n device version : %@ \n app version : %@ \n app build : %@ \n create time : %@ \n exception type : %@ \n crash reason : %@ \n call stack info : %@", model,version,app_Version,app_build,dateTime,name, reason, arr);
//    NSLog(@"********** end record crash log **********");
  
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *createPath = [documentsPath stringByAppendingPathComponent:@"AppLog"];
    BOOL isSuccess = YES;
    if (![fileManager fileExistsAtPath:createPath]) {
        //创建文件夹
        isSuccess = [[NSFileManager defaultManager] createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
        
    if (isSuccess) {
        NSString *iOSPath = [createPath stringByAppendingPathComponent:@"log.txt"];

        if (![fileManager fileExistsAtPath:iOSPath]) {
            [fileManager createFileAtPath:iOSPath contents:nil attributes:nil];
            BOOL isSuccess = [crashLogInfo writeToFile:iOSPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
            if (isSuccess) {
                NSLog(@"崩溃日志缓存成功");
            }else{
                NSLog(@"崩溃日志缓存失败");
            }
            return;
        }else{
            [crashLogInfo writeToFile:iOSPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        }
    } else {
        NSLog(@"AppLog create fail");
    }
}
#pragma mark ========== 3D touch ==========
- (BOOL)deal3DTouchWithOptions:(NSDictionary *)launchOptions {
    if ([launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey]) {
        UIApplicationShortcutItem*shortcutItem = [launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey];
        //判断设置的快捷选项标签唯一标识，根据不同标识执行不同操作
        if([shortcutItem.type isEqualToString:@"com.lin.action"]){
            NSLog(@"APP没被杀死-- 动画");
        } else if ([shortcutItem.type isEqualToString:@"com.lin.email"]) {
            //进入搜索界面
            NSLog(@"APP没被杀死-- 邮件");
            
        }
        //return NO的话开启不再执行响应快捷按钮的函数
        //return YES的话执行响应快捷按钮的函数
        return NO;
    }
    return YES;
}
//如果APP没被杀死，还存在后台，点开Touch会调用该代理方法
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    if (shortcutItem) {
        //判断设置的快捷选项标签唯一标识，根据不同标识执行不同操作
        if([shortcutItem.type isEqualToString:@"com.lin.action"]){
            NSLog(@"APP没被杀死-- 动画");
        } else if ([shortcutItem.type isEqualToString:@"com.lin.email"]) {
            //进入搜索界面
            NSLog(@"APP没被杀死-- 邮件");
            
        }
    }
    
    if (completionHandler) {
        completionHandler(YES);
    }
}


@end
