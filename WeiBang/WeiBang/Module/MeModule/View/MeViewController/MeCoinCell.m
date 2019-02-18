//
//  MeCoinCell.m
//  WeiBang
//
//  Created by tchzt on 2019/2/15.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MeCoinCell.h"

@interface MeCoinCell ()
@property (strong, nonatomic) UILabel *coinLabel;
@property (strong, nonatomic) UIImageView *insImageView;
@property (strong, nonatomic) UIButton *rechargeBtn;
@end
@implementation MeCoinCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self.contentView addSubview:self.coinLabel];
    [self.coinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(scaleX(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.contentView addSubview:self.insImageView];
    [self.insImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-scaleX(10));
        make.size.mas_equalTo(CGSizeMake(8, 23));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.contentView addSubview:self.accountLabel];
    [self.accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coinLabel.mas_right).offset(scaleX(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.contentView addSubview:self.rechargeBtn];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_rechargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountLabel.mas_right).offset(scaleX(10));
        make.size.mas_equalTo(CGSizeMake(scaleX_6(40), 50));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
}

#pragma mark ----   懒加载  ----
- (UIImageView *)insImageView{
    if (!_insImageView) {
        _insImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"u2825"]];
    }
    return _insImageView;
}

- (UILabel *)coinLabel{
    if (!_coinLabel) {
        _coinLabel = [[UILabel alloc]init];
        _coinLabel.text = @"帮币(个)";
        _coinLabel.font = kFontSize6(13);
        _coinLabel.textColor = [UIColor blackColor];
    }
    return _coinLabel;
}

- (UILabel *)accountLabel{
    if (!_accountLabel) {
        _accountLabel = [[UILabel alloc]init];
        _accountLabel.textColor = [UIColor blackColor];
        _accountLabel.font = kBoldFontSize6(17);
    }
    return _accountLabel;
}

- (UIButton *)rechargeBtn{
    if (!_rechargeBtn) {
        _rechargeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rechargeBtn setTitle:@"充值" forState:UIControlStateNormal];
        [_rechargeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _rechargeBtn.titleLabel.font = kFontSize6(13);
    }
    return _rechargeBtn;
}
@end






