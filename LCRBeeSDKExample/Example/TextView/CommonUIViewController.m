//
//  CommonUIViewController.m
//  ServiceCustomTools
//
//  Created by yu changlin on 2018/7/5.
//  Copyright © 2018年 yu changlin. All rights reserved.
//

#import "CommonUIViewController.h"
#import "SCTTextviewViewController.h"
@interface CommonUIViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UITableView *tableview;
@end

@implementation CommonUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self.view addSubview:self.tableview];
}
- (void)loadData {
    [self.dataArray addObjectsFromArray:@[@{@"title":@"UITextView",@"class":@"SCTTextviewViewController"}]];
}
#pragma mark ========== Lazy method ==========
- (NSMutableArray *)dataArray
{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (UITableView *)tableview
{
    if (_tableview == nil) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.rowHeight = 44;
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    }
    return _tableview;
}
#pragma mark ========== UITableView Delegate And Datasource ==========
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    NSDictionary *dictDic =[self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dictDic valueForKey:@"title"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dictDic =[self.dataArray objectAtIndex:indexPath.row];
    UIViewController* viewcontroller = [[NSClassFromString([dictDic valueForKey:@"class"]) alloc] init];
    viewcontroller.view.backgroundColor = [UIColor lightGrayColor];
    [self.navigationController pushViewController:viewcontroller animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
