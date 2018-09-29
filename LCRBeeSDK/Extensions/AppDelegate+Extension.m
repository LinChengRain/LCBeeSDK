//
//  AppDelegate+Extension.m
//  ServiceCustomTools
//
//  Created by yu changlin on 2018/6/14.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

#import "AppDelegate+Extension.h"

@implementation AppDelegate (Extension)

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
