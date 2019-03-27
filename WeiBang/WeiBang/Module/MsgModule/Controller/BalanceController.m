//
//  BalanceController.m
//  WeiBang
//
//  Created by tchzt on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "BalanceController.h"

@interface BalanceController ()

@end

@implementation BalanceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KWhiteColor;
    UIImageView *balanceImageView = [[UIImageView alloc]init];
    balanceImageView.image = [UIImage imageNamed:@"balanceMoney"];
    [self.view addSubview:balanceImageView];
    
    [balanceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(kNavBarHeight);
        make.height.mas_equalTo(scaleY_6(140));
    }];
    
    UILabel *accontText = [[UILabel alloc]init];
    accontText.text = @"可用余额(元)";
    accontText.font = kFontSize6(14);
    [self.view addSubview:accontText];
    [accontText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(balanceImageView.mas_bottom).offset(scaleY_6(20));
    }];
    
    UILabel *accont = [[UILabel alloc]init];
    accont.text = @"0.00";
    accont.font = kBoldFontSize6(25);
    [self.view addSubview:accont];
    [accont mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(accontText.mas_bottom).offset(scaleY_6(10));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
