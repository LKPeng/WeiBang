//
//  AccountItemTableViewCell.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "AccountItemTableViewCell.h"

@interface AccountItemTableViewCell()
@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@end

@implementation AccountItemTableViewCell

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
   
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(scaleX(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
}

- (void)setDataWithIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1){
        if (indexPath.row == 0) {
            self.titleLabel.text = @"融泽介绍";
            self.iconImageView.image = [UIImage imageNamed:@"me_recommend.png"];
        }else if (indexPath.row == 1){
            self.titleLabel.text = @"投资管理";
            self.iconImageView.image = [UIImage imageNamed:@"me_manage.png"];
        }else if (indexPath.row == 2) {
            self.titleLabel.text = @"借款管理";
            self.iconImageView.image = [UIImage imageNamed:@"loan.png"];
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            self.titleLabel.text = @"我的资产";
            self.iconImageView.image = [UIImage imageNamed:@"me_wallet.png"];
        }else if (indexPath.row == 1){
            self.titleLabel.text = @"关于我们";
            self.iconImageView.image = [UIImage imageNamed:@"me_aboutus.png"];
        }
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

@end
