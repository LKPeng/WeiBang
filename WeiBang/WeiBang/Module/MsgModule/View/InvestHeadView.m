//
//  InvestHeadView.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "InvestHeadView.h"

#import "ProgressView.h"

@interface InvestHeadView()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *moneyLabel;
@property (strong, nonatomic) UILabel *rateLabel;
@property (strong, nonatomic) UILabel *termLabel;
@end

@implementation InvestHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self setUp];
        
    }
    return self;
}

-(void)setUp{
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(scaleX(30));
        make.leading.mas_equalTo(scaleX(10));
    }];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(scaleX(10), scaleX(30), KWIDTH-scaleX(10), scaleX(0.8))];
    line.backgroundColor = [UIColor colorWithHexString:@"#f2f2f4"];
    [self addSubview:line];
    
    [self addSubview:self.moneyLabel];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(line.mas_bottom).offset(scaleX(12));
    }];
    
    UIImageView *icon1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hook.png"]];
    icon1.layer.cornerRadius = scaleX(6);
    icon1.clipsToBounds = true;
    [self addSubview:icon1];
    [icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(scaleX(45));
        make.width.height.mas_equalTo(scaleX(12));
        make.top.mas_equalTo(self.moneyLabel.mas_bottom).offset(scaleX(12));
    }];
    
    [self addSubview:self.rateLabel];
    [self.rateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(icon1.mas_trailing).offset(scaleX(2));
        make.centerY.mas_equalTo(icon1.mas_centerY);
    }];
    
    UIImageView *icon2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hook.png"]];
    icon2.layer.cornerRadius = scaleX(6);
    icon2.clipsToBounds = true;
    [self addSubview:icon2];
    [icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(scaleX(20)+KWIDTH*0.5);
        make.width.height.mas_equalTo(scaleX(12));
        make.centerY.mas_equalTo(icon1.mas_centerY);
    }];
    
    [self addSubview:self.termLabel];
    [self.termLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(icon2.mas_trailing).offset(scaleX(2));
        make.centerY.mas_equalTo(icon2.mas_centerY);
    }];
    
    ProgressView *progressView = [[ProgressView alloc]initWithFrame:CGRectMake(20, 500, 360, 100)];
    progressView.progress = 1;
    [self addSubview:progressView];
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(scaleX(10));
        make.trailing.mas_equalTo(scaleX(-30));
        make.height.mas_equalTo(scaleX(50));
        make.bottom.mas_equalTo(0);
    }];
}

- (void)setDataWithIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%7 == 0){
        self.titleLabel.text = @"富桢流程测试";
        self.rateLabel.text = @"预期年化收益率12%";
        self.termLabel.text = @"期限一个月";
    }else if (indexPath.row%7 == 1){
        self.titleLabel.text = @"车辆抵押";
        self.rateLabel.text = @"预期年化收益率16%";
        self.termLabel.text = @"期限一个月";
    }else if (indexPath.row%7 == 2) {
        self.titleLabel.text = @"新年地产开盘";
        self.rateLabel.text = @"预期年化收益率8%";
        self.termLabel.text = @"期限一个月";
    }else if (indexPath.row%7 == 3) {
        self.titleLabel.text = @"个人房屋抵押借款";
        self.rateLabel.text = @"预期年化收益率5%";
        self.termLabel.text = @"期限一个月";
    }else{
        self.titleLabel.text = [[NSString alloc]initWithFormat:@"个人标的测试流程%ld",(long)indexPath.row%5];
        self.rateLabel.text = @"预期年化收益率10%";
        self.termLabel.text = @"期限一个月";
    }
}




- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = kFontSize6(14);
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc]init];
        _moneyLabel.font = kFontSize6(11);
        _moneyLabel.textColor = [UIColor lightGrayColor];
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"0.00元可投金额"];
        [text addAttribute:NSFontAttributeName
                     value:[UIFont boldSystemFontOfSize:scaleX(18)]
                     range:[@"0.00元可投金额" rangeOfString:@"0.00"]];
        [text addAttribute:NSForegroundColorAttributeName
                     value:[UIColor redColor]
                     range:[@"0.00元可投金额" rangeOfString:@"0.00元"]];
        _moneyLabel.attributedText = text;
    }
    return _moneyLabel;
}

- (UILabel *)rateLabel{
    if (!_rateLabel) {
        _rateLabel = [[UILabel alloc]init];
        _rateLabel.font = kFontSize6(11);
        _rateLabel.textColor = [UIColor lightGrayColor];
    }
    return _rateLabel;
}

- (UILabel *)termLabel{
    if (!_termLabel) {
        _termLabel = [[UILabel alloc]init];
        _termLabel.font = kFontSize6(11);
        _termLabel.textColor = [UIColor lightGrayColor];
    }
    return _termLabel;
}


@end
