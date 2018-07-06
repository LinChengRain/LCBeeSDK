//
//  MBProgressHUD+Extension.h
//  ServiceProject
//
//  Created by gz on 2018/6/6.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN
//typedef void((^LCCancelation)(MBProgressHUD *hud));
typedef void((^LCCurrentHud)(MBProgressHUD *hud));

typedef NS_ENUM(NSInteger, LCLoadingProgressStyle) {
    /* 扇型加载进度 */
    LCLoadingProgressStyleDeterminate,
    /* 横条加载进度 */
    LCLoadingProgressStyleDeterminateHorizontalBar,
    /* 环形加载进度 */
    LCLoadingProgressStyleAnnularDeterminate,
    /* 双圆环加载进度,带取消按钮*/
    LCLoadingProgressStyleCancelationDeterminate
};

typedef NS_ENUM(NSInteger, LCHUDContentStyle) {
    LCHUDContentStyleDefault = 0,//默认是白底黑字 Default
    LCHUDContentStyleBlack = 1,//黑底白字
    LCHUDContentStyleCustom = 2,//:自定义风格<由自己设置自定义风格的颜色>
};

typedef NS_ENUM(NSInteger, LCHUDPostion) {
    LCHUDPostionTop,//上面
    LCHUDPostionCenter,//中间
    LCHUDPostionBottom,//下面
};
/**
 * 风格为自定义时，在这里设置颜色
 */
#define LCCustomHudStyleBackgrandColor  [UIColor colorWithWhite:0.f alpha:0.7f]
#define LCCustomHudStyleContentColor    [UIColor colorWithWhite:1.f alpha:0.7f]


/** 设置默认的显示风格(修改这个值可以减少频繁的调用setHudStyle)：
 *  NHHUDContentDefaultStyle = 0,//默认是白底黑字 Default
 *  NHHUDContentBlackStyle = 1,//黑底白字
 *  NHHUDContentCustomStyle = 2,
 *
 * eg：设置为1时，调用任何这个扩展内的方法，显示出hud的UI效果都会为黑底白字风格
 */
#define LCHudDefaultStyle  1

//CGFloat const delayTime = 1.0;
#define delayTime  1.0


@interface MBProgressHUD (Extension)

#pragma mark - 显示纯文本信息
/**
 只显示纯文本信息, 默认 1 秒后消失
 */
+ (void)showText:(NSString *)text view:(nullable UIView *)view;

/**
 只显示纯文本信息, 默认 1 秒后消失
 @param text 消息文本
 @param view 展示的View
 */
+ (void)showPlainText:(NSString *)text view:(nullable UIView *)view;


/**
 只显示纯文本信息
 @param text 消息文本
 @param time HUD展示时长
 @param view 展示的View
 */
+ (void)showPlainText:(NSString *)text
          hideAfterDelay:(NSTimeInterval)time
                    view:(nullable UIView *)view;


#pragma mark - 显示操作成功或失败信息（自定义view打勾打叉动画）

/**
 显示失败信息，同时有打叉的动画
 
 @param error 错误信息
 @param time HUD展示时长
 @param view 展示的view
 */
+ (void)showError:(nullable NSString *)error
      hideAfterDelay:(NSTimeInterval)time
              toView:(nullable UIView *)view;

/**
 显示失败信息，同时有打叉的动画, 默认 1 秒后消失
 @param error 错误信息提示文本
 @param view 展示的View
 */
+ (void)showError:(nullable NSString *)error toView:(nullable UIView *)view;



/**
 显示失败信息，同时有打叉的动画，默认 1 秒后消失
 @param error 错误信息提示文本
 */
+ (void)showError:(nullable NSString *)error;

/**
 只显示打叉动画HUD，默认 1 秒后消失
 */
+ (void)showError;



/**
 显示成功信息，同时会有一个打勾的动画
 @param success 成功信息提示文本
 @param time HUD展示时长
 @param view 展示的View
 */
+ (void)showSuccess:(nullable NSString *)success
        hideAfterDelay:(NSTimeInterval)time
                toView:(nullable UIView *)view;

/**
 显示成功信息，同时会有一个打勾的动画, 默认 1s 后消失
 @param success 成功信息提示文本
 @param view 展示的View
 */
+ (void)showSuccess:(nullable NSString *)success toView:(nullable UIView *)view;


/**
 显示成功信息，同时会有一个打勾的动画, 默认 1s 后消失
 
 @param success 成功信息提示文本
 */
+ (void)showSuccess:(nullable NSString *)success;


/**
 只显示打勾动画HUD，默认 1s 后消失
 */
+ (void)showSuccess;

#pragma mark - 自己设置提示信息的 图标

/**
 显示带有自定义icon图标消息HUD
 @param icon 图标
 @param message 消息正文
 @param time HUD展示时长
 @param view 展示的view
 */
+ (void)showIcon:(UIImage *)icon
            message:(NSString *)message
     hideAfterDelay:(NSTimeInterval)time
               view:(nullable UIView *)view;

/**
 显示带有自定义icon图标消息HUD, 默认 1s 后消失
 @param icon 图标
 @param message 消息正文
 @param view 展示的view
 */
+ (void)showIcon:(UIImage *)icon
            message:(NSString *)message
               view:(nullable UIView *)view;

+ (void)showIcon:(UIImage *)icon
         message:(NSString *)message;


#pragma mark - 加载菊花的HUD
/**
 显示菊花加载状态，不会自动消失，需要在你需要移除的时候调用 hideHUDForView: 等移除方法
 @param message 消息正文
 @param view 展示的view
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showActivityLoading:(nullable NSString *)message
                                toView:(nullable UIView *)view;

/**
 只显示菊花加载动画，不会自动消失，需要在你需要移除的时候调用 hideHUDForView: 等移除方法
 @param view 展示的View
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showActivityLoadingToView:(nullable UIView *)view;
/**
 只显示菊花加载动画，不会自动消失，需要在你需要移除的时候调用 hideHUDForView: 等移除方法
 
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showActivityLoading;

#pragma mark - 加载loading的HUD

/**
 显示loading加载状态
 
 @param message 消息正文
 @param view 展示的view
 */
