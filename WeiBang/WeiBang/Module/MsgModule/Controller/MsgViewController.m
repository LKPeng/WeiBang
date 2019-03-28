//
//  MsgViewController.m
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MsgViewController.h"
#import "MsgModel.h"
#import "MsgTableViewCell.h"
#import "msgSectionView.h"
#import "MsgHeadView.h"
#import "LendViewController.h"

@interface MsgViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *myTableView;

@property (strong, nonatomic) NSMutableArray *dataArray;

//@property (strong, nonatomic) NSMutableArray *modelArray;

@end

@implementation MsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KWhiteColor;
    
    [self setupNavBarTitleViewWithText:@"产品"];
    //    self.modelArray = [[NSMutableArray alloc]init];
    
    [self createModel];
    
}

- (void)createModel{
    
    //1组
    NSMutableArray *modelArray0 = [[NSMutableArray alloc]init];
    MsgModel *model0 = [MsgModel new];
    model0.percent = @"9.5%";
    model0.title = @"到期还本付息";
    model0.history = @"365天 项目期限";
    model0.borrow = @"最小出借金额1万元";
    model0.sectionTitle = @"每日抢标";
    model0.sectionTxt = @"11点,14点,17点,20点准时抢!";
    [modelArray0 addObject:model0];
    
    MsgModel *model1 = [MsgModel new];
    model1.percent = @"8%";
    model1.title = @"到期还本付息";
    model1.history = @"183天 项目期限";
    model1.borrow = @"最小出借金额1000元";
    model1.sectionTitle = @"每日抢标";
    model1.sectionTxt = @"11点,14点,17点,20点准时抢!";
    [modelArray0 addObject:model1];
    
    [self.dataArray addObject:modelArray0];
    
    //2组
    NSMutableArray *modelArray1 = [[NSMutableArray alloc]init];
    MsgModel *model1_0 = [MsgModel new];
    model1_0.percent = @"6.5%";
    model1_0.title = @"到期还本付息";
    model1_0.history = @"274天 项目期限";
    model1_0.borrow = @"最小出借金额1000元";
    model1_0.sectionTitle = @"安心投";
    model1_0.sectionTxt = @"自动到期，安心出借";
    [modelArray1 addObject:model1_0];
    
    [self.dataArray addObject:modelArray1];
    
    //3组
    NSMutableArray *modelArray2 = [[NSMutableArray alloc]init];
    
    MsgModel *model2_0 = [MsgModel new];
    model2_0.percent = @"5.5%";
    model2_0.title = @"到期还本付息";
    model2_0.history = @"183天 项目期限";
    model2_0.borrow = @"最小出借金额1000元";
    model2_0.sectionTitle = @"约定返";
    model2_0.sectionTxt = @"每日回款,月月领钱";
    [modelArray2 addObject:model2_0];
    
    MsgModel *model2_1 = [MsgModel new];
    model2_1.percent = @"8.0%";
    model2_1.title = @"到期还本付息";
    model2_1.history = @"134天 项目期限";
    model2_1.borrow = @"最小出借金额1000元";
    model2_1.sectionTitle = @"约定返";
    model2_1.sectionTxt = @"每日回款,月月领钱";
    [modelArray2 addObject:model2_1];
    
    MsgModel *model2_2 = [MsgModel new];
    model2_2.percent = @"8.5%";
    model2_2.title = @"到期还本付息";
    model2_2.history = @"183天 项目期限";
    model2_2.borrow = @"最小出借金额1000元";
    model2_2.sectionTitle = @"约定返";
    model2_2.sectionTxt = @"每日回款,月月领钱";
    [modelArray2 addObject:model2_2];
    
    [self.dataArray addObject:modelArray2];
    
    //4组
    NSMutableArray *modelArray3 = [[NSMutableArray alloc]init];
    
    MsgModel *model3_0 = [MsgModel new];
    model3_0.percent = @"8%";
    model3_0.title = @"到期还本付息";
    model3_0.history = @"183天 项目期限";
    model3_0.borrow = @"最小出借金额1000元";
    model3_0.sectionTitle = @"安心投";
    model3_0.sectionTxt = @"自动到期，安心出借";
    [modelArray3 addObject:model3_0];
    
    MsgModel *model3_1 = [MsgModel new];
    model3_1.percent = @"8%";
    model3_1.title = @"到期还本付息";
    model3_1.history = @"183天 项目期限";
    model3_1.borrow = @"最小出借金额1000元";
    model3_1.sectionTitle = @"安心投";
    model3_1.sectionTxt = @"自动到期，安心出借";
    [modelArray3 addObject:model3_1];
    
    MsgModel *model3_2 = [MsgModel new];
    model3_2.percent = @"8%";
    model3_2.title = @"到期还本付息";
    model3_2.history = @"183天 项目期限";
    model3_2.borrow = @"最小出借金额1000元";
    model3_2.sectionTitle = @"安心投";
    model3_2.sectionTxt = @"自动到期，安心出借";
    [modelArray3 addObject:model3_2];
    
    [self.dataArray addObject:modelArray3];
    
    
    [self.view addSubview:self.myTableView];
}


#pragma mark -  UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *modelArray = _dataArray[section];
    return modelArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    MsgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MsgTableViewCell cellReuseID]];
    NSMutableArray *modelArray = _dataArray[indexPath.section];
    MsgModel *model  = modelArray[indexPath.row];
    cell.msgModel = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return scaleY_6(100);
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
    return scaleY_6(10);
}
//section底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, scaleY_6(10))];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return scaleY_6(45);
}
//section头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    msgSectionView *sectionHeadView = [[msgSectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, scaleY_6(45))];
    
    NSMutableArray *modelArray = self.dataArray[section];
    MsgModel *model  = modelArray[0];
    sectionHeadView.msgModel = model;
    return sectionHeadView;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LendViewController *vc = [[LendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}


#pragma mark ----   懒加载  ----
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , KHIGHT - kNavBarHeight) style:UITableViewStyleGrouped];
        _myTableView.dataSource  = self;
        _myTableView.delegate = self;
        _myTableView.backgroundColor = kappMainColor;
        _myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.showsHorizontalScrollIndicator = NO;
        _myTableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
        adjustsScrollViewInsets_NO(_myTableView, self);
        _myTableView.contentInset = UIEdgeInsetsMake(0, 0, kTabBarHeight, 0);
        MsgHeadView *headView = [[MsgHeadView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, scaleY_6(330))];
        headView.borrowBlock = ^{
            LendViewController *vc = [[LendViewController alloc] init];
            [self.navigationController pushViewController:vc animated:true];
        };
        _myTableView.tableHeaderView = headView;
        [_myTableView regsiterCellWithCellClass:[MsgTableViewCell class] isNib:NO];
        
    }
    return _myTableView;
}

@end
