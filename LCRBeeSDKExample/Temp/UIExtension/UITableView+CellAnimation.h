//
//  UITableView+CellAnimation.h
//  LCRBeeSDK
//
//  Created by yuchanglin on 2017/12/27.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CellAnimation)
- (void)moveAnimation;       //左侧飞入
- (void)alphaAnimation;      //透明
- (void)fallAnimation;       //上面掉落
- (void)shakeAnimation;      //抖动动画
- (void)overTurnAnimation;   //翻转动画
- (void)toTopAnimation;      //从下往上
- (void)springListAnimation; //从上往下弹动动画
- (void)shrinkToTopAnimation;//从下往上挤向顶部
- (void)layDownAnimation;    //从上往下展开
- (void)roteAnimation;       //翻转动画
@end
