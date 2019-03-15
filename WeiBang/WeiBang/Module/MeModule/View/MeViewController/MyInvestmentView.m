//
//  MyInvestmentView.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/15.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MyInvestmentView.h"

@interface MyInvestmentView ()

@end

@implementation MyInvestmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kappRed;
        [self setUp];
        
    }
    return self;
}

- (void)setUp{
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.instructionLabel];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(scaleX_6(20), scaleX_6(20)));
        make.top.equalTo(self).offset(scaleY_6(10));
        make.left.equalTo(self).offset(scaleX_6(10));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.imageView);
        make.left.equalTo(self.imageView.mas_right).offset(scaleX_6(10));
    }];
    
    [_instructionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(scaleY_6(10));
    }];
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = kFontSize6(15);
    }
    return _titleLabel;
}

- (UILabel *)instructionLabel{
    if (!_instructionLabel) {
        _instructionLabel = [[UILabel alloc]init];
        _instructionLabel.textColor = kappRed;
        _instructionLabel.font = kFontSize6(18);
    }
    return _instructionLabel;
}

@end
