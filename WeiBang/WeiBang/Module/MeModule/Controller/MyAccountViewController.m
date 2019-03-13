//
//  MyAccountViewController.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MyAccountViewController.h"
#import "AccountOperationTableViewCell.h"
#import "AccountItemTableViewCell.h"
#import "MyAccountHeaderView.h"
#import "OpenAccountViewController.h"

@interface MyAccountViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation MyAccountViewController

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
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - scaleX_6(80))/2, kStatusBarHeight, scaleX_6(80), scaleY_6(44))];
    titleLable.textColor = [UIColor whiteColor];
    titleLable.font = KFontSize(17);
    titleLable.text = @"我的账户";
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:titleLable];
    
    UIButton *settingBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - scaleX_6(40) -scaleX_6(10), kStatusBarHeight, scaleX_6(40), scaleX_6(40))];
    [settingBtn setImage:[UIImage imageNamed:@"设置"] forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:settingBtn];
}


- (void)settingBtnClick{
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return 3;
    }else if (section == 2) {
        return 2;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 || indexPath.section == 2) {
        return scaleX(49);
    }
    return scaleX(50);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return scaleX(8);
}

//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;//section头部高度
}
//section底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]initWithFrame:CGRectZero];
    header.backgroundColor = [UIColor colorWithHexString:@"f2f2f4"];
    return header;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        AccountOperationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: [AccountOperationTableViewCell cellReuseID]];
        cell.rechargeBlock = ^{
            OpenAccountViewController *vc = [[OpenAccountViewController alloc] initWithNibName:@"OpenAccountViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:true];
        };
        cell.withdrawBlock = ^{
            OpenAccountViewController *vc = [[OpenAccountViewController alloc] initWithNibName:@"OpenAccountViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:true];
        };
        return cell;
    }
    AccountItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[AccountItemTableViewCell cellReuseID]];
    [cell setDataWithIndexPath:indexPath];
    return cell;
}


#pragma mark ----   懒加载  ----
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , KHIGHT) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor colorWithHexString:@"#f2f4f4"];
        adjustsScrollViewInsets_NO(_tableView, self);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = false;
        MyAccountHeaderView *headerView = [[MyAccountHeaderView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , scaleY(120) + kNavBarHeight)];
        _tableView.tableHeaderView = headerView;
        _tableView.tableFooterView = [UIView new];
        [_tableView regsiterCellWithCellClass:[AccountOperationTableViewCell class] isNib:NO];
        [_tableView regsiterCellWithCellClass:[AccountItemTableViewCell class] isNib:NO];
        [self.view addSubview: _tableView];
    }
    return _tableView;
}
@end


