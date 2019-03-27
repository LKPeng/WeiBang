//
//  MsgTableViewCell.m
//  WeiBang
//
//  Created by tchzt on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MsgTableViewCell.h"
#import "MsgModel.h"

@interface MsgTableViewCell()
/* 设备 */
@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UILabel *percentLabel;

@property (strong, nonatomic) UILabel *historyLabel;

@property (strong, nonatomic) UILabel *borrowLabel;

@end

@implementation MsgTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self addSubview:self.percentLabel];
    [self addSubview:self.historyLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.borrowLabel];
    
    [self.percentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(scaleX_6(15));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self.historyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).offset(scaleX_6(50));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(scaleX_6(15));
        make.top.equalTo(self.percentLabel.mas_bottom).offset(scaleY_6(10));
    }];
    
    [self.borrowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.historyLabel.mas_left);
        make.top.equalTo(self.percentLabel.mas_bottom).offset(scaleY_6(10));
    }];
}

- (void)setMsgModel:(MsgModel *)msgModel{
    _msgModel = msgModel;
    self.percentLabel.text = msgModel.percent;
    self.titleLabel.text = msgModel.title;
    self.historyLabel.text = msgModel.history;
    self.borrowLabel.text = msgModel.borrow;
}



- (UILabel *)percentLabel{
    if (!_percentLabel) {
        _percentLabel = [[UILabel alloc]init];
        _percentLabel.text = @"8% + 5%";
        _percentLabel.textColor = [UIColor redColor];
        _percentLabel.font = kFontSize6(25);
    }
    return _percentLabel;
}

- (UILabel *)historyLabel{
    if (!_historyLabel) {
        _historyLabel = [[UILabel alloc]init];
        _historyLabel.text = @"· 历史年化利率 ·";
        _historyLabel.textColor = [UIColor blackColor];
        _historyLabel.font = kFontSize6(14);
    }
    return _historyLabel;
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"新手专享自助投";
        _titleLabel.font = kFontSize6(11);
        _titleLabel.textColor = kappMainTitleGray;
    }
    return _titleLabel;
}

- (UILabel *)borrowLabel{
    if (!_borrowLabel) {
        _borrowLabel = [[UILabel alloc]init];
        _borrowLabel.font = kFontSize6(11);
        _borrowLabel.textColor = kappMainTitleGray;
    }
    return _borrowLabel;
}

@end


