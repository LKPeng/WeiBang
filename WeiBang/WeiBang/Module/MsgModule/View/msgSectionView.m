//
//  msgSectionView.m
//  WeiBang
//
//  Created by tchzt on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "msgSectionView.h"
#import "MsgModel.h"

@interface msgSectionView ()

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UILabel *textLabel;

@end

@implementation msgSectionView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = KWhiteColor;
        [self setup];
    }
    return self;
}

- (void)setup{
    
    UIView *lineView = [[UIView alloc]init];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(scaleY_6(10));
        make.left.right.top.equalTo(self);
    }];
    
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.textLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(scaleY_6(5));
        make.left.equalTo(self).offset(scaleX_6(15));
    }];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY).offset(scaleY_6(5));
        make.left.equalTo(self.titleLabel.mas_right).offset(scaleX_6(10));
    }];
}

- (void)setMsgModel:(MsgModel *)msgModel{
    _msgModel = msgModel;
    self.titleLabel.text = msgModel.sectionTitle;
    self.textLabel.text = msgModel.sectionTxt;
}

#pragma mark ----   懒加载  ----
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = kFontSize6(13);
    }
    return _titleLabel;
}

- (UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
        _textLabel.font = kFontSize6(11);
        _textLabel.textColor = kappMainTitleGray;
    }
    return _textLabel;
}

@end





