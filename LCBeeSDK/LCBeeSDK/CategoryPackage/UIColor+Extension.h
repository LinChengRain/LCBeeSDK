//
//  UIColor+Extension.h
//  LCBeeSDK
//
//  Created by yuchanglin on 2017/12/26.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
+ (UIColor *) colorWithHexString: (NSString *) hexString;
+ (UIColor *)colorWithHex:(u_int32_t)hex;
@end
