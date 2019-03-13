//
//  InvestHeadView.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "InvestHeadView.h"

#import "ProgressView.h"
#import "InvestInfoView.h"
#import "InvestContectView.h"
#import "investScrollView.h"

@interface InvestHeadView()
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *moneyLabel;
@property (strong, nonatomic) UILabel *rateLabel;
@property (strong, nonatomic) UILabel *termLabel;
@property (weak, nonatomic) UIView *lineV ;

/* 设备 */
@property (strong, nonatomic) InvestInfoView *InvestInfoView;
/* 设备 */
@property (strong, nonatomic) InvestContectView *InvestContectView;
/* 设备 */
@property (strong, nonatomic) investScrollView *investScrollView;
@end

@implementation InvestHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
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
        make.top.equalTo(self.termLabel.mas_bottom).offset(scaleY_6(10));
    }];
    
    UIView *lineV = [[UIView alloc]init];
    lineV.backgroundColor = kappLineColor;
    [self addSubview:lineV];
    
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(scaleY_6(2));
        make.left.right.equalTo(self);
        make.top.equalTo(progressView.mas_bottom);
    }];
    
    self.lineV = lineV;
    
    [self addSubview:self.InvestInfoView];
    [self addSubview:self.InvestContectView];
    [self addSubview:self.investScrollView];
}

- (void)setDataWithIndexPath:(NSInteger)indexPath{
//    if (indexPath.row%7 == 0){
//        self.titleLabel.text = @"富桢流程测试";
//        self.rateLabel.text = @"预期年化收益率12%";
//        self.termLabel.text = @"期限一个月";
//    }else if (indexPath.row%7 == 1){
//        self.titleLabel.text = @"车辆抵押";
//        self.rateLabel.text = @"预期年化收益率16%";
//        self.termLabel.text = @"期限一个月";
//    }else if (indexPath.row%7 == 2) {
//        self.titleLabel.text = @"新年地产开盘";
//        self.rateLabel.text = @"预期年化收益率8%";
//        self.termLabel.text = @"期限一个月";
//    }else if (indexPath.row%7 == 3) {
//        self.titleLabel.text = @"个人房屋抵押借款";
//        self.rateLabel.text = @"预期年化收益率5%";
//        self.termLabel.text = @"期限一个月";
//    }else{
//        self.titleLabel.text = [[NSString alloc]initWithFormat:@"个人标的测试流程%ld",3%5];
//        self.rateLabel.text = @"预期年化收益率10%";
//        self.termLabel.text = @"期限一个月";
//    }
}

- (void)setTitleTextArray:(NSMutableArray *)titleTextArray{
    self.titleLabel.text =  [NSString stringWithFormat:@"项目名称:%@",titleTextArray[0]];
    self.rateLabel.text  =  titleTextArray[1];
    self.termLabel.text  =  titleTextArray[2];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat InvestInfoViewHeight = self.InvestInfoView.viewHeight;
    CGFloat InvestContectViewHeight = self.InvestContectView.viewHeight;

    
    NSLog(@"%f---%f",InvestInfoViewHeight,InvestContectViewHeight);
    
    [self.InvestContectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.lineV.mas_bottom).offset(scaleY_6(10));
        make.height.mas_equalTo(InvestContectViewHeight);
    }];

    [self.InvestInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.InvestContectView.mas_bottom).offset(scaleY_6(10));
        make.height.mas_equalTo(InvestInfoViewHeight);
    }];
    
    [self.investScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.InvestInfoView.mas_bottom).offset(scaleY_6(10));
        make.height.mas_equalTo(scaleY_6(45));
    }];
//
//    [self layoutIfNeeded];
    self.viewHeight = CGRectGetMaxY(self.lineV.frame) + scaleY_6(10);
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



#pragma mark ----   懒加载  ----
- (InvestInfoView *)InvestInfoView{
    if (!_InvestInfoView) {
        _InvestInfoView = [[InvestInfoView alloc]init];
        _InvestInfoView.canAmount.text   = @"0.00元";
        _InvestInfoView.smallAmount.text = @"0.00元";
        _InvestInfoView.highAmount.text  = @"50.00元";
        _InvestInfoView.awardAmount.text = @"无";
    }
    return _InvestInfoView;
}

- (InvestContectView *)InvestContectView{
    if (!_InvestContectView) {
        _InvestContectView = [[InvestContectView alloc]init];
        _InvestContectView.origin.text    = @"项目起息:审核通过后";
        _InvestContectView.returnWay.text = @"还款方式:按月分期还款";
        _InvestContectView.time.text      = @"剩余时间:0天0小时0分0秒";
        _InvestContectView.award.text     = @"是否奖励:无";
    }
    return _InvestContectView;
}

- (investScrollView *)investScrollView{
    if (!_investScrollView) {
        _investScrollView = [[investScrollView alloc]init];
    }
    return _investScrollView;
}


@end
