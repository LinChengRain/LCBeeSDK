//
//  UIColor+Extension.h
//  LCRBeeSDK
//
//  Created by yuchanglin on 2017/12/26.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
 *  从HEX字符串得到一个UIColor对象
 */
+ (UIColor *)colorWithHexString: (NSString *) hexString;
+ (UIColor *)colorWithHex:(u_int32_t)hex;
/**
 *  创建一个随机UIColor对象
 */
+ (UIColor *)randomColor;

/**
 *  从已知UIColor对象和Alpha对象得到一个UIColor对象
 */
+ (UIColor *)colorWithColor:(UIColor *)color
                      alpha:(float)alpha;

//UIColor 转UIImage
+ (UIImage*) imageWithColor: (UIColor*) color;
@end
