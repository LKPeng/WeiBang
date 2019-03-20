//
//  MoreViewController.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/18.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreTableViewCell.h"
#import "MyWebViewController.h"
#import "OpenAccountViewController.h"
#import "NothingViewController.h"

@interface MoreViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIButton *logoutButton;
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup{
    
    [self setupNavBarTitleViewWithText:@"更多"];
    self.view.backgroundColor = kappMainColor;
    [self.tableView reloadData];
    self.tabBarController.tabBar.hidden = NO;
}


-(void)setFunction{
    //    SetViewController *vc = [[SetViewController alloc] init];
    //    [self.navigationController pushViewController:vc animated:true];
}

- (void)settingBack{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要退出登录吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancelAc = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击取消要执行的代码
    }];
    UIAlertAction *comfirmAc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击确定要执行的代码
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"user_login"];
        [MBProgressHUD showMessage:@"退出成功"];
    }];
    [alertVC addAction:cancelAc];
    [alertVC addAction:comfirmAc];
    [self presentViewController:alertVC animated:YES completion:nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return scaleX(42);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return scaleX(8);
}

//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001f;//section头部高度
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
    MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MoreTableViewCell cellReuseID]];
    [cell setDataWithIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1 && indexPath.section == 1) {
        MyWebViewController *vc = [[MyWebViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    }else if (indexPath.section == 1 && indexPath.row == 0){
        OpenAccountViewController *vc = [[OpenAccountViewController alloc] initWithNibName:@"OpenAccountViewController" bundle:nil];
        [self.navigationController pushViewController:vc animated:true];
    }else{
        NothingViewController *vc = [[NothingViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    }
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
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.001)];
        _tableView.tableFooterView = [UIView new];
        _tableView.scrollEnabled = false;
        _tableView.contentInset = UIEdgeInsetsMake(kNavBarHeight+8, 0, 0, 0);
        [_tableView regsiterCellWithCellClass:[MoreTableViewCell class] isNib:NO];
        
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, scaleX(62))];
        footerView.backgroundColor = [UIColor colorWithHexString:@"#f2f4f4"];;
        [footerView addSubview:self.logoutButton];
        _tableView.tableFooterView = footerView;
        
        [self.view addSubview: _tableView];
    }
    return _tableView;
}

- (UIButton *)logoutButton{
    if (!_logoutButton){
        _logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(scaleX(10), scaleX(20), KWIDTH-scaleX(20), scaleX(50))];
        [_logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_logoutButton setBackgroundColor:[UIColor colorWithHexString:@"#2A890B"] forState:UIControlStateNormal];
        _logoutButton.layer.cornerRadius = scaleX(6);
        _logoutButton.clipsToBounds = true;
        [_logoutButton addTarget:self action:@selector(settingBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutButton;
}

@end
