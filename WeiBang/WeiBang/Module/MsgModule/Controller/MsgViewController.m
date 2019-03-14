//
//  MsgViewController.m
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MsgViewController.h"
#import "HomeTableViewCell.h"
#import "InvestController.h"
#import "JJOptionView.h"

@interface MsgViewController ()<UITableViewDelegate,UITableViewDataSource,JJOptionViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

int count = 10;

@implementation MsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup{
    self.view.backgroundColor = kappMainColor;
    self.automaticallyAdjustsScrollViewInsets = true;
    [self.tableView reloadData];
    self.tabBarController.tabBar.hidden = NO;
    
    JJOptionView *view1 = [[JJOptionView alloc] initWithFrame:CGRectMake(0, kNavBarHeight , KWIDTH, 40)];
    view1.delegate = self;
    [self.view addSubview:view1];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [ self.tableView.mj_footer endRefreshing];
        count += 10;
        [self.tableView reloadData];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return scaleX(160);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HomeTableViewCell cellReuseID]];
    [cell setDataWithIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    InvestController *invest = [[InvestController alloc]init];
    [invest setDataWithIndexPath:indexPath];
    [self.navigationController pushViewController:invest animated:YES];
}

#pragma mark ----   懒加载  ----
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , KHIGHT) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor colorWithHexString:@"#f2f4f4"];
        adjustsScrollViewInsets_NO(_tableView, self);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.contentInset = UIEdgeInsetsMake(40, 0, kTabBarHeight+25, 0);
        [_tableView regsiterCellWithCellClass:[HomeTableViewCell class] isNib:NO];
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , 0.001)];
        _tableView.tableHeaderView = headerView;
        [self.view addSubview: _tableView];
    }
    return _tableView;
}

@end
