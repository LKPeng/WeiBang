//
//  MyWalletTableViewCell.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/18.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MyWalletTableViewCell.h"

@interface MyWalletTableViewCell()
@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UIImageView *insImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *moneyLabel;
@end

@implementation MyWalletTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(scaleX(10));
        make.size.mas_equalTo(CGSizeMake(scaleY(20), scaleY(20)));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.contentView addSubview:self.insImageView];
    [self.insImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-scaleX(10));
        make.size.mas_equalTo(CGSizeMake(8, 23));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(scaleX(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.insImageView.mas_left).offset(-scaleX(10));
    }];
    
    [self.contentView addSubview:self.moneyLabel];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.insImageView.mas_leading).offset(scaleX(-5));
        make.centerY.mas_equalTo(self);
    }];
}

-(void)setDataWithIndexPath:(NSIndexPath*)indexpath{
    if (indexpath.row == 0) {
        self.titleLabel.text = @"充值提现";
        self.moneyLabel.text = @"6元";
    }else if (indexpath.row == 1) {
        self.titleLabel.text = @"红包及奖励";
        self.moneyLabel.text = @"";
    }else if (indexpath.row == 2) {
        self.titleLabel.text = @"资金记录";
        self.moneyLabel.text = @"";
    }else if (indexpath.row == 3) {
        self.titleLabel.text = @"自动投资";
        self.moneyLabel.text = @"";
    }
}


#pragma mark ----   懒加载  ----
- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"u2779"]];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = kFontSize6(13);
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc]init];
        _moneyLabel.font = kFontSize6(13);
        _moneyLabel.textColor = [UIColor blackColor];
    }
    return _moneyLabel;
}


- (UIImageView *)insImageView{
    if (!_insImageView) {
        _insImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"u2825"]];
    }
    return _insImageView;
}

@end
