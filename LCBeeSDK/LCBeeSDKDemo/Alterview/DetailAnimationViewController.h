//
//  DetailAnimationViewController.h
//  ServiceCustomTools
//
//  Created by gz on 2018/6/8.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YUReplicatorAnimation.h"

// layer类型
typedef NS_ENUM(NSUInteger, YULayerType){
    YUCAReplicatorLayer,  // 复制动画
    YUCAEmitterLayer,     // 粒子动画
    YUCAGradientLayer,    // 渐变动画
};

@interface DetailAnimationViewController : UITableViewController
@property (nonatomic, assign) YULayerType layerType;

@property (nonatomic, assign) YUReplicatorLayerType replicatorLayerType;

@end
