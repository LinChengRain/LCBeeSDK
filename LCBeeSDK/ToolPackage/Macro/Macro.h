//
//  Macro.h
//  Macro
//
//  Created by yuchanglin on 2017/11/16.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

/******iOS 11适配******/
#define IS_IPHONEX SCREEN_HEIGHT == 812
#define NavigationBarHeight (SCREEN_HEIGHT == 812? 88 :64)
#define TabBarHeight (SCREEN_HEIGHT == 812? 83 :49)


/// 第一个参数是当下的控制器适配iOS11 一下的，第二个参数表示scrollview或子类
/**
 取消自动适配 ScrollView 的 Insets 行为
 @param scrollView 滑动视图
 @param vc 所在控制器
 */
#define AdjustsScrollViewInsetNever(scrollView, vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
if (@available(iOS 11.0,*))  {\
scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop")\
} while (0);
/*************/


#define IOS_VERSION [[UIDevice currentDevice] systemVersion] floatValue]

/*****************Block****************/
#define LCWeakSelf(type)  __weak typeof(type) weak##type = type
#define LCStrongSelf(type)  __strong typeof(type) type = weak##type

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB_COLOR(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
#endif /* Macro_h */
