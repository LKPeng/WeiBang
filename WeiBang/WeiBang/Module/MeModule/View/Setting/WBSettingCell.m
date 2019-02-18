//
//  WBSettingCell.m
//  WeiBang
//
//  Created by tchzt on 2019/2/18.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "WBSettingCell.h"

@interface WBSettingCell()

@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UIImageView *insImageView;
@property (strong, nonatomic) UISwitch *insSwich;

@end
@implementation WBSettingCell

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
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.insImageView];
    [self.contentView addSubview:self.insSwich];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    switch (self.type) {
        case SettingPassWord:
        {
            self.iconImageView.hidden = NO;
            self.insSwich.hidden = YES;
            self.insImageView.hidden = NO;
            
            [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).offset(scaleX(10));
                make.size.mas_equalTo(CGSizeMake(scaleY(20), scaleY(20)));
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
            }];
            
            [self.insImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.contentView.mas_right).offset(-scaleX(10));
                make.size.mas_equalTo(CGSizeMake(8, 23));
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
            }];
            
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.iconImageView.mas_right).offset(scaleX(10));
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
                make.right.equalTo(self.insImageView.mas_left).offset(-scaleX(10));
            }];
        }
            break;
            
        case SettingNormal:
        {
            self.iconImageView.hidden = YES;
            self.insSwich.hidden = YES;
            self.insImageView.hidden = NO;
            
            [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).offset(scaleX(10));
                make.size.mas_equalTo(CGSizeMake(scaleY(20), scaleY(20)));
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
            }];
            
            [self.insImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.contentView.mas_right).offset(-scaleX(10));
                make.size.mas_equalTo(CGSizeMake(8, 23));
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
            }];
            
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).offset(scaleX(10));
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
                make.right.equalTo(self.insImageView.mas_left).offset(-scaleX(10));
            }];
        }
            break;
            
        case SettingSwich:
        {
            self.iconImageView.hidden = YES;
            self.insSwich.hidden = NO;
            self.insImageView.hidden = YES;
            
            [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).offset(scaleX(10));
                make.size.mas_equalTo(CGSizeMake(scaleY(20), scaleY(20)));
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
            }];
            
            [self.insImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.contentView.mas_right).offset(-scaleX(10));
                make.size.mas_equalTo(CGSizeMake(8, 23));
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
            }];
            
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).offset(scaleX(10));
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
                make.right.equalTo(self.insImageView.mas_left).offset(-scaleX(10));
            }];
            
            [self.insSwich mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.contentView.mas_right).offset(-scaleX(20));
                make.size.mas_equalTo(CGSizeMake(40, 25));
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
            }];
        }
            break;
        default:
            break;
    }
    

}

#pragma mark ----   懒加载  ----
- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.image = [UIImage imageNamed:@"u2779"];
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

- (UIImageView *)insImageView{
    if (!_insImageView) {
        _insImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"u2825"]];
    }
    return _insImageView;
}

- (UISwitch *)insSwich{
    if (!_insSwich) {
        _insSwich = [[UISwitch alloc]init];
        _insSwich.on = YES;
    }
    return _insSwich;
}

@end











