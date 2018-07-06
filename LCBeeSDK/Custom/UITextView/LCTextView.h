//
//  LCTextView.h
//  MamiHomeApp
//
//  Created by Changlin Yu on 2017/5/12.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,ShowLocationType) {
    ShowLocationTypeDefault,
    ShowLocationTypeLeft ,
    ShowLocationTypeRight
};
@interface LCTextView : UITextView

/** 占位文字 */
@property (nonatomic,copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic,strong) UIColor *placeholderColor;
/** 起始位置 */
@property(nonatomic,assign) CGPoint placeholderLocation;
/** 是否显示字数 */
@property(nonatomic,assign) BOOL showWordNumber;
/** 显示字数位置 */
@property(nonatomic,assign) ShowLocationType locationType;
/** 最大字数*/
@property(nonatomic,assign) NSUInteger maxNumber;
@end
