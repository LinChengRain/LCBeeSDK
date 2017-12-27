//
//  CustomBadgeViewController.m
//  LCBeeSDK
//
//  Created by yuchanglin on 2017/12/26.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import "CustomBadgeViewController.h"
#import "CustomBadgeView.h"
@interface CustomBadgeViewController ()

@end

@implementation CustomBadgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CustomBadgeView*view = [[CustomBadgeView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:view];
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
