//
//  MBProgressHUD+Extension.m
//  ServiceProject
//
//  Created by yuchanglin on 2018/6/6.
//  Copyright © 2018年 yuchanglin. All rights reserved.
//

#import "MBProgressHUD+Extension.h"

@implementation MBProgressHUD (Extension)

NS_INLINE MBProgressHUD *createNew(UIView *view) {
    if (view == nil) view = (UIView*)[[UIApplication sharedApplication].windows lastObject];
    return [MBProgressHUD showHUDAddedTo:view animated:YES];
}

NS_INLINE MBProgressHUD *setHUD(UIView *view, NSString *title, BOOL autoHidden,NSTimeInterval afterDelay) {
    
    MBProgressHUD *hud = createNew(view);
    //文字
    if (title) {
        hud.label.text = title;
    }
    //支持多行
//    hud.label.numberOfLines = 0;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //设置默认风格
    if (LCHudDefaultStyle == 1) {
        hud.hudContentStyle(LCHUDContentStyleBlack);
        
    } else if (LCHudDefaultStyle == 2) {
        hud.hudContentStyle(LCHUDContentStyleCustom);
    }
    
    if (autoHidden) {
        // x秒之后消失
        [hud hideAnimated:YES afterDelay:(afterDelay > 0 ? afterDelay : delayTime)];
    }

    return hud;
}

#pragma mark 显示一些信息
/**
 只显示文字
 */
+ (void)showText:(NSString *)text view:(nullable UIView *)view
{
    [self showPlainText:text hideAfterDelay:delayTime view:view];
}

+ (void)showPlainText:(NSString *)text view:(nullable UIView *)view{
    [self showPlainText:text hideAfterDelay:delayTime view:view];
}

+ (void)showPlainText:(NSString *)text hideAfterDelay:(NSTimeInterval)time view:(nullable UIView *)view {
    // 快速显示一个提示信息
    MBProgressHUD *hud = setHUD(view, text, YES, time);
    hud.mode = MBProgressHUDModeText;
}

#pragma mark - 显示成功失败信息（打勾打叉动画）
/**
 显示信息
 
 @param message 信息内容
 @param icon 图标
 @param time 延迟时间
 @param view 显示的视图
 */
+ (void)show:(nullable NSString *)message icon:(NSString *)icon hideAfterDelay:(NSTimeInterval)time toView:(nullable UIView *)view {
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = setHUD(view, message, YES, time);
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"images.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
}
/**
 显示失败信息，同时有打叉的动画
 
 @param error 错误信息
 @param time HUD展示时长
 @param view 展示的view
 */
+ (void)showError:(nullable NSString *)error  hideAfterDelay:(NSTimeInterval)time toView:(nullable UIView *)view {
 
    [self show:error icon:@"fail"  hideAfterDelay:time toView:view];
}
/**
 *  显示错误信息
 *
 *  @param error 错误信息内容
 *  @param view  需要显示信息的视图
 */
+ (void)showError:(nullable NSString *)error toView:(nullable UIView *)view {
    
     [self showError:error hideAfterDelay:delayTime toView:view];
}
/**
 *  显示错误信息
 *
 *  @param error 错误信息内容
 */
+ (void)showError:(nullable NSString *)error
{
    [self showError:error toView:nil];
}
/**
 *  显示错误信息
 *
 */
+ (void)showError{
    [self showError:nil];
}

/**
 显示成功信息
 
 @param success 信息内容
 @param time 延迟时间
 @param view 显示的视图
 */
+ (void)showSuccess:(nullable NSString *)success  hideAfterDelay:(NSTimeInterval)time toView:(nullable UIView *)view {
    [self show:success icon:@"success" hideAfterDelay:time toView:view];
}

/**
 显示成功信息

 @param success 信息内容
 @param view 显示信息的视图
 */
