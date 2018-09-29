//
//  MainTabBarViewController.m
//  LCRBeeSDK
//
//  Created by yuchanglin on 2017/12/26.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MainNavigationController.h"
#import "HomeViewController.h"
#import "SettingViewController.h"
#import "Macro.h"
@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addControllers];
}

- (void)addControllers{
    HomeViewController *home = [[HomeViewController alloc] init];
    [self controller:home title:@"首页" image:@"TabPurchase" selectedImage:@"TabPurchaseClick"];
  
    SettingViewController *setting = [[SettingViewController alloc] init];
    [self controller:setting title:@"设置" image:@"TabMessage" selectedImage:@"TabMessageClick"];

}
- (void)controller:(UIViewController*)controller
             title:(NSString*)title
             image:(NSString*)imageStr
     selectedImage:(NSString*)seletedImgStr{
    controller.title = title;
    controller.tabBarItem.image = [[UIImage imageNamed:imageStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:seletedImgStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置选中时文字样式
    NSMutableDictionary *selectedAtts=[NSMutableDictionary dictionary];
    selectedAtts[NSForegroundColorAttributeName]=RGB_COLOR(71, 167, 230);
    
    [controller.tabBarItem setTitleTextAttributes:selectedAtts forState:UIControlStateSelected];
    
    MainNavigationController *navigationVC = [[MainNavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:navigationVC];
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
