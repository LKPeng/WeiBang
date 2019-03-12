//
//  InvestInfoView.m
//  WeiBang
//
//  Created by tchzt on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "InvestInfoView.h"
//下横线颜色
#define kappLineColor RGB(249, 249, 249)

@implementation InvestInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self setUp];
        
    }
    return self;
}

- (void)setUp{
    [self addSubview:self.canAmount];
    [self addSubview:self.smallAmount];
    [self addSubview:self.highAmount];
    [self addSubview:self.awardAmount];
    //1
    UILabel *canAmountL = [[UILabel alloc]init];
    [self createLabel:canAmountL WithText:@"可投金额"];
    [self addSubview:canAmountL];
    
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = kappLineColor;
    [self addSubview:lineView1];
    //2
    UILabel *smallAmountL = [[UILabel alloc]init];
    [self createLabel:smallAmountL WithText:@"最低起投金额"];
    [self addSubview:smallAmountL];
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = kappLineColor;
    [self addSubview:lineView2];
    //3
    UILabel *highAmountL = [[UILabel alloc]init];
    [self createLabel:highAmountL WithText:@"最高起投金额"];
    [self addSubview:highAmountL];
    
    UIView *lineView3 = [[UIView alloc]init];
    lineView3.backgroundColor = kappLineColor;
    [self addSubview:lineView3];
    //4
    UILabel *awardAmountL = [[UILabel alloc]init];
    [self createLabel:awardAmountL WithText:@"投标奖励"];
    [self addSubview:awardAmountL];
    
    //1
    [canAmountL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(scaleX_6(10));
        make.top.equalTo(self).offset(scaleY_6(15));
    }];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self).offset(scaleX_6(10));
        make.right.equalTo(self).offset(-scaleX_6(10));
        make.top.equalTo(canAmountL.mas_bottom).offset(scaleY_6(15));
    }];
    //2
    [smallAmountL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(scaleX_6(10));
        make.top.equalTo(lineView1.mas_bottom).offset(scaleY_6(15));
    }];
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self).offset(scaleX_6(10));
        make.right.equalTo(self).offset(-scaleX_6(10));
        make.top.equalTo(smallAmountL.mas_bottom).offset(scaleY_6(15));
    }];
    
    //3
    [highAmountL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(scaleX_6(10));
        make.top.equalTo(lineView2.mas_bottom).offset(scaleY_6(15));
    }];
    
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self).offset(scaleX_6(10));
        make.right.equalTo(self).offset(-scaleX_6(10));
        make.top.equalTo(highAmountL.mas_bottom).offset(scaleY_6(15));
    }];
    
    //4
    [awardAmountL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(scaleX_6(10));
        make.top.equalTo(lineView3.mas_bottom).offset(scaleY_6(15));
    }];
    
    //
    [self.canAmount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-scaleX_6(10));
        make.bottom.equalTo(canAmountL.mas_bottom);
    }];
    
    [self.smallAmount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-scaleX_6(10));
        make.bottom.equalTo(smallAmountL.mas_bottom);
    }];
    
    [self.highAmount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-scaleX_6(10));
        make.bottom.equalTo(highAmountL.mas_bottom);
    }];
    
    [self.awardAmount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-scaleX_6(10));
        make.bottom.equalTo(awardAmountL.mas_bottom);
    }];
    
}

- (void)createLabel:(UILabel *)label WithText:(NSString *)text{
    label.font = kFontSize6(13);
    label.textColor = [UIColor blackColor];
    label.text = text;
}

- (CGFloat)viewHeight{
    [self layoutIfNeeded];
    return CGRectGetMaxY(self.awardAmount.frame) + scaleY_6(15);
}
#pragma mark ----   懒加载  ----

- (UILabel *)canAmount{
    if (!_canAmount) {
        _canAmount = [[UILabel alloc]init];
        _canAmount.font = kFontSize6(13);
        _canAmount.textColor = [UIColor blackColor];
    }
    return _canAmount;
}

- (UILabel *)smallAmount{
    if (!_smallAmount) {
        _smallAmount = [[UILabel alloc]init];
        _smallAmount.font = kFontSize6(13);
        _smallAmount.textColor = [UIColor blackColor];
    }
    return _smallAmount;
}

- (UILabel *)highAmount{
    if (!_highAmount) {
        _highAmount = [[UILabel alloc]init];
        _highAmount.font = kFontSize6(13);
        _highAmount.textColor = [UIColor blackColor];
    }
    return _highAmount;
}

- (UILabel *)awardAmount{
    if (!_awardAmount) {
        _awardAmount = [[UILabel alloc]init];
        _awardAmount.font = kFontSize6(13);
        _awardAmount.textColor = [UIColor blackColor];
    }
    return _awardAmount;
}
@end
