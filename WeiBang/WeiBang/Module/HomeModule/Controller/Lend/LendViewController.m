//
//  LendViewController.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "LendViewController.h"
#import "LendTableViewCell.h"
#import "LendTitleTableViewCell.h"

@interface LendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIButton *lendButton;
@end

@implementation LendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

-(void)setUI{
    [self setupNavBarTitleViewWithText:@"新手专享自助投"];
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1){
        return 3;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1){
        return scaleX_6(60);
    }
    return scaleX_6(520);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1){
        LendTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LendTitleTableViewCell cellReuseID]];
        [cell setTitleWithIndexPath:indexPath];
        return cell;
    }
    
    LendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[LendTableViewCell cellReuseID]];
    return cell;
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


//---------------------------------懒加载----------
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , KHIGHT) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor colorWithHexString:@"#f2f4f4"];
        adjustsScrollViewInsets_NO(_tableView, self);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, kTabBarHeight+22, 0);
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.001)];
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, scaleX_6(100))];
        footerView.backgroundColor = [UIColor colorWithHexString:@"#f2f4f4"];
        [footerView addSubview:self.lendButton];
        _tableView.tableFooterView = footerView;
        [_tableView registerNib:[UINib nibWithNibName:@"LendTableViewCell" bundle:nil] forCellReuseIdentifier:[LendTableViewCell cellReuseID]];
        [_tableView registerNib:[UINib nibWithNibName:@"LendTitleTableViewCell" bundle:nil] forCellReuseIdentifier:[LendTitleTableViewCell cellReuseID]];
        [self.view addSubview: _tableView];
    }
    return _tableView;
}


-(UIButton *)lendButton{
    if(!_lendButton) {
        _lendButton = [[UIButton alloc] initWithFrame:CGRectMake(scaleX_6(40),scaleX_6(40), KWIDTH-scaleX_6(80), scaleX_6(40))];
        [_lendButton setTitle:@"已抢光" forState:UIControlStateNormal];
        [_lendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _lendButton.backgroundColor = [UIColor lightGrayColor];//37 105 242
        _lendButton.titleLabel.font = [UIFont systemFontOfSize:scaleX(14)];
        _lendButton.layer.cornerRadius = scaleX_6(20);
        _lendButton.clipsToBounds = true;
//        [_lendButton addTarget:self action:@selector(loginFunction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lendButton;
}
@end
