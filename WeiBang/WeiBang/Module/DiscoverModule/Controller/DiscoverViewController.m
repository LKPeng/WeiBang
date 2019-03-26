//
//  DiscoverViewController.m
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "DiscoverViewController.h"
#import "CopyrightTipLabel.h"
#import "DiscoverTableViewCell.h"
#import "DiscoverHeaderView.h"

@interface DiscoverViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) DiscoverHeaderView *headerView;
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

-(void)setUI{
    [self setupNavBarTitleViewWithText:@"精彩"];
    [self.view addSubview:self.tableView];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return scaleX(80);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DiscoverTableViewCell cellReuseID]];
    [cell setDataWithIndexpath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , KHIGHT) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor colorWithHexString:@"#f2f4f4"];
        adjustsScrollViewInsets_NO(_tableView, self);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, kTabBarHeight+22, 0);
        self.headerView = [[DiscoverHeaderView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, scaleX(290))];
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerNib:[UINib nibWithNibName:@"DiscoverTableViewCell" bundle:nil] forCellReuseIdentifier:[DiscoverTableViewCell cellReuseID]];
        [self.view addSubview: _tableView];
    }
    return _tableView;
}

@end
