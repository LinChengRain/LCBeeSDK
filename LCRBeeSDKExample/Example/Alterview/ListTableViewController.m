//
//  ListTableViewController.m
//  ServiceProject
//
//  Created by yuchanglin on 2018/6/6.
//  Copyright © 2018年 yuchanglin. All rights reserved.
//

#import "ListTableViewController.h"
#import "MBProgressHUD+Extension.h"
#import "ArcView.h"
#import "WJSuccessView.h"
@interface ListTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataArray addObjectsFromArray:@[@"成功:只显示打勾动画HUD, 默认 1 秒后消失",
                                          @"成功:显示成功信息和打勾的动画",
                                          @"成功:显示成功信息和打勾的动画,设置view",
                                          @"成功:显示成功信息和打勾的动画,设置view,自定义时间",
                                          @"失败:只显示纯文本信息, 默认 1 秒后消失",
                                          @"失败:显示失败信息和打叉的动画",
                                          @"失败:显示失败信息和打叉的动画,带view",
                                          @"失败:显示失败信息和打叉的动画,带view,自定义时间",
                                          @"只显示纯文本信息, 默认 1 秒后消失",
                                          @"只显示纯文本信息, 默认 1 秒后消失,带view",
                                          @"只显示纯文本信息,带view,自定义时间",
                                          @"只显示菊花加载动画，不会自动消失",
                                          @"显示菊花加载状态和文本信息，不会自动消失",
                                          @"横条加载进度，不显示消息文本",
                                          @"扇型加载进度，不显示消息文本",
                                          @"环形加载进度，不显示消息文本",
                                          @"显示环形加载状态指示器",
                                          @"横条加载进度，显示消息文本",
                                          @"扇型加载进度，显示消息文本",
                                          @"环形加载进度，显示消息文本",
                                          @"自定义加载",
                                          @"自定义动画--成功",
                                          @"自定义loading加载动画",]];
    

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ListCell"];
    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"隐藏弹窗" style:UIBarButtonItemStylePlain target:self action:@selector(hideHUDView:)];
}
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [MBProgressHUD showSuccess];
            break;
        case 1:
            [MBProgressHUD showSuccess:@"加载成功"];
            break;
        case 2:
            [MBProgressHUD showSuccess:@"加载成功" toView:self.view];
            break;
        case 3:
            [MBProgressHUD showSuccess:@"加载成功,3秒后隐藏" hideAfterDelay:3.f toView:self.view];
            break;
        case 4:
            [MBProgressHUD showError];
            break;
        case 5:
            [MBProgressHUD showError:@"加载失败"];
            break;
        case 6:
            [MBProgressHUD showError:@"加载失败" toView:self.view];
            break;
        case 7:
            [MBProgressHUD showError:@"加载失败" hideAfterDelay:3.0f toView:self.view];
            break;
        case 8:
            [MBProgressHUD showText:@"小可爱" view:self.view];
            break;
        case 9:
            [MBProgressHUD showPlainText:@"小可爱" view:self.view];
            break;
        case 10:
            [MBProgressHUD showPlainText:@"小可爱" hideAfterDelay:3.f view:self.view];
            break;
        case 11:
            [MBProgressHUD showActivityLoadingToView:self.view];
            break;
        case 12:
            [MBProgressHUD showActivityLoading:@"加载中,图标不会自己消失的..." toView:self.view];
            break;
        case 13:
            [MBProgressHUD showLoadingStyle:LCLoadingProgressStyleDeterminateHorizontalBar progress:^(MBProgressHUD *hud) {
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                    float progress = 0.0f;
                    while (progress < 1.0f) {
                        progress += 0.01f;
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            hud.progress = progress;
                        });
                        usleep(50000);
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [MBProgressHUD hideHUD];
                    });
                });
            }];
            break;
        case 14:
            [MBProgressHUD showLoadingStyle:LCLoadingProgressStyleDeterminate progress:^(MBProgressHUD *hud) {
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                    float progress = 0.0f;
                    while (progress < 1.0f) {
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            hud.progress = progress;
                        });
                        progress += 0.01f;
                        usleep(50000);
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [MBProgressHUD hideHUD];
                    });
                });
            }];
            break;
        case 15:
            [MBProgressHUD showLoadingStyle:LCLoadingProgressStyleAnnularDeterminate progress:^(MBProgressHUD *hud) {
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                    float progress = 0.0f;
                    while (progress < 1.0f) {
                        progress += 0.01f;
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            hud.progress = progress;
                        });
                        usleep(50000);
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [MBProgressHUD hideHUD];
                    });
                });
            }];
            break;
        case 16:
        {
            [MBProgressHUD showAnnularLoading:@"图片上传中" toView:self.view progress:^(MBProgressHUD *hud) {
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                    float progress = 0.0f;
                    while (progress < 1.0f) {
                        progress += 0.01f;
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            hud.progress = progress;
//                            hud.label.text = [NSString stringWithFormat:@"正在加载...%.0f%%", progress * 100];
                        });
                        usleep(50000);
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [MBProgressHUD hideHUD];
                    });
                });
            }];
        }
            break;
        case 17:
              [MBProgressHUD showLoadingStyle:LCLoadingProgressStyleDeterminateHorizontalBar message:@"上传中...." toView:nil progress:^(MBProgressHUD *hud) {
                    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                        float progress = 0.0f;
                        while (progress < 1.0f) {
                            progress += 0.01f;
                            dispatch_async(dispatch_get_main_queue(), ^(void) {
                                hud.progress = progress;
                            });
                            usleep(50000);
                        }
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [MBProgressHUD hideHUD];
                        });
                    });
                }];
            break;
        case 18:
            [MBProgressHUD showLoadingStyle:LCLoadingProgressStyleDeterminate message:@"上传中...." toView:nil progress:^(MBProgressHUD *hud) {
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                    float progress = 0.0f;
                    while (progress < 1.0f) {
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            hud.progress = progress;
                        });
                        progress += 0.01f;
                        usleep(50000);
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [MBProgressHUD hideHUD];
                    });
                });
            }];
            break;
        case 19:
            [MBProgressHUD showLoadingStyle:LCLoadingProgressStyleAnnularDeterminate message:@"上传中...." toView:nil progress:^(MBProgressHUD *hud) {
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
                    float progress = 0.0f;
                    while (progress < 1.0f) {
                        progress += 0.01f;
                        dispatch_async(dispatch_get_main_queue(), ^(void) {
                            hud.progress = progress;
                        });
                        usleep(50000);
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [MBProgressHUD hideHUD];
                    });
                });
            }];
            break;
        case 20:
        {
            ArcView *view = [[ArcView alloc] initWithFrame:CGRectZero];
            
            [MBProgressHUD showCustomView:view message:@"正在加载" hideAfterDelay:100.f toView:self.view];
        }
            break;
        case 21:
        {
            WJSuccessView *view = [[WJSuccessView alloc] initWithFrame:CGRectZero];
            view.wj_animationType = WJAnimationTypeNone;
            [MBProgressHUD showCustomView:view message:@"正在加载" hideAfterDelay:3.f toView:self.view];
        }
            break;
        case 22:
        {
            [MBProgressHUD showLoading:@"加载中" toView:self.view];
        }
            break;
        default:
            break;
    }

}
#pragma mark ========== click ==========
- (void)hideHUDView:(UIButton *)sender
{
    [MBProgressHUD hideHUDForView:self.view];
}
@end
