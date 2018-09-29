//
//  SCTTextviewViewController.m
//  ServiceCustomTools
//
//  Created by yu changlin on 2018/7/5.
//  Copyright © 2018年 yu changlin. All rights reserved.
//
//
//  UITextView
//
#import "SCTTextviewViewController.h"
#import "LCTextView.h"
#import "Macro.h"
@interface SCTTextviewViewController ()
@property (nonatomic,strong) LCTextView *textView;
@end

@implementation SCTTextviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initSubviews];
}

- (void)initSubviews
{
    [self.view addSubview:self.textView];
}
- (LCTextView *)textView
{
    if(!_textView) {
        _textView = [[LCTextView alloc] initWithFrame:CGRectMake(30, NavigationBarHeight + 20,MAIN_SCREEN_WIDTH - 60 , 200)];
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.layer.cornerRadius = 5;
        _textView.layer.masksToBounds = YES;
        _textView.placeholder = @"请输入内容";
        _textView.placeholderLocation = CGPointMake(20, 8);
        _textView.showWordNumber = YES;
        _textView.maxNumber = 140;
        _textView.locationType = ShowLocationTypeRight;
    }
    return _textView;
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
