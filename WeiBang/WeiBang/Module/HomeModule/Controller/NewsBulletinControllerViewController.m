//
//  NewsBulletinControllerViewController.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/11.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "NewsBulletinControllerViewController.h"
#import "NewsBulletinCell.h"
#import "NewsBulletinModel.h"

@interface NewsBulletinControllerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray<NewsBulletinModel *> *newsModels;

@property(nonatomic, assign)NSInteger pageNum;
@end

@implementation NewsBulletinControllerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    
    self.view.backgroundColor = kappMainColor;
    
    [self setupNavBarTitleViewWithText:@"新闻公告"];
    
    self.pageNum = 1;
    
    [self requestMoneyPageData];
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
    
    NewsBulletinModel *model2 = [[NewsBulletinModel alloc]init];
    model2.newsTime = @"2018-07-29";
    model2.newsContent = @"P2P对个人和社会的帮助";
    [self.newsModels addObject:model2];
    
    NewsBulletinModel *model3 = [[NewsBulletinModel alloc]init];
    model3.newsTime = @"2018-07-30";
    model3.newsContent = @"<<新闻联播>>证明报道P2P金融";
    [self.newsModels addObject:model3];
    
    NewsBulletinModel *model4 = [[NewsBulletinModel alloc]init];
    model4.newsTime = @"2018-08-03";
    model4.newsContent = @"谷歌或进军互联网金融 曾为上市的P2P公司投资";
    [self.newsModels addObject:model4];
    
    NewsBulletinModel *model5 = [[NewsBulletinModel alloc]init];
    model5.newsTime = @"2018-08-05";
    model5.newsContent = @"巨头纷纷进入P2P 资本或将成为最终摘桃者";
    [self.newsModels addObject:model5];
    
    NewsBulletinModel *model6 = [[NewsBulletinModel alloc]init];
    model6.newsTime = @"2018-08-07";
    model6.newsContent = @"互联网金融信用缺失 需建立严格黑名单制";
    [self.newsModels addObject:model6];
    
    NewsBulletinModel *model7 = [[NewsBulletinModel alloc]init];
    model7.newsTime = @"2018-08-08";
    model7.newsContent = @"互联网金融信用缺失 需建立严格黑名单制";
    [self.newsModels addObject:model7];
    
    NewsBulletinModel *model8 = [[NewsBulletinModel alloc]init];
    model8.newsTime = @"2018-08-10";
    model8.newsContent = @"阿里无抵押贷款或冲击P2P网贷 可贷1000万";
    [self.newsModels addObject:model8];
    
    NewsBulletinModel *model9 = [[NewsBulletinModel alloc]init];
    model9.newsTime = @"2018-08-12";
    model9.newsContent = @"张朝阳也来了?搜狐旗下公司搜易贷近日上线";
    [self.newsModels addObject:model9];
    
    NewsBulletinModel *model10 = [[NewsBulletinModel alloc]init];
    model10.newsTime = @"2018-08-15";
    model10.newsContent = @"全国p2p网贷日成交额突破10亿 再次创新高";
    [self.newsModels addObject:model10];
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
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , 0.001)];
        _myTableView.tableHeaderView = headerView;
        _myTableView.tableFooterView = [UIView new];
        [_myTableView regsiterCellWithCellClass:[NewsBulletinCell class] isNib:NO];
        
        [_myTableView addHeaderRefreshWithTarget:self eventAction:@selector(requestMoneyPageData)];
        [_myTableView addFooterRefreshWithTarget:self eventAction:@selector(requestMoneyPageNoData)];
        
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
@end
