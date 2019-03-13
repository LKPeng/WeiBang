//
//  SetViewController.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/13.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "SetViewController.h"
#import "SetTableViewCell.h"
#import "IntroduceViewController.h"

@interface SetViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIButton *quitButton;
@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup{
    self.title = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = true;
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return scaleX(40);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SetTableViewCell cellReuseID]];
    [cell setTitleWithRow:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    IntroduceViewController *vc = [[IntroduceViewController alloc] initWithNibName:@"IntroduceViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:true];
}

#pragma mark ----   懒加载  ----
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , KHIGHT) style:UITableViewStyleGrouped];
        adjustsScrollViewInsets_NO(_tableView, self);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView regsiterCellWithCellClass:[SetTableViewCell class] isNib:YES];
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , 0.001)];
        _tableView.tableHeaderView = headerView;
        UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, -0, KWIDTH, scaleX(150))];
        footer.backgroundColor = kappMainColor;
        [footer addSubview:self.quitButton];
        _tableView.tableFooterView = footer;
        [self.view addSubview: _tableView];
    }
    return _tableView;
}

-(UIButton *)quitButton {
    if (!_quitButton) {
        _quitButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 60, KWIDTH-20, 50)];
        [_quitButton setTitle:@"退出登录" forState:UIControlStateNormal];
        [_quitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _quitButton.backgroundColor = [UIColor redColor];
        _quitButton.layer.cornerRadius = 6;
        _quitButton.clipsToBounds = true;
        [_quitButton addTarget:self action:@selector(quitfunction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _quitButton;
}

-(void)quitfunction{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要退出登录吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancelAc = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击取消要执行的代码
    }];
    UIAlertAction *comfirmAc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击确定要执行的代码
    }];
    [alertVC addAction:cancelAc];
    [alertVC addAction:comfirmAc];
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end
