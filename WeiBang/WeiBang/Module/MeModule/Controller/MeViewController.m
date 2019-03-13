//
//  MeViewController.m
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MeViewController.h"

#import "MeHeadView.h"
#import "MeHeadCell.h"
#import "MeTableViewCell.h"
#import "MeBannerCell.h"
#import "MeCoinCell.h"

#import "WBSettingController.h"

@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) NSArray *bannerSource;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    self.view.backgroundColor = kappMainColor;
    self.bannerSource = @[@"我的关注",@"我的订单",@"我的推荐",@"我的收藏"];
    self.dataSource = @[@"我的关注",@"我的订单",@"我的推荐",@"投诉反馈",@"在线客服",@"设置"];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark -  UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count + 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MeHeadCell *cell = [tableView dequeueReusableCellWithIdentifier: [MeHeadCell cellReuseID]];
        return cell;
    }else if (indexPath.row == 1){
        MeCoinCell *cell = [tableView dequeueReusableCellWithIdentifier: [MeCoinCell cellReuseID]];
        cell.accountLabel.text = @"123456";
        return cell;
    }else if (indexPath.row == 2){
        MeBannerCell *cell = [tableView dequeueReusableCellWithIdentifier: [MeBannerCell cellReuseID]];
        return cell;
    }else{
        MeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: [MeTableViewCell cellReuseID]];
        cell.titleLabel.text = self.dataSource[indexPath.row - 3];
        return cell;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return scaleY(80);
    }else if (indexPath.row == 2){
        return scaleY(90);
    }else{
        return 60;
    }
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
    NSString *title = self.dataSource[indexPath.row - 3];
    if (kCompareTwoString(title, @"设置")) {
        WBSettingController *setting = [[WBSettingController alloc]init];
        [self.navigationController pushViewController:setting animated:YES];
        
    }else if (kCompareTwoString(title, @"当面邀友")) {
        
    }else if (kCompareTwoString(title, @"分享邀友")) {
    }
}


#pragma mark ----   懒加载  ----

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , KHIGHT) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        adjustsScrollViewInsets_NO(_tableView, self);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 60;
        MeHeadView *headerView = [[MeHeadView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , scaleY(100))];
        _tableView.tableHeaderView = headerView;
        _tableView.tableFooterView = [UIView new];
        [_tableView regsiterCellWithCellClass:[MeHeadCell class] isNib:NO];
        [_tableView regsiterCellWithCellClass:[MeTableViewCell class] isNib:NO];
        [_tableView regsiterCellWithCellClass:[MeBannerCell class] isNib:NO];
        [_tableView regsiterCellWithCellClass:[MeCoinCell class] isNib:NO];
        [self.view addSubview: _tableView];
    }
    return _tableView;
}



@end






