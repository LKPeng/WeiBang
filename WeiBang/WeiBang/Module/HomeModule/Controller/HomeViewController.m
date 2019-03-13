//
//  HomeViewController.m
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "HomeHeaderView.h"
#import "NewUsersViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation HomeViewController

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
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return scaleX(160);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HomeTableViewCell cellReuseID]];
    [cell setDataWithIndexPath:indexPath];
    return cell;
}



#pragma mark ----   懒加载  ----
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , KHIGHT) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor colorWithHexString:@"#f2f4f4"];
        adjustsScrollViewInsets_NO(_tableView, self);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, kTabBarHeight+22, 0);
        HomeHeaderView *headerView = [[HomeHeaderView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , scaleX(415))];
        headerView.newUserBlock = ^{
            NewUsersViewController *vc = [[NewUsersViewController alloc] init];
            [self.navigationController pushViewController:vc animated:true];
        };
        headerView.loanBlock = ^{
            self.navigationController.tabBarController.selectedIndex = 1;
        };
        headerView.newsBlock = ^{
            
        };
        _tableView.tableHeaderView = headerView;
        _tableView.tableFooterView = [UIView new];
        [_tableView regsiterCellWithCellClass:[HomeTableViewCell class] isNib:NO];
        [self.view addSubview: _tableView];
    }
    return _tableView;
}

@end

