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

@interface HomeViewController ()
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
    
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = [UIColor lightGrayColor];
    headView.layer.cornerRadius = 30;
    headView.layer.masksToBounds = YES;
    [self.view addSubview:headView];
    self.headView = headView;
    
    self.view.backgroundColor = KWhiteColor;
    
    HomeView *home = [[HomeView alloc]init];
    home.borrowBlock = ^{
        LendViewController *vc = [[LendViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    };
    
    [self.view addSubview:home];
    
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(scaleX_6(330));
        make.height.mas_equalTo(scaleY_6(60));
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view).offset(scaleY_6(30) + kNavBarHeight);
    }];
    
    [home mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(scaleY_6(250));
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(scaleY_6(100)+kNavBarHeight);
    }];
    
    UILabel *pingLable = [[UILabel alloc]init];
    pingLable.text = @"专注小额借贷的网贷投资平台";
    pingLable.font = kFontSize6(17);
    [self.view addSubview:pingLable];
    
    [pingLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headView.mas_top).offset(scaleY_6(20));
        make.height.mas_equalTo(scaleY_6(20));
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    
    UILabel *pTextLable = [[UILabel alloc]init];
    pTextLable.text = @"专注小额借贷的网贷投资平台 用户量持续飙升";
    pTextLable.font = kFontSize6(12);
    [self.view addSubview:pTextLable];
    
    [pTextLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(home.mas_bottom).offset(scaleY_6(10));
        make.height.mas_equalTo(scaleY_6(20));
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
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
@end

