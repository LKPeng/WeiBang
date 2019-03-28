//
//  HomeViewController.m
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "HomeViewController.h"
#import "LendViewController.h"
#import "HomeView.h"
#import "HomeCell.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *myTableView;
/* 设备 */
@property (weak, nonatomic) UIView *headView;

/* 设备 */
@property (strong, nonatomic) UILabel *tipLabel;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

-(void)setUI{
    [self.view addSubview:self.myTableView];
    
    UIView *head =  [[UIView alloc]init];
    head.backgroundColor = KWhiteColor;
    
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = RGB(221, 230, 240);
    headView.layer.cornerRadius = 30;
    headView.layer.masksToBounds = YES;
    headView.frame = CGRectMake((KWIDTH - scaleX_6(330))/2, scaleY_6(30), scaleX_6(330), scaleY_6(60));
    [head addSubview:headView];


    self.view.backgroundColor = KWhiteColor;

    HomeView *home = [[HomeView alloc]init];
    home.borrowBlock = ^{
        LendViewController *vc = [[LendViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    };
    home.frame = CGRectMake(0, CGRectGetMaxY(headView.frame) + scaleY_6(20), KWIDTH, scaleY_6(250));
    [head addSubview:home];


    UILabel *pingLable = [[UILabel alloc]init];
    pingLable.text = @"专注小额借贷的网贷投资平台";
    pingLable.font = kFontSize6(17);
    pingLable.textAlignment = NSTextAlignmentCenter;
    [head addSubview:pingLable];
    pingLable.frame = CGRectMake((KWIDTH - scaleX_6(330))/2, scaleY_6(45), scaleX_6(330), scaleY_6(30));
//    pingLable.frame = CGRectMake(0, CGRectGetMaxY(home.frame) + scaleY_6(15), KWIDTH, scaleY_6(30));

    
    self.headView = head;
    head.frame = CGRectMake(0, 0, KWIDTH, scaleY_6(430));
    _myTableView.tableHeaderView = head;
    
    

    UILabel *pTextLable = [[UILabel alloc]init];
    pTextLable.textAlignment = NSTextAlignmentCenter;
    pTextLable.text = @"专注小额借贷的网贷投资平台 用户量持续飙升";
    pTextLable.font = kFontSize6(12);
    [head addSubview:pTextLable];

    pTextLable.frame = CGRectMake(0, CGRectGetMaxY(home.frame) + scaleY_6(15), KWIDTH, scaleY_6(30));

    [self.view addSubview:self.tipLabel];
}

- (UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.view.height - 15 - kTabBarHeight, KWIDTH, 15)];
        _tipLabel.textColor = [UIColor lightGrayColor];
        _tipLabel.font = [UIFont systemFontOfSize:scaleX_6(10)];
        _tipLabel.text = @"出借有风险，选择需谨慎 风险提示";
        _tipLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tipLabel;
}


- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}



#pragma mark -  UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:[HomeCell cellReuseID]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return scaleY_6(130);
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
    
    return [UIView new];
}
//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.001;
}
//section头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    BalanceController *balance = [[BalanceController alloc]init];
//    [self.navigationController pushViewController:balance animated:YES];
}


#pragma mark ----   懒加载  ----

- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , KHIGHT - kNavBarHeight) style:UITableViewStyleGrouped];
        _myTableView.dataSource  = self;
        _myTableView.delegate = self;
        _myTableView.backgroundColor = KWhiteColor;
        _myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.showsHorizontalScrollIndicator = NO;
        _myTableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
        
        [_myTableView regsiterCellWithCellClass:[HomeCell class] isNib:NO];
    }
    return _myTableView;
}
@end

