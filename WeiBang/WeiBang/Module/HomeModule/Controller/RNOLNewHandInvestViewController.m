//
//  RNOLNewHandInvestViewController.m
//  RongNiuOnline
//
//  Created by apple on 2018/4/17.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "RNOLNewHandInvestViewController.h"
#import "RNOLNewBidHeader.h"


#import "RNOLInvestDetailListCell.h"
#import "RNOLNewHandInvestModel.h"
#import "OpenAccountViewController.h"

@interface RNOLNewHandInvestViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSDictionary *dataDict;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,copy) NSString *timeStr;
@property (nonatomic,strong) RNOLNewBidHeader *header;

@property (nonatomic,strong) RNOLNewHandInvestModel *NewHandInvestModel;
@end

@implementation RNOLNewHandInvestViewController

- (NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource =[[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (RNOLNewBidHeader *)header{//头部控件
    if (!_header) {
        _header = [RNOLNewBidHeader FromXIB];
        _header.frame = CGRectMake(0, 0, KWIDTH , 350);
    }
    return _header;
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , KHIGHT - 10 - 50) style:UITableViewStyleGrouped];
        _tableView.bounces = NO;
        _tableView.backgroundColor = [UIColor whiteColor];
        adjustsScrollViewInsets_NO(_tableView, self);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView regsiterCellWithCellClass:[RNOLInvestDetailListCell class] isNib:YES];
        _tableView.height -= kBottomHeight;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview: _tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBarTitleViewWithText:@"投资理财"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createmodel];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}


- (void)createmodel{
    self.NewHandInvestModel.projectName = @"项目名称";
    self.NewHandInvestModel.title = @"标题";
    self.NewHandInvestModel.annualRate = @"1.23";
    self.NewHandInvestModel.additionAlannualRate = @"1.234";
    self.NewHandInvestModel.borrowAmount = @"2000";
    self.NewHandInvestModel.restMoney = @"100";
    self.NewHandInvestModel.period = @"30";
    self.NewHandInvestModel.type = @"2";
    self.NewHandInvestModel.projectId = @"1234";
    self.NewHandInvestModel.projectType = @"1";
    self.NewHandInvestModel.repayType = @"1";
    self.NewHandInvestModel.restTime = @"1";
    self.NewHandInvestModel.days = @"1";
    self.NewHandInvestModel.isNewInvestorOnly = @"1";
    self.NewHandInvestModel.status = @"1";
    self.NewHandInvestModel.projectType = @"1";
    [self setup];
}

- (void)setup{
    
    //
    self.timeStr = self.NewHandInvestModel.restTime;
    self.dataDict = @{
                      @"0" : @[@"项目名称",@"项目类型",@"起息时间",@"剩余时间",@"协       议",@"温馨提示"],
                      @"1" : @[@"产品详情",@"投标记录"]
                      };

    
    self.tableView.tableHeaderView = self.header;
    [self.tableView reloadData];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, KHIGHT - 10 - 50, KWIDTH , 50)];
    bottomView.y -= kBottomHeight;
    bottomView.backgroundColor =  [UIColor whiteColor];;
    [self.view addSubview: bottomView];
    
    UIButton *immediatelyLoanBtn = [self createRNOLStyleBlueButtonWithButtonTitle:@"立即投资"];
    immediatelyLoanBtn.x = 50;
    immediatelyLoanBtn.width = KWIDTH - 100;
    immediatelyLoanBtn.height = 50;
    immediatelyLoanBtn.y = 0;
    [immediatelyLoanBtn addTarget:self action:@selector(immediatelyLoanAction) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview: immediatelyLoanBtn];
    
}

//蓝色长条按钮 需要重新设置origin
- (UIButton *)createRNOLStyleBlueButtonWithButtonTitle:(NSString *)title {
    UIButton *button = [self createRNOLStyleButtonWithButtonTitle: title backgroundColor: kappMainGreen cornerRadius:0];
    return button;
}

//自定义颜色长条按钮 需要重新设置origin
- (UIButton *)createRNOLStyleButtonWithButtonTitle:(NSString *)title backgroundColor:(UIColor *)bgColor cornerRadius:(
                                                                                                                      CGFloat)radius{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle: title  forState:UIControlStateNormal];
    [button setTitle: title forState: UIControlStateHighlighted];
    [button setBackgroundColor: bgColor forState: UIControlStateNormal];
    button.titleLabel.font = KFontSize(17);
    button.frame = CGRectMake(0, 0, KWIDTH, 50);
    [button setAllCorner: radius];
    return button;
}


#pragma mark- 立即借款
- (void)immediatelyLoanAction{
    OpenAccountViewController *rechargeInfor = [[OpenAccountViewController alloc]init];
    
    [self.navigationController pushViewController:rechargeInfor animated:YES];
}

#pragma mark -  UITableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataDict.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *items = self.dataDict[@(section).stringValue];
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *items = self.dataDict[@(indexPath.section).stringValue];
    RNOLInvestDetailListCell *cell = [tableView dequeueReusableCellWithIdentifier:RNOLInvestDetailListCell.cellReuseID];
    if (indexPath.row == 0) {
        cell.valueLabel.text = self.NewHandInvestModel.projectName;
    }else if (indexPath.row == 1){
        cell.valueLabel.text = @"票据标";
    }else if (indexPath.row == 2){
        cell.valueLabel.text = @"满标后当日起息";
    }else if (indexPath.row == 3){
        cell.valueLabel.text = @"2天1小时";
    }else if (indexPath.row == 4){
        cell.valueLabel.text = @"《借款协议》";
    }else if (indexPath.row == 5){
        cell.valueLabel.text = @"新手专享3次投资,累计限额5万元";
    }
    
    cell.nameLabel.text = items[indexPath.row];
    cell.bottomLineView.hidden = cell.rightArrowImageView.hidden = !indexPath.section;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section? 44 : 35;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    return [RNOLUnitTool createViewWithBackgroundColor:[UIColor whiteColor]];
    return [UIView new];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *items = self.dataDict[@(indexPath.section).stringValue];
    NSString *title = items[indexPath.row];
    if (kCompareTwoString(title,@"产品详情")) {
        
    }else if (kCompareTwoString(title, @"投标记录")){

    }else if (kCompareTwoString(title, @"协       议")){
    }

}


@end
