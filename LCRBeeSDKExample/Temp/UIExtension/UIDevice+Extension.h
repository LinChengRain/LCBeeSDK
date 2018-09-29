//
//  UIDevice+Extension.h
//  LCRBeeSDK
//
//  Created by yuchanglin on 2017/12/27.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Extension)
/**
*  获取iOS版本
*/
#define IOS_VERSION [UIDevice currentDevice].systemVersion


/**
 *  返回平台设备
 */
+ (NSString *)devicePlatform;

/**
 *  返回平台设备字符串
 */
+ (NSString *)devicePlatformString;

/**
 *  检查是否是IPAD
 */
+ (BOOL)isiPad;

/**
 *  检查是否是iPhone
 */
+ (BOOL)isiPhone;

/**
 *  检查是否是iPod
 */
+ (BOOL)isiPod;

/**
 *  检查是否是simulator
 */
+ (BOOL)isSimulator;

/**
 *  检查是否是a Retina display
 */
+ (BOOL)isRetina;

/**
 *  检查是否是a Retina HD display
 */
+ (BOOL)isRetinaHD;

/**
 *  返回IOS版本号
 */
+ (NSInteger)iOSVersion;

/**
 *  返回CPU频率
 */
+ (NSUInteger)cpuFrequency;

/**
 *  返回总线频率
 */
+ (NSUInteger)busFrequency;

/**
 *  返回物理内存大小
 */
+ (NSUInteger)ramSize;

/**
 *  返回CPU数
 */
+ (NSUInteger)cpuNumber;

/**
 *  返回总内存
 */
+ (NSUInteger)totalMemory;

/**
 *  返回非内核内存
 */
+ (NSUInteger)userMemory;

/**
 *  返回文件系统空间
 */
+ (NSNumber *)totalDiskSpace;

/**
 *  返回文件系统剩余空间
 */
+ (NSNumber *)freeDiskSpace;

/**
 *  返回当前设备的mac地址
 */
+ (NSString *)macAddress;

/**
 *  返回唯一标识符
 */
+ (NSString *)uniqueIdentifier;


@end
