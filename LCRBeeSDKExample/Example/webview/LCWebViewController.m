//
//  LCWebViewController.m
//  LCRBeeSDK
//
//  Created by yuchanglin on 2017/12/27.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import "LCWebViewController.h"
#import "LCWebview.h"
@interface LCWebViewController ()

@end

@implementation LCWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LCWebview *view = [[LCWebview alloc] initWithFrame:self.view.frame];
    [view loadURLString:@"https://www.baidu.com"];
    [self.view addSubview:view];
    
    if (view.wkWebView != nil) {
        self.title = @"WKWebView";
    }else{
        self.title = @"UIWebView";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
