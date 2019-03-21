//
//  MoreTableViewCell.m
//  WeiBang
//
//  Created by XXX on 2019/3/18.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MoreTableViewCell.h"

@interface MoreTableViewCell()
@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UIImageView *insImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *telePhone;
@end

@implementation MoreTableViewCell

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
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(scaleX(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.insImageView.mas_left).offset(-scaleX(10));
    }];
    
    [self.contentView addSubview:self.telePhone];
    [self.telePhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.trailing.mas_equalTo(self.insImageView.mas_leading).offset(scaleX(-5));
    }];
}

-(void)setDataWithIndexPath:(NSIndexPath*)indexpath{
    if (indexpath.section == 0) {
        if (indexpath.row == 0) {
            self.titleLabel.text = @"活动中心";
            self.iconImageView.image = [UIImage imageNamed:@"活动中心.png"];
        }else if (indexpath.row == 1) {
            self.titleLabel.text = @"消息公告";
            self.iconImageView.image = [UIImage imageNamed:@"消息公告.png"];
        }
    }else if (indexpath.section == 1) {
        if (indexpath.row == 0) {
            self.titleLabel.text = @"关于我们";
            self.iconImageView.image = [UIImage imageNamed:@"关于我们.png"];
        }else if (indexpath.row == 1) {
            self.titleLabel.text = @"帮助中心";
            self.iconImageView.image = [UIImage imageNamed:@"帮助中心.png"];
        }else if (indexpath.row == 2) {
            self.titleLabel.text = @"客服电话";
            self.iconImageView.image = [UIImage imageNamed:@"客服电话.png"];
        }
    }
    if (!(indexpath.section == 1 && indexpath.row == 2)) {
        self.telePhone.text = @"";
    }else{
        self.telePhone.text = @"400-2351280";
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

- (UILabel *)telePhone{
    if (!_telePhone) {
        _telePhone = [[UILabel alloc]init];
        _telePhone.font = kFontSize6(12);
        _telePhone.textColor = [UIColor lightGrayColor];
    }
    return _telePhone;
}

- (UIImageView *)insImageView{
    if (!_insImageView) {
        _insImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"right_in"]];
    }
    return _insImageView;
}

@end