+ (void)showSuccess:(nullable NSString *)success toView:(nullable UIView *)view
{
    [self showSuccess:success hideAfterDelay:delayTime toView:view];
}
/**
 显示成功信息
 
 @param success 信息内容
*/
+ (void)showSuccess:(nullable NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showSuccess
{
    [self showSuccess:nil];
}

#pragma mark 显示带有自定义icon图片的消息

+ (void)showIcon:(UIImage *)icon message:(NSString *)message hideAfterDelay:(NSTimeInterval)time view:(nullable UIView *)view{
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = setHUD(view, message, YES, time);
    // 默认
    //    hud.mode = MBProgressHUDModeIndeterminate;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:icon];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
}

/**
 显示带有自定义icon图标消息HUD
 
 @param icon 图标
 @param message 消息正文
 @param view 展示的view
 */
+ (void)showIcon:(UIImage *)icon message:(NSString *)message view:(nullable UIView *)view{
    [self showIcon:icon message:message hideAfterDelay:delayTime view:view];
    
}

+ (void)showIcon:(UIImage *)icon message:(NSString *)message{
    [self showIcon:icon message:message view:nil];
}

#pragma mark - 加载菊花的HUD

/**
 显示菊花加载状态
 
 @param message 消息正文
 @param view 展示的view
 */
+ (instancetype)showActivityLoading:(nullable NSString *)message toView:(nullable UIView *)view
{
    // 快速显示一个提示信息
    MBProgressHUD *hud = setHUD(view, message, NO, delayTime);
    // 默认
    hud.mode = MBProgressHUDModeIndeterminate;
    
    return hud;
}

+ (instancetype)showActivityLoadingToView:(nullable UIView *)view{
    return [self showActivityLoading:nil toView:view];
}

+ (instancetype)showActivityLoading{
    return [self showActivityLoadingToView:nil];
}

#pragma mark - 加载loading的HUD

/**
 显示loading加载状态
 
 @param message 消息正文
 @param view 展示的view
 */
+ (instancetype)showLoading:(nullable NSString *)message toView:(nullable UIView *)view
{
    // 快速显示一个提示信息
    MBProgressHUD *hud = setHUD(view, message, NO, 0);
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"images.bundle/%@", @"loading"]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 设置动画效果
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima.toValue = @(M_PI*2);
    anima.duration = 1.0f;
    anima.repeatCount = 100;
    
    [hud.customView.layer addAnimation:anima forKey:@"rotationAnimation"];
    
    return hud;
}

+ (instancetype)showLoadingToView:(nullable UIView *)view{
    return [self showLoading:nil toView:view];
}

+ (instancetype)showLoading{
    return [self showLoadingToView:nil];
}

#pragma mark - 有加载进度的HUD

/**
 显示环形加载状态指示器
 
 @param message 消息正文，传nil不显示
 @param view 展示的View
 @param progress 进度回调
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showAnnularLoading:(nullable NSString *)message toView:(nullable UIView *)view progress:(LCCurrentHud)progress{
    
    return [self showLoadingStyle:LCLoadingProgressStyleAnnularDeterminate message:message toView:view progress:progress];
}
/**
 只显示环形加载状态指示器，不显示文本消
 
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showAnnularLoading {
    return [self showAnnularLoading:nil toView:nil progress:nil];
}


/**
 扇形饼状加载进度
 
 @param message 消息正文，传nil不显示
 @param view 展示的View
 @param progress 进度回调
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showDeterminateLoading:(nullable NSString *)message toView:(nullable UIView *)view progress:(LCCurrentHud)progress{
    
    return [self showLoadingStyle:LCLoadingProgressStyleDeterminate message:message toView:view progress:progress];
    
}

/**
 只显示扇形饼状加载进度指示器，不显示文本消息
 
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showDeterminateLoading {
    return [self showDeterminateLoading:nil toView:nil progress:nil];
}

/**
 加载进度的HUD，设置HUD的progress请通过 HUD 对象调用 showAnimated: whileExecutingBlock: 等方法
 
 @param style 进度条样式
 @param message 消息正文，传nil不显示
 @param view 展示的View
 @param progress 进度回调
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showLoadingStyle:(LCLoadingProgressStyle)style message:(nullable NSString *)message toView:(nullable UIView *)view progress:(LCCurrentHud)progress{
    
    
    MBProgressHUD *hud = setHUD(view, message, NO, 0);
    if (style == LCLoadingProgressStyleDeterminate) {
        /// 扇形进度条样式.
        hud.mode = MBProgressHUDModeDeterminate;
    } else if (style == LCLoadingProgressStyleDeterminateHorizontalBar) {
        /// 横向滚动进度条样式.
        hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    } else if (style == LCLoadingProgressStyleAnnularDeterminate) {
        /// 圆形进度条样式.
        hud.mode = MBProgressHUDModeAnnularDeterminate;
    }
    if (progress) {
        progress(hud);
    }
    return hud;
    
}

/**
 只显示加载进度的HUD，不显示消息文本，设置HUD的progress请通过 HUD 对象调用 showAnimated: whileExecutingBlock: 等方法
 
 @param style 进度条样式
 @param view 展示的View
 @param progress 进度回调
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showLoadingStyle:(LCLoadingProgressStyle)style toView:(nullable UIView *)view progress:(LCCurrentHud)progress{
    return [self showLoadingStyle:style message:nil toView:view progress:progress];
}

+ (instancetype)showLoadingStyle:(LCLoadingProgressStyle)style progress:(LCCurrentHud)progress{
    return [self showLoadingStyle:style toView:nil progress:progress];
}


#pragma mark 自定义View的方法

+ (void)showCustomView:(UIView *)customView message:(nullable NSString *)message hideAfterDelay:(NSTimeInterval)time toView:(nullable UIView *)view
{
    // 快速显示一个提示信息
    MBProgressHUD *hud = setHUD(view, message, YES, time);
    
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 设置自定义view
    hud.customView = customView;
    
    /**
     *1.customView 为UIImageView时,若设置了image图片,则系统会自动设置customView的size
     *2.否则需要通过约束布局手动去设置customView时size,
    */
    if (![customView isKindOfClass:[UIImageView class]]) {
        NSLayoutConstraint *w_constraint = [NSLayoutConstraint constraintWithItem:customView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1
                                                                         constant:37.f];
        NSLayoutConstraint *h_constraint = [NSLayoutConstraint constraintWithItem:customView
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1
                                                                         constant:37.f];
        [hud.customView addConstraints:@[w_constraint,h_constraint]];
    }
}

