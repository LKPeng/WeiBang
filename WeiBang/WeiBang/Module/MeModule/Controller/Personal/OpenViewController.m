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


@property (nonatomic,strong) UIButton *logoutButton;
@end

@implementation OpenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBarTitleViewWithText:@"充值"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myTableView];
}



- (void)settingBack{
    
    
    NSIndexPath *indexPath0 = [NSIndexPath indexPathForRow:0 inSection:0];
    OpenCell *cell0 =(OpenCell *)[self.myTableView cellForRowAtIndexPath:indexPath0];
    
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:1 inSection:0];
    OpenCell *cell1 =(OpenCell *)[self.myTableView cellForRowAtIndexPath:indexPath1];
    
    NSIndexPath *indexPath2 = [NSIndexPath indexPathForRow:0 inSection:1];
    OpenCell *cell2 =(OpenCell *)[self.myTableView cellForRowAtIndexPath:indexPath2];
    
    NSIndexPath *indexPath3 = [NSIndexPath indexPathForRow:1 inSection:1];
    OpenCell *cell3 =(OpenCell *)[self.myTableView cellForRowAtIndexPath:indexPath3];
    
    NSLog(@"cell0 - %@",cell0.open.text);
    NSLog(@"cell1 - %@",cell1.open.text);
    NSLog(@"cell2 - %@",cell2.open.text);
    NSLog(@"cell3 - %@",cell3.open.text);
    
    if (cell0.open.text.length == 0) {
        [MBProgressHUD showMessage:@"请输入姓名"];
        return;
    }
    if (cell1.open.text.length == 0) {
        [MBProgressHUD showMessage:@"请输入证件号码"];
        return;
    }
    if (cell2.open.text.length == 0) {
        [MBProgressHUD showMessage:@"请输入卡号"];
        return;
    }
    
    if (cell3.open.text.length == 0) {
        [MBProgressHUD showMessage:@"请输入手机号"];
        return;
    }
    
    [self.view endEditing:YES];
    
    
    [MBProgressHUD showMessage:@"敬请期待..."];
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
        
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, scaleX(62))];
        footerView.backgroundColor = [UIColor colorWithHexString:@"#f2f4f4"];;
        [footerView addSubview:self.logoutButton];
        _myTableView.tableFooterView = footerView;
        
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.showsHorizontalScrollIndicator = NO;
        _myTableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
        
        UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, scaleY_6(60))];
        _myTableView.tableHeaderView = headView;
        
        [_myTableView regsiterCellWithCellClass:[OpenCell class] isNib:NO];
    }
    return _myTableView;
}

- (UIButton *)logoutButton{
    if (!_logoutButton){
        _logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(scaleX(10), scaleX(20), KWIDTH-scaleX(20), scaleX(45))];
        [_logoutButton setTitle:@"立即充值" forState:UIControlStateNormal];
        [_logoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_logoutButton setBackgroundColor:kappMainRed forState:UIControlStateNormal];
        _logoutButton.layer.cornerRadius = scaleX(6);
        _logoutButton.clipsToBounds = true;
        adjustsScrollViewInsets_NO(_myTableView, self);
        [_logoutButton addTarget:self action:@selector(settingBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutButton;
}

@end