+ (instancetype)showLoading:(nullable NSString *)message toView:(nullable UIView *)view;

+ (instancetype)showLoadingToView:(nullable UIView *)view;

+ (instancetype)showLoading;

#pragma mark - 有加载进度的HUD
/**
 加载进度的HUD，设置HUD的progress请通过 HUD 对象调用 showAnimated: whileExecutingBlock: 等方法
 
 使用举例：
 MBProgressHUD *hud = [MBProgressHUD showLoadingStyle:WJHUDLoadingProgressStyleDeterminate message:@"正在加载..." toView:nil];
 [hud showAnimated:YES whileExecutingBlock:^{
 float progress = 0.0f;
 while (progress < 1.0f) {
 hud.progress = progress;
 hud.labelText = [NSString stringWithFormat:@"正在加载...%.0f%%", progress * 100];
 progress += 0.01f;
 usleep(50000);
 }
 } completionBlock:^{
 [MBProgressHUD hideHUD];
 // [hud removeFromSuperViewOnHide];
 }];
 
 @param style 进度条样式
 @param message 消息正文，传nil不显示
 @param view 展示的View
 @param progress 进度回调
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showLoadingStyle:(LCLoadingProgressStyle)style
                            message:(nullable NSString *)message
                             toView:(nullable UIView *)view
                           progress:(nullable LCCurrentHud)progress;

/**
 只显示加载进度的HUD，不显示消息文本
 
 @param style 进度条样式
 @param view 展示的View
 @param progress 进度回调
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showLoadingStyle:(LCLoadingProgressStyle)style
                          toView:(nullable UIView *)view
                        progress:(nullable LCCurrentHud)progress;

/**
 只显示加载进度的HUD，不显示消息文本
 
 @param style 进度条样式
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showLoadingStyle:(LCLoadingProgressStyle)style
                        progress:(nullable LCCurrentHud)progress;

/**
 显示环形加载状态指示器
 @param message 消息正文，传nil不显示
 @param view 展示的View
 @param progress 进度回调
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showAnnularLoading:(nullable NSString *)message
                            toView:(nullable UIView *)view
                          progress:(nullable LCCurrentHud)progress;

/**
 只显示环形加载状态指示器，不显示文本消息
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showAnnularLoading;

/**
 扇形饼状加载进度

 @param message 消息正文，传nil不显示
 @param view 展示的View
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showDeterminateLoading:(nullable NSString *)message
                                toView:(nullable UIView *)view
                              progress:(nullable LCCurrentHud)progress;

/**
 只显示扇形饼状加载进度指示器，不显示文本消息
 
 @return MBProgressHUD对象，可以通过它调用MBProgressHUD中的方法
 */
+ (instancetype)showDeterminateLoading;



#pragma mark - 自定义HUD中显示的view

/**
 自定义HUD中显示的view
 @param customView 自定义的view
 @param message 消息正文，传nil只显示自定义的view在HUD上
 @param time HUD展示时长
 @param view 展示的view
 */
+ (void)showCustomView:(UIView *)customView
                  message:(nullable NSString *)message
           hideAfterDelay:(NSTimeInterval)time
                   toView:(nullable UIView *)view;

+ (void)showCustomView:(UIView *)customView
           hideAfterDelay:(NSTimeInterval)time
                   toView:(nullable UIView *)view;

+ (void)showCustomView:(UIView *)customView
           hideAfterDelay:(NSTimeInterval)time;

/**
 自定义HUD中显示的view, 闭包返回自定义的View
 @param message 消息正文
 @param time HUD展示时长
 @param view 展示的view
 @param customView 返回自定义UIView
 */
+ (void)showMessage:(nullable NSString *)message
        hideAfterDelay:(NSTimeInterval)time
                toView:(nullable UIView *)view
         customView:(UIView *(^)(void))customView;

+ (void)showHideAfterDelay:(NSTimeInterval)time
                customView:(UIView *(^)(void))customView;



#pragma mark - 移除HUD
/**
 从view上移除HUD
 @param view 展示HUD的View
 */
+ (void)hideHUDForView:(nullable UIView *)view;
/**
 从当前展示的View上移除HUD
 */
+ (void)hideHUD;

#pragma mark - 属性

//@property (nonatomic, copy  ) LCCancelation cancelation;
///内容风格
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudContentStyle)(LCHUDContentStyle hudContentStyle);
///显示位置：有导航栏时在导航栏下在，无导航栏在状态栏下面
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudPostion)(LCHUDPostion hudPostion);
///进度条风格
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudProgressStyle)(LCLoadingProgressStyle hudProgressStyle);
///标题颜色
@property (nonatomic, strong, readonly) MBProgressHUD *(^titleColor)(UIColor *titleColor);
///进度条颜色
@property (nonatomic, strong, readonly) MBProgressHUD *(^progressColor)(UIColor *progressColor);
///进度条、标题颜色
@property (nonatomic, strong, readonly) MBProgressHUD *(^allContentColors)(UIColor *allContentColors);
///蒙层背景色
@property (nonatomic, strong, readonly) MBProgressHUD *(^hudBackgroundColor)(UIColor *backgroundColor);
///内容背景色
@property (nonatomic, strong, readonly) MBProgressHUD *(^bezelBackgroundColor)(UIColor *bezelBackgroundColor);

@end
NS_ASSUME_NONNULL_END
