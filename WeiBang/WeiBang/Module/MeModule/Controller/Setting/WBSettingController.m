//
//  WBSettingController.m
//  WeiBang
//
//  Created by tchzt on 2019/2/18.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "WBSettingController.h"

#import "WBSettingCell.h"

#import "GestureViewController.h"

@interface WBSettingController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataSource;
@end

@implementation WBSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    self.view.backgroundColor = kappMainColor;
    self.dataSource = @[@"修改密码",@"设置/修改手势密码",@"是否愿意被打扰",@"隐私",@"切换语言",@"关于我们"];
    [self.tableView reloadData];
    
    [self setupNavBarTitleViewWithText:@"设置"];
}

#pragma mark -  UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WBSettingCell *cell = [tableView dequeueReusableCellWithIdentifier: [WBSettingCell cellReuseID]];
    if (indexPath.row == 0) {
        cell.type = SettingPassWord;
        cell.titleLabel.text = self.dataSource[indexPath.row];
    }else if (indexPath.row == 1){
        cell.type = SettingPassWord;
        cell.titleLabel.text = self.dataSource[indexPath.row];
    }else if (indexPath.row == 2){
        cell.type = SettingSwich;
        cell.titleLabel.text = self.dataSource[indexPath.row];
    }else{
        cell.type = SettingNormal;
        cell.titleLabel.text = self.dataSource[indexPath.row];
    }
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *title = self.dataSource[indexPath.row];
    if (kCompareTwoString(title, @"设置/修改手势密码")) {
        GestureViewController *gestureVc = [[GestureViewController alloc] init];
        gestureVc.type = GestureViewControllerTypeSetting;
        [self.navigationController pushViewController:gestureVc animated:YES];
    }else if (kCompareTwoString(title, @"当面邀友")) {
        
    }else if (kCompareTwoString(title, @"分享邀友")) {
    }
}


#pragma mark ----   懒加载  ----

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , KHIGHT - kNavBarHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        adjustsScrollViewInsets_NO(_tableView, self);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 60;
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , 0.001)];
        _tableView.tableHeaderView = headerView;
        _tableView.tableFooterView = [UIView new];
        [_tableView regsiterCellWithCellClass:[WBSettingCell class] isNib:NO];
        [self.view addSubview: _tableView];
    }
    return _tableView;
}


@end
