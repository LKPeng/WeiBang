//
//  ProductListController.m
//  WeiBang
//
//  Created by tchzt on 2019/3/19.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "ProductListController.h"

#import "PlanADScrollView.h"
#import "HomeFootView.h"
#import "HomeModel.h"
#import "ProductListCell.h"

@interface ProductListController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray<HomeModel *> *HomeModels;

@end

@implementation ProductListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self createItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup{
    
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancleButton setTitle:@"公告" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(cancleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:cancleButton];
    rightItem.imageInsets = UIEdgeInsetsMake(0, -15,0, 0);//设置向左偏移
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark ----   数据  ----

- (void)createItem{
    HomeModel *model1 = [[HomeModel alloc]init];
    model1.moneyTerm = @"银票通30天";
    model1.Progress = 0.0838;
    model1.term = 30;
    model1.total = 47000.00;
    model1.startAccount = 1000;
    [self.HomeModels addObject:model1];
    
    HomeModel *model2 = [[HomeModel alloc]init];
    model2.moneyTerm = @"银票通30天";
    model2.Progress = 0.0838;
    model2.term = 30;
    model2.total = 47000.00;
    model2.startAccount = 1000;
    [self.HomeModels addObject:model2];
    
    HomeModel *model3 = [[HomeModel alloc]init];
    model3.moneyTerm = @"银票通30天";
    model3.Progress = 0.0838;
    model3.term = 30;
    model3.total = 47000.00;
    model3.startAccount = 1000;
    [self.HomeModels addObject:model3];
    
    [self.tableView reloadData];
}
#pragma mark ----   点击  ----

//- (void)cancleButtonClicked{
//    NewsBulletinControllerViewController *invest = [[NewsBulletinControllerViewController alloc]init];
//    [self.navigationController pushViewController:invest animated:YES];
//}



#pragma mark ----   UITableViewDelegate  ----

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return scaleY_6(130);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductListCell *cell = [tableView dequeueReusableCellWithIdentifier:[ProductListCell cellReuseID]];
//    cell.model = self.HomeModels[indexPath.row];
    return cell;
}


- (void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
//section底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.001)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.001;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.001)];
    return sectionHeadView;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , 0.001)];
        _tableView.tableHeaderView = headerView;
        [_tableView regsiterCellWithCellClass:[ProductListCell class] isNib:NO];
        [self.view addSubview: _tableView];
    }
    return _tableView;
}

- (NSMutableArray<HomeModel *> *)HomeModels{
    if (!_HomeModels) {
        _HomeModels = [[NSMutableArray alloc]init];
    }
    return _HomeModels;
}
@end
