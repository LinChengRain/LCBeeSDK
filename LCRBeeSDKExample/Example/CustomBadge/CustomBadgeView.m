//
//  CustomBadgeView.m
//  LCRBeeSDK
//
//  Created by yuchanglin on 2017/12/26.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import "CustomBadgeView.h"
#import "UIView+Extension.h"

@implementation CustomBadgeView

- (instancetype) initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        [self initSubviews];
    }
    return self;
}
- (void )initSubviews
{
    //左侧
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, self.width - 100, 50)];
    [self setView:view1 type:UIBorderSideTypeLeft color: [UIColor redColor]];
    //右侧
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(50, 120, self.width - 100, 50)];
    [self setView:view2 type:UIBorderSideTypeRight color: [UIColor redColor]];
    //上侧
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(50, 190, self.width - 100, 50)];
    [self setView:view3 type:UIBorderSideTypeTop color: [UIColor redColor]];
    
    //下侧
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(50, 260, self.width - 100, 50)];
    [self setView:view4 type:UIBorderSideTypeBottom color: [UIColor redColor]];
    
    //四边
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(50, 330, self.width - 100, 50)];
    [self setView:view5 type:UIBorderSideTypeAll color: [UIColor redColor]];
}
- (void)setView:(UIView*)view type:(UIBorderSideType)type color:(UIColor *)color{
    
    [view borderForColor:color borderWidth:3 borderType:type];
    view.backgroundColor = [UIColor greenColor];
    [self addSubview:view];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