+ (void)showCustomView:(UIView *)customView hideAfterDelay:(NSTimeInterval)time toView:(nullable UIView *)view {
    [self showCustomView:customView message:nil hideAfterDelay:time toView:view];
}

+ (void)showCustomView:(UIView *)customView hideAfterDelay:(NSTimeInterval)time{
    [self showCustomView:customView message:nil hideAfterDelay:time toView:nil];
}


+ (void)showMessage:(nullable NSString *)message hideAfterDelay:(NSTimeInterval)time toView:(nullable UIView *)view customView:(UIView *(^)(void))customView{
    
    [self showCustomView:customView() message:message hideAfterDelay:time toView:view];
    
}

+ (void)showHideAfterDelay:(NSTimeInterval)time customView:(UIView *(^)(void))customView {
    
    [self showCustomView:customView() hideAfterDelay:time toView:nil];
}

#pragma mark 隐藏HUD
/**
 *  手动关闭MBProgressHUD
 *
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)hideHUDForView:(nullable UIView *)view
{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:view animated:YES];
}

/**
 *  手动关闭MBProgressHUD
 */
+ (void)hideHUD
{
    [self hideHUDForView:nil];
}


#pragma mark 属性

- (MBProgressHUD *(^)(UIColor *))titleColor {
    return ^(UIColor *titleColor){
        self.label.textColor = titleColor;
        self.detailsLabel.textColor = titleColor;
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))progressColor {
    return ^(UIColor *progressColor) {
        UIColor *titleColor = self.label.textColor;
        self.contentColor = progressColor;
        self.label.textColor = titleColor;
        self.detailsLabel.textColor = titleColor;
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))allContentColors {
    return ^(UIColor *allContentColors) {
        self.contentColor = allContentColors;
        return self;
    };
}

- (MBProgressHUD *(^)(LCHUDContentStyle))hudContentStyle {
    return ^(LCHUDContentStyle hudContentStyle){
        if (hudContentStyle == LCHUDContentStyleBlack) {
            self.contentColor = [UIColor whiteColor];
            self.bezelView.backgroundColor = [UIColor blackColor];
            self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
        } else if (hudContentStyle == LCHUDContentStyleCustom) {
            self.contentColor = LCCustomHudStyleContentColor;
            self.bezelView.backgroundColor = LCCustomHudStyleBackgrandColor;
            self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
            
        } else if (hudContentStyle == LCHUDContentStyleDefault){
            self.contentColor = [UIColor blackColor];
            self.bezelView.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
            self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
        }
        return self;
    };
}
- (MBProgressHUD *(^)(LCHUDPostion))hudPostion {
    return ^(LCHUDPostion hudPostion){
        if (hudPostion == LCHUDPostionTop) {
            self.offset = CGPointMake(0.f, -MBProgressMaxOffset);
        } else if (hudPostion == LCHUDPostionCenter) {
            self.offset = CGPointMake(0.f, 0.f);
        } else {
            self.offset = CGPointMake(0.f, MBProgressMaxOffset);
        }
        return self;
    };
}

- (MBProgressHUD *(^)(LCLoadingProgressStyle))hudProgressStyle
{
    return ^(LCLoadingProgressStyle hudProgressStyle){
        if (hudProgressStyle == LCLoadingProgressStyleDeterminate) {
            self.mode = MBProgressHUDModeDeterminate;

        } else if (hudProgressStyle == LCLoadingProgressStyleAnnularDeterminate) {
            self.mode = MBProgressHUDModeAnnularDeterminate;
            
        } else if (hudProgressStyle == LCLoadingProgressStyleCancelationDeterminate) {
            self.mode = MBProgressHUDModeDeterminate;
            
        } else if (hudProgressStyle == LCLoadingProgressStyleDeterminateHorizontalBar) {
            self.mode = MBProgressHUDModeDeterminateHorizontalBar;
        }
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))bezelBackgroundColor {
    return ^(UIColor *bezelViewColor){
        self.bezelView.backgroundColor = bezelViewColor;
        return self;
    };
}
- (MBProgressHUD *(^)(UIColor *))hudBackgroundColor {
    return ^(UIColor *hudBackgroundColor) {
        self.backgroundView.color = hudBackgroundColor;
        return self;
    };
}
@end
