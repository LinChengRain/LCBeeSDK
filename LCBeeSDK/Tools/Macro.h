//
//  MicroDefine.h
//  PersonalPower
//
//  Created by Changlin Yu on 2017/3/20.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#ifndef MicroDefine_h
#define MicroDefine_h

/*****************服务连接*****************/


/*****************Block****************/
#define LCWeakSelf(type)  __weak typeof(type) weak##type = type
#define LCStrongSelf(type)  __strong typeof(type) type = weak##type

/*****************常用常量****************/
#define USERDEFAULTS [NSUserDefaults standardUserDefaults]

#define SYSTEM_VERSION  [[[UIDevice currentDevice] systemVersion] floatValue]


#define MAIN_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define MAIN_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/******iPhone X适配******/
#define IS_IPHONEX (MAIN_SCREEN_HEIGHT == 812.f)
#define NavigationBarHeight (IS_IPHONEX ? 88 : 64)
#define TabBarHeight (IS_IPHONEX ? 83 : 49)
#define StatusBarHeight (IS_IPHONEX ? 44 : 20)


#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS


/******************DEBUG log日志******************/
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif


//颜色值
#define UIColorFromRGB(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define RGB_COLOR(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]

#define BASIC_BG_COLOR [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0]

#endif /* MicroDefine_h */
