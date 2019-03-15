//
//  MyInvestmentSubController.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/15.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MyInvestmentSubController.h"
#import "MyInvestmentView.h"

@interface MyInvestmentSubController ()

@end

@implementation MyInvestmentSubController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(238, 238, 238);
    
    MyInvestmentView *investView = [[MyInvestmentView alloc]init];
    investView.backgroundColor = [UIColor whiteColor];
    investView.imageView.image = [UIImage imageNamed:@"me_aboutus"];
    investView.titleLabel.text = @"待汇款本金";
    investView.instructionLabel.text = @"0";
    [self.view addSubview:investView];
    
    CGFloat width = (SCREEN_WIDTH - scaleX_6(10)*3)/2;
    [investView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(scaleX(10));
        make.size.mas_equalTo(CGSizeMake(width, scaleY(60)));
        make.top.mas_equalTo(self.view.mas_top).offset(scaleY_6(150));
    }];
    
    
    MyInvestmentView *investView1 = [[MyInvestmentView alloc]init];
    investView1.backgroundColor = [UIColor whiteColor];
    investView1.imageView.image = [UIImage imageNamed:@"me_recommend"];
    investView1.titleLabel.text = @"待汇款利息";
    investView1.instructionLabel.text = @"0";
    [self.view addSubview:investView1];
    
    [investView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(investView.mas_right).offset(scaleX(10));
        make.size.mas_equalTo(CGSizeMake(width, scaleY(60)));
        make.top.mas_equalTo(self.view.mas_top).offset(scaleY_6(150));
    }];
}

///** 在这里重写这个方法的目的：消除警告 */
//- (RechargeType)type {return 0;}
//
//- (void)topicReflash:(RechargeType)type{
//    //    [self loadTopics:type];
//}

@end
