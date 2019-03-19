//
//  HomeController.m
//  WeiBang
//
//  Created by tchzt on 2019/3/18.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "HomeController.h"

#import "PlanADScrollView.h"
#import "HomeProgressCell.h"
#import "HomeFootView.h"
#import "HomeModel.h"

@interface HomeController ()<UITableViewDelegate,UITableViewDataSource,PlanADScrollViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property(strong,nonatomic) PlanADScrollView *bannerView;

@property(strong,nonatomic) HomeFootView *homeFootView;

@property (nonatomic, strong) NSMutableArray<HomeModel *> *HomeModels;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self createItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup{
    
    UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    itemButton.frame = CGRectMake(0, 0, 30, 30);
    itemButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    UIImage *leftButtonImg = [UIImage imageNamed:@"message.png"];
    [itemButton setImage: leftButtonImg
                forState:UIControlStateNormal];
    [itemButton addTarget:self action:@selector(messageFunction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemButton];
    
    self.view.backgroundColor = kappMainColor;
    self.automaticallyAdjustsScrollViewInsets = true;
    [self.tableView reloadData];
    
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [cancleButton setTitle:@"公告" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(cancleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:cancleButton];
    rightItem.imageInsets = UIEdgeInsetsMake(0, -15,0, 0);//设置向左偏移
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark ----   数据  ----

- (void)createItem{
    HomeModel *model1 = [[HomeModel alloc]init];
    model1.moneyTerm = @"银票通30天";
    model1.Progress = 0.0838;
    model1.term = 30;
    model1.total = 47000.00;
    model1.startAccount = 1000;
    [self.HomeModels addObject:model1];
    self.homeFootView.model = model1;
}
#pragma mark ----   点击  ----

//- (void)cancleButtonClicked{
//    NewsBulletinControllerViewController *invest = [[NewsBulletinControllerViewController alloc]init];
//    [self.navigationController pushViewController:invest animated:YES];
//}


#pragma mark ----   PlanADScrollViewDelegate  ----

- (void)PlanADScrollViewdidSelectAtIndex:(NSInteger)index{
    
}


#pragma mark ----   UITableViewDelegate  ----

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return scaleY_6(280);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeProgressCell *cell = [tableView dequeueReusableCellWithIdentifier:[HomeProgressCell cellReuseID]];
    cell.model = self.HomeModels[indexPath.row];
    return cell;
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
//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
//section底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.001)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.001;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.001)];
    return sectionHeadView;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}


#pragma mark ----   懒加载  ----
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , KHIGHT) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor colorWithHexString:@"#f2f4f4"];
        adjustsScrollViewInsets_NO(_tableView, self);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, kTabBarHeight+22, 0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = self.bannerView;
        _tableView.tableFooterView = self.homeFootView;
        [_tableView regsiterCellWithCellClass:[HomeProgressCell class] isNib:NO];
        [self.view addSubview: _tableView];
    }
    return _tableView;
}

- (PlanADScrollView *)bannerView{
    if (!_bannerView) {
        NSArray *imageUrl1s = @[@"1.jpg",@"2.jpg",@"3.jpg"];
        _bannerView =[[PlanADScrollView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, scaleX(140))imageUrls:imageUrl1s placeholderimage:nil];
        _bannerView.delegate = self;
        _bannerView.pageContolStyle = PlanPageContolStyleNone;
    }
    return _bannerView;
}

- (HomeFootView *)homeFootView{
    if (!_homeFootView) {
        _homeFootView = [[HomeFootView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, scaleX(100))];
    }
    return _homeFootView;
}

- (NSMutableArray<HomeModel *> *)HomeModels{
    if (!_HomeModels) {
        _HomeModels = [[NSMutableArray alloc]init];
    }
    return _HomeModels;
}
@end



