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

@property (nonatomic,strong) MyInvestmentView *investView;

@property (nonatomic,strong) MyInvestmentView *investView1;
@end

@implementation MyInvestmentSubController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(238, 238, 238);
    
//    MyInvestmentView *investView = [[MyInvestmentView alloc]init];
//    investView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.investView];
//    self.investView = investView;
    
    CGFloat width = (SCREEN_WIDTH - scaleX_6(10)*3)/2;
    [_investView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(scaleX(10));
        make.size.mas_equalTo(CGSizeMake(width, scaleY(60)));
        make.top.mas_equalTo(self.view.mas_top).offset(scaleY_6(150));
    }];
    
    
//    MyInvestmentView *investView1 = [[MyInvestmentView alloc]init];
//    investView1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.investView1];
//    self.investView1 = investView1;
    
    [_investView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.investView.mas_right).offset(scaleX(10));
        make.size.mas_equalTo(CGSizeMake(width, scaleY(60)));
        make.top.mas_equalTo(self.view.mas_top).offset(scaleY_6(150));
    }];
}


- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    switch (self.registerType) {
        case RechargeTypeAll:
        {
            NSLog(@"来了1");
            self.investView.imageView.image = [UIImage imageNamed:@"me_aboutus"];
            self.investView.titleLabel.text = @"待汇款本金";
            self.investView.instructionLabel.text = @"0";
            
            self.investView1.imageView.image = [UIImage imageNamed:@"me_recommend"];
            self.investView1.titleLabel.text = @"待汇款利息";
            self.investView1.instructionLabel.text = @"0";
        }
            break;
        case RechargeTypeIncome:
        {
            NSLog(@"来了2");
            self.investView.imageView.image = [UIImage imageNamed:@"me_aboutus"];
            self.investView.titleLabel.text = @"已回款本金";
            self.investView.instructionLabel.text = @"0";
            
            self.investView1.imageView.image = [UIImage imageNamed:@"me_recommend"];
            self.investView1.titleLabel.text = @"已回款利息";
            self.investView1.instructionLabel.text = @"0";
        }
            break;
        default:
        {
            NSLog(@"来了3");
            self.investView.imageView.image = [UIImage imageNamed:@"me_aboutus"];
            self.investView.titleLabel.text = @"待汇款本金";
            self.investView.instructionLabel.text = @"0";
            
            self.investView1.imageView.image = [UIImage imageNamed:@"me_recommend"];
            self.investView1.titleLabel.text = @"待汇款利息";
            self.investView1.instructionLabel.text = @"0";
        }
            break;
    }
}

- (void)setRegisterType:(RechargeType)registerType{
    _registerType = registerType;
    
}

- (MyInvestmentView *)investView{
    if (!_investView) {
        _investView = [[MyInvestmentView alloc]init];
        _investView.backgroundColor = [UIColor whiteColor];
    }
    return _investView;
}

- (MyInvestmentView *)investView1{
    if (!_investView1) {
        _investView1 = [[MyInvestmentView alloc]init];
        _investView1.backgroundColor = [UIColor whiteColor];
    }
    return _investView1;
}
@end
