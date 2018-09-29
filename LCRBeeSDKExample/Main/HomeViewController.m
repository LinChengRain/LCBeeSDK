//
//  HomeViewController.m
//  LCRBeeSDK
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
    
    [self loadData];
    [self initSubviews];
}

- (void)initSubviews
{
    [self.view addSubview:self.tableView];

}
- (void)loadData{
    [self.dataArray addObjectsFromArray:@[@{@"title":@"自定义控件线的位置",@"class":@"CustomBadgeViewController"},
                                          @{@"title":@"自适应匹配webview",@"class":@"LCWebViewController"},
                                          @{@"title":@"加载页控件",@"class":@"ListTableViewController"},
                                          @{@"title":@"动画效果",@"class":@"AnimationTableViewController"},
                                          @{@"title":@"静默发送邮件",@"class":@"SendEmailTableViewController"},
                                          @{@"title":@"UI控件扩展",@"class":@"CommonUIViewController"}]];
}
#pragma mark - Lazy Methods
- (NSMutableArray*)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
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
    NSDictionary *dictData = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dictData valueForKey:@"title"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dictData = [self.dataArray objectAtIndex:indexPath.row];
    NSString *cls = [dictData valueForKey:@"class"];
    
    UIViewController *vc = [[NSClassFromString(cls) alloc]init];

    [self.navigationController pushViewController:vc animated:YES];

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
