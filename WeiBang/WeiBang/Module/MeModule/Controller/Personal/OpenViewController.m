//
//  OpenViewController.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "OpenViewController.h"
#import "OpenCell.h"
#import "OpenSectionView.h"

@interface OpenViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *myTableView;

@end

@implementation OpenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myTableView];
}


#pragma mark -  UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    OpenCell *cell = [tableView dequeueReusableCellWithIdentifier:[OpenCell cellReuseID]];
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.open.placeholder = @"请输入本人姓名,核实后不可修改";
    }else if (indexPath.section == 0 && indexPath.row == 1){
        cell.open.placeholder = @"请输入本人证件号码,核实后不可修改";
    }else if (indexPath.section == 1 && indexPath.row == 0){
        cell.open.placeholder = @"请输入本人储存卡卡号";
    }else if (indexPath.section == 1 && indexPath.row == 1){
        cell.open.placeholder = @"请输入银行预留手机号";
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return scaleY_6(70);
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
    
    return scaleY_6(30);
}
//section头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    OpenSectionView *sectionHeadView = [[OpenSectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, scaleY_6(30))];
    if (section == 0) {
        sectionHeadView.title.text = @"证件信息";
    }else{
        sectionHeadView.title.text = @"银行卡信息";
    }
    return sectionHeadView;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}


#pragma mark ----   懒加载  ----

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
        
        UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, scaleY_6(80))];
        _myTableView.tableHeaderView = headView;
        
        [_myTableView regsiterCellWithCellClass:[OpenCell class] isNib:NO];
    }
    return _myTableView;
}

@end
