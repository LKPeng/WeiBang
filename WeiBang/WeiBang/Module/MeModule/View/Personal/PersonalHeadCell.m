//
//  PersonalHeadCell.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "PersonalHeadCell.h"

@interface PersonalHeadCell()
@property (strong, nonatomic) UIImageView *headImageView;
@property (strong, nonatomic) UIImageView *insImageView;
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation PersonalHeadCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    [self.contentView addSubview:self.insImageView];
    [self.insImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-scaleX(10));
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(scaleX(10));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.insImageView.mas_left).offset(-scaleX(10));
    }];
    
    [self.contentView addSubview:self.headImageView];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.insImageView.mas_left).offset(-scaleX(5));
        make.size.mas_equalTo(CGSizeMake(scaleY(30), scaleY(30)));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    self.titleLabel.text = @"头像";
    
}



#pragma mark ----   懒加载  ----

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
        _insImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"right_in"]];
    }
    return _insImageView;
}


- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"huabanfuben"]];
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headImageView;
}



@end
