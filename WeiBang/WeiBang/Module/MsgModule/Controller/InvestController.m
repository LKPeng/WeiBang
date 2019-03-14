//
//  InvestController.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "InvestController.h"
#import "NewsBulletinCell.h"
#import "NewsBulletinModel.h"
#import "InvestHeadView.h"
#import "OpenAccountViewController.h"

@interface InvestController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray<NewsBulletinModel *> *newsModels;

@property(nonatomic, assign)NSInteger pageNum;

/* 设备 */
@property (strong, nonatomic) NSMutableArray *titleTextArray;

@property(nonatomic, strong) UIButton *saveBtn;
@end

@implementation InvestController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    
    self.view.backgroundColor = kappMainColor;
    
    [self setupNavBarTitleViewWithText:@"投资"];
    
    self.pageNum = 1;
    
    [self createModel];
    
    [self.myTableView reloadData];
    
    [self.view addSubview:self.saveBtn];
    
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark ----   加载数据  ----

#pragma mark- 请求数据
- (void)requestMoneyPageData{
    
    if ([self.myTableView.mj_header isRefreshing]) {
        //        //初始化
        self.pageNum = 1;
    }
    [self.myTableView releaseRefresh];
    
    NSInteger tempIndex = self.pageNum;
    
    if (tempIndex == 1) {
        [self.newsModels removeAllObjects];
        [self createModel];
    }
    
    [self.myTableView reloadData];
}

- (void)requestMoneyPageNoData{
    [self.myTableView setFooterNoMoreDataState];
}

- (void)createModel{
    NewsBulletinModel *model1 = [[NewsBulletinModel alloc]init];
    model1.newsTime = @"2018-07-27";
    model1.newsContent = @"央视:国务院批准P2P合法地位正式确立";
    [self.newsModels addObject:model1];
    
}

- (void)setDataWithIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%7 == 0){
        [self.titleTextArray addObject: @"富桢流程测试"];
        [self.titleTextArray addObject: @"预期年化收益率12%"];
        [self.titleTextArray addObject: @"期限一个月"];
    }else if (indexPath.row%7 == 1){
        [self.titleTextArray addObject: @"车辆抵押"];
        [self.titleTextArray addObject: @"预期年化收益率16%"];
        [self.titleTextArray addObject: @"期限一个月"];
    }else if (indexPath.row%7 == 2) {
        [self.titleTextArray addObject: @"新年地产开盘"];
        [self.titleTextArray addObject: @"预期年化收益率8%"];
        [self.titleTextArray addObject: @"期限一个月"];
    }else if (indexPath.row%7 == 3) {
        [self.titleTextArray addObject: @"个人房屋抵押借款"];
        [self.titleTextArray addObject: @"预期年化收益率5%"];
        [self.titleTextArray addObject: @"期限一个月"];
    }else{
        NSString *text = [[NSString alloc]initWithFormat:@"个人标的测试流程%ld",(long)indexPath.row%5];
        [self.titleTextArray addObject: text];
        [self.titleTextArray addObject: @"预期年化收益率10%"];
        [self.titleTextArray addObject: @"期限一个月"];
    }
    
}
#pragma mark ----   点击  ----

- (void)saveBtnClick{
    OpenAccountViewController *open = [[OpenAccountViewController alloc]init];
    [self.navigationController pushViewController:open animated:YES];
}

#pragma mark -  UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsModels.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsBulletinCell *cell = [tableView dequeueReusableCellWithIdentifier: [NewsBulletinCell cellReuseID]];
    cell.model = self.newsModels[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsBulletinModel *model = self.newsModels[indexPath.row];
    return model.cellHeight;
}


- (void)viewDidLayoutSubviews
{
    if ([self.myTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.myTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.myTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.myTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
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

- (UITableView *)myTableView{
    if(!_myTableView){
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , KHIGHT - kNavBarHeight) style:UITableViewStyleGrouped];
        _myTableView.backgroundColor = RGB(248, 248, 248);
        adjustsScrollViewInsets_NO(_myTableView, self);
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.rowHeight = 60;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        InvestHeadView *headerView = [[InvestHeadView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , scaleY_6(160 + 10 + 120 + 50 + 30 + 45))];
        headerView.titleTextArray = self.titleTextArray;
        headerView.backgroundColor = [UIColor whiteColor];
        [headerView setDataWithIndexPath:1];
        _myTableView.tableHeaderView = headerView;
        _myTableView.tableFooterView = [UIView new];
        [_myTableView regsiterCellWithCellClass:[NewsBulletinCell class] isNib:NO];
        
//        [_myTableView addHeaderRefreshWithTarget:self eventAction:@selector(requestMoneyPageData)];
//        [_myTableView addFooterRefreshWithTarget:self eventAction:@selector(requestMoneyPageNoData)];
        
        [self.view addSubview: _myTableView];
    }
    return _myTableView;
}

- (NSMutableArray<NewsBulletinModel *> *)newsModels{
    if (!_newsModels) {
        _newsModels = [[NSMutableArray alloc]init];
    }
    return _newsModels;
}

- (NSMutableArray *)titleTextArray{
    if (!_titleTextArray) {
        _titleTextArray = [[NSMutableArray alloc]init];
    }
    return _titleTextArray;
}

- (UIButton *)saveBtn{
    if (!_saveBtn) {
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [saveBtn setTitle:@"立即投资" forState:UIControlStateNormal];
        saveBtn.backgroundColor = kappRed;
        saveBtn.tintColor = [UIColor whiteColor];
        saveBtn.titleLabel.font = kFontSize6(13);
        saveBtn.frame = CGRectMake(10, SCREEN_HEIGHT - scaleY_6(10) - scaleY_6(40), SCREEN_WIDTH - 20, scaleY_6(40));
        [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _saveBtn = saveBtn;
    }
    return _saveBtn;
}

@end
