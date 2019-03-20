//
//  RNOLNewBidHeader.m
//  RongNiuOnline
//
//  Created by apple on 2018/6/4.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "RNOLNewBidHeader.h"
#import "RNOLNewHandInvestModel.h"
#define kWGB_STR(str,...) [NSString stringWithFormat:str,##__VA_ARGS__]
@interface RNOLNewBidHeader()

//年利化率
@property (weak, nonatomic) IBOutlet UILabel *yearRateValueLabel;
//项目期限
@property (weak, nonatomic) IBOutlet UILabel *limitDateLabel;
//项目总额
@property (weak, nonatomic) IBOutlet UILabel *projectAccountLabel;
//还款方式
@property (weak, nonatomic) IBOutlet UILabel *repaymentMethodLabel;
//剩余金额
@property (weak, nonatomic) IBOutlet UILabel *surplusAmountLabel;
//图标处项目总额
@property (weak, nonatomic) IBOutlet UILabel *projectAcountL;
//投标人数
@property (weak, nonatomic) IBOutlet UILabel *numberPeopleLabel;

@end
@implementation RNOLNewBidHeader

- (void)setModel:(RNOLNewHandInvestModel *)model{
    _model = model;
    self.surplusAmountLabel.text = model.restMoney;
    self.projectAccountLabel.text = kWGB_STR(@"项目总额:%ld万元",(long)[model.borrowAmount integerValue]/10000);
    self.limitDateLabel.text = kWGB_STR(@"期限:%@个月",model.period);
    self.numberPeopleLabel.text = kWGB_STR(@"已有%@人投标",model.period);
    self.projectAcountL.text = kWGB_STR(@"总额%ld万元",(long)[model.borrowAmount integerValue]/10000);;
    NSString *ruleTitle = [[NSString alloc]init];
    if ([model.repayType isEqualToString:@"1"]){
        ruleTitle = @"等额本息";
    }else if ([model.repayType isEqualToString:@"2"]){
        ruleTitle = @"先息后本";
    }else if ([model.repayType isEqualToString:@"3"]){
        ruleTitle = @"到期一次还本付息";
    }else{
        ruleTitle = @"";
    }
    self.repaymentMethodLabel.text = ruleTitle;
    CGSize ruleSize = [self.repaymentMethodLabel.text sizeWithFont:[UIFont systemFontOfSize:14]];
    //改变字体大小,让repaymentMethodLabel文字显示完整
    if (ruleSize.width > 100) {
        self.repaymentMethodLabel.font = KFontSize(12);
    }
    if ([model.additionAlannualRate isEqualToString:@"0"]) {
        NSString *yearRate = kWGB_STR(@"%@%%",[self stringReturnPercent:model.annualRate]);
        self.yearRateValueLabel.text = yearRate;
    }else{
        NSString *yearRate = kWGB_STR(@"%@%%",[self stringReturnPercent:model.annualRate]);
        NSString *additionRate = kWGB_STR(@"+%@%%",[self stringReturnPercent:model.additionAlannualRate]);
        NSString *value = kWGB_STR(@"%@%@",yearRate,additionRate);
        self.yearRateValueLabel.text = value;
    }
}

- (NSString *)stringReturnPercent:(NSString *)frVal{
    double froal = [frVal doubleValue] * 100;
    return kWGB_STR(@"%0.2f",froal);
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    
}
@end
