//
//  MyRecodeTableViewCell.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/18.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MyRecodeTableViewCell.h"

@interface MyRecodeTableViewCell()
@property(nonatomic,strong) UILabel *title1Label;
@property(nonatomic,strong) UILabel *title2Lable;
@property(nonatomic,strong) UILabel *investmentRecordLable;
@property(nonatomic,strong) UILabel *refundRecordLable;
@property (strong, nonatomic) UIImageView *iconImageView1;
@property (strong, nonatomic) UIImageView *iconImageView2;
@end

@implementation MyRecodeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self addSubview:self.title1Label];
    [self.title1Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(scaleX(10));
        make.top.mas_equalTo(scaleX(8));
    }];
    [self addSubview:self.investmentRecordLable];
    [self.investmentRecordLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(scaleX(10));
        make.bottom.mas_equalTo(scaleX(-8));
    }];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(KWIDTH*0.5-0.3, scaleX(8), 0.6, scaleX(44))];
    line.backgroundColor = [UIColor lightGrayColor];
    [self  addSubview:line];
    
    [self addSubview:self.iconImageView1];
    [self.iconImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(line.mas_leading).offset(scaleX(-3));
        make.width.height.mas_equalTo(scaleX(18));
        make.bottom.mas_equalTo(scaleX(-3));
    }];
    
    [self addSubview:self.title2Lable];
    [self.title2Lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(line.mas_trailing).offset(scaleX(10));
        make.top.mas_equalTo(scaleX(8));
    }];
    
    [self addSubview:self.refundRecordLable];
    [self.refundRecordLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(line.mas_trailing).offset(scaleX(10));
        make.bottom.mas_equalTo(scaleX(-8));
    }];
    
    [self addSubview:self.iconImageView2];
    [self.iconImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(scaleX(-3));
        make.width.height.mas_equalTo(scaleX(18));
        make.bottom.mas_equalTo(scaleX(-3));
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (UILabel *)title1Label{
    if (!_title1Label) {
        _title1Label = [[UILabel alloc]init];
        _title1Label.font = kFontSize6(13);
        _title1Label.textColor = [UIColor blackColor];
        _title1Label.text = @"投资记录";
    }
    return _title1Label;
}

- (UILabel *)title2Lable{
    if (!_title2Lable) {
        _title2Lable = [[UILabel alloc]init];
        _title2Lable.font = kFontSize6(13);
        _title2Lable.textColor = [UIColor blackColor];
        _title2Lable.text = @"回款记录";
    }
    return _title2Lable;
}

- (UILabel *)investmentRecordLable{
    if (!_investmentRecordLable) {
        _investmentRecordLable = [[UILabel alloc]init];
        _investmentRecordLable.font = kFontSize6(13);
        _investmentRecordLable.textColor = [UIColor blackColor];
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"0.00 元"];
        [text addAttribute:NSForegroundColorAttributeName
                     value:[UIColor orangeColor]
                     range:[@"0.00 元" rangeOfString:@"0.00"]];
        _investmentRecordLable.attributedText = text;
    }
    return _investmentRecordLable;
}

- (UILabel *)refundRecordLable{
    if (!_refundRecordLable) {
        _refundRecordLable = [[UILabel alloc]init];
        _refundRecordLable.font = kFontSize6(13);
        _refundRecordLable.textColor = [UIColor blackColor];
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"0.00 元"];
        [text addAttribute:NSForegroundColorAttributeName
                     value:[UIColor orangeColor]
                     range:[@"0.00 元" rangeOfString:@"0.00"]];
        _refundRecordLable.attributedText = text;
    }
    return _refundRecordLable;
}

- (UIImageView *)iconImageView1{
    if (!_iconImageView1) {
        _iconImageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"u2779"]];
    }
    return _iconImageView1;
}

- (UIImageView *)iconImageView2{
    if (!_iconImageView2) {
        _iconImageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"u2779"]];
    }
    return _iconImageView2;
}
@end
