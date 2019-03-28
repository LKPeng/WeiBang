//
//  MeViewController.m
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MeViewController.h"
#import "MeAccountTableViewCell.h"
#import "MeItemTableViewCell.h"
#import "HTLoginViewController.h"
#import "WBNavigantionController.h"
#import "NothingViewController.h"
#import "OpenViewController.h"
#import "SettingController.h"
#import "BalanceController.h"
#import "PersonalController.h"
#import "MyWebViewController.h"

@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UIButton *loginButton;
@property (nonatomic,strong) UIButton *openAccountButton;
@end

@implementation MeViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去掉导航栏底部的黑线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    if ([self isUserLogin]){
        [self.loginButton removeFromSuperview];
        [self.headerView addSubview:self.openAccountButton];
    }else{
        [self.openAccountButton removeFromSuperview];
        [self.headerView addSubview:self.loginButton];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setItem];
}

-(BOOL)isUserLogin{
    NSString * longinBool = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_login"];
    BOOL islogin = YES;
    if ([longinBool isEqualToString:@"YES"]) {
        islogin = YES;
    }else{
        islogin = NO;
    }
    return islogin;
}

-(void)setUI{
    [self.view addSubview:self.tableView];
}

-(void)setItem{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 30, 30);
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    UIImage *leftButtonImg = [UIImage imageNamed:@"set"];
    [leftButton setImage: leftButtonImg
                forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(setUpFunction) forControlEvents:UIControlEventTouchUpInside];
    // 修改导航栏左边的item
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    
    
    UIButton *leftButton0 = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton0.frame = CGRectMake(0, 0, 30, 30);
    leftButton0.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    UIImage *leftButtonImg0 = [UIImage imageNamed:@"gerenxinxi"];
    [leftButton0 setImage: leftButtonImg0
                forState:UIControlStateNormal];
    [leftButton0 addTarget:self action:@selector(setUpFunctionUp) forControlEvents:UIControlEventTouchUpInside];
    // 修改导航栏左边的item
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton0];
    
}

- (void)setUpFunctionUp{
    PersonalController *open = [[PersonalController alloc]init];
    [self.navigationController pushViewController:open animated:YES];
}

-(void)setUpFunction{
    SettingController *open = [[SettingController alloc]init];
    [self.navigationController pushViewController:open animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return scaleX(50);
    }
    return 160;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MeAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MeAccountTableViewCell cellReuseID]];
        return cell;
    }else{
        MeItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MeItemTableViewCell cellReuseID]];
        cell.yhqBlock = ^{
            if (![self isUserLogin]){
                [self loginFunction];
            }else{
                NothingViewController *vc = [[NothingViewController alloc] init];
                vc.titleText = @"优惠券";
                [self.navigationController pushViewController:vc animated:true];
            }
        };
        cell.yhkBlock = ^{
            if (![self isUserLogin]){
                [self loginFunction];
            }else{
                BalanceController *balance = [[BalanceController alloc]init];
                [self.navigationController pushViewController:balance animated:YES];
            }
        };
        cell.wdjfBlock = ^{
            if (![self isUserLogin]){
                [self loginFunction];
            }else{
                NothingViewController *vc = [[NothingViewController alloc] init];
                vc.titleText = @"我的积分";
                [self.navigationController pushViewController:vc animated:true];
            }
        };
        cell.gywmBlock = ^{
            if (![self isUserLogin]){
                [self loginFunction];
            }else{
                MyWebViewController *vc = [[MyWebViewController alloc] init];
                [self.navigationController pushViewController:vc animated:true];
            }
        };
        cell.kfzxBlock = ^{
            if (![self isUserLogin]){
                [self loginFunction];
            }
        };
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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

//---------------事件-----------------

-(void)loginFunction{
    HTLoginViewController *vc = [HTLoginViewController new];
    [self.navigationController pushViewController:vc animated:true];
}

//---------------------------------懒加载----------
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , KHIGHT) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor colorWithHexString:@"#f2f4f4"];
        adjustsScrollViewInsets_NO(_tableView, self);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, kTabBarHeight+22, 0);
        //        self.headerView = [[DiscoverHeaderView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, scaleX(290))];
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerNib:[UINib nibWithNibName:@"MeAccountTableViewCell" bundle:nil] forCellReuseIdentifier:[MeAccountTableViewCell cellReuseID]];
        [_tableView registerNib:[UINib nibWithNibName:@"MeItemTableViewCell" bundle:nil] forCellReuseIdentifier:[MeItemTableViewCell cellReuseID]];
        [self.view addSubview: _tableView];
    }
    return _tableView;
}

-(UIView *)headerView{
    if(!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH,KHIGHT*0.4)];
        _headerView.backgroundColor = [UIColor whiteColor];
        
        UILabel * tip = [[UILabel alloc] initWithFrame:CGRectMake(0, KHIGHT*0.4-scaleX(30), KWIDTH, scaleX(20))];
        tip.text = @"专注小额借贷的网贷投资平台";
        tip.textColor = [UIColor lightGrayColor];
        tip.font = [UIFont systemFontOfSize:scaleX(8)];
        tip.textAlignment = NSTextAlignmentCenter;
        [_headerView addSubview:tip];
        
        UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"me_bg_icon1"]];
        imageView1.frame = CGRectMake(0, scaleX(40), KWIDTH, KHIGHT*0.4-scaleX(36));
        imageView1.contentMode = UIViewContentModeScaleAspectFit;
        [_headerView addSubview:imageView1];
        UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"me_bg_icon2"]];
        imageView2.frame = CGRectMake(KWIDTH*0.3, 0, KWIDTH*0.4, KHIGHT*0.4-scaleX(110));
        imageView2.contentMode = UIViewContentModeScaleAspectFit;
        [_headerView addSubview:imageView2];
    }
    return _headerView;
}

-(UIButton *)loginButton{
    if(!_loginButton) {
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(scaleX(40),KHIGHT*0.4-scaleX(70), KWIDTH-scaleX(80), scaleX(36))];
        [_loginButton setTitle:@"注册/登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.backgroundColor = [UIColor colorWithHexString:@"#2569F2"];//37 105 242
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:scaleX(13)];
        _loginButton.layer.cornerRadius = scaleX(18);
        _loginButton.clipsToBounds = true;
        [_loginButton addTarget:self action:@selector(loginFunction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}
-(UIButton *)openAccountButton{
    if(!_openAccountButton) {
        _openAccountButton = [[UIButton alloc] initWithFrame:CGRectMake(scaleX(40),KHIGHT*0.4-scaleX(70), KWIDTH-scaleX(80), scaleX(36))];
        [_openAccountButton setTitle:@"立即开通存管账户" forState:UIControlStateNormal];
        [_openAccountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _openAccountButton.backgroundColor = [UIColor colorWithHexString:@"#2569F2"];//37 105 242
        _openAccountButton.titleLabel.font = [UIFont systemFontOfSize:scaleX(13)];
        _openAccountButton.layer.cornerRadius = scaleX(18);
        _openAccountButton.clipsToBounds = true;
        //        [_openAccountButton addTarget:self action:@selector(loginFunction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openAccountButton;
}
@end






