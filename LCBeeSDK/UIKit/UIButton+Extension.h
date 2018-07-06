//
//  UIButton+Extension.h
//  LCBeeSDK
//
//  Created by yuchanglin on 2017/12/26.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)
@end

typedef NS_ENUM(NSUInteger, MYButtonEdgeInsetsStyle) {
    
    MYButtonEdgeInsetsStyleTop,      // image在上，label在下
    MYButtonEdgeInsetsStyleLeft,     // image在左，label在右
    MYButtonEdgeInsetsStyleBottom,   // image在下，label在上
    MYButtonEdgeInsetsStyleRight     // image在右，label在左
};

@interface UIButton (ImageTitleLayout)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */

- (void)layoutButtonWithEdgeInsetsStyle:(MYButtonEdgeInsetsStyle)style
                imageTitleLayoutSpacing:(CGFloat)space;

- (void)layoutButtonWithEdgeInsetsImageTitleLayoutSpacing:(CGFloat)space;

- (void)customNumberOfLines:(NSInteger)number;
@end

#define defaultInterval 1 //默认时间间隔
@interface UIButton (Tounch)

@property (nonatomic, assign) NSTimeInterval timeInterval;
@end

@interface UIButton (EnlargeTouchArea)

/**
 *  扩大 UIButton 的點擊範圍
 *  控制上下左右的延長範圍
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end

