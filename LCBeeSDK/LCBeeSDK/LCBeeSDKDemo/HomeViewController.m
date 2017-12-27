//
//  HomeViewController.m
//  LCBeeSDK
//
//  Created by yuchanglin on 2017/12/26.
//  Copyright © 2017年 yuchanglin. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomBadgeViewController.h"
#import "LCWebViewController.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    [self initSubviews];
}

- (void)initSubviews
{
    [self.view addSubview:self.tableView];

}
#pragma mark - Lazy Methods
- (NSMutableArray*)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithArray:@[@"自定义圆角",@"自适应匹配webview"]];
    }
    return _dataArray;
}
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
#pragma mark - UITableView Delegate And Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row== 0) {
        CustomBadgeViewController *vc = [[CustomBadgeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        LCWebViewController *vc = [[LCWebViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
     NSLog(@"%@", [NSString stringWithFormat:@"选中第%ld个单元格",(long)indexPath.row]);
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
