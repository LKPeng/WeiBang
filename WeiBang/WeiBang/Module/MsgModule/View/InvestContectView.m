//
//  InvestContectView.m
//  WeiBang
//
//  Created by tchzt on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "InvestContectView.h"

@implementation InvestContectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self setUp];
        
    }
    return self;
}

- (void)setUp{
    [self addSubview:self.origin];
    [self addSubview:self.returnWay];
    [self addSubview:self.time];
    [self addSubview:self.award];
    
    
    
    [self.origin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(scaleX_6(10));
        make.top.equalTo(self).offset(scaleY_6(15));
        make.width.mas_equalTo(SCREEN_WIDTH/2 - scaleX_6(10));
    }];
    
    [self.returnWay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(SCREEN_WIDTH/2 + scaleX_6(10));
        make.top.equalTo(self.origin.mas_top);
        make.width.mas_equalTo(SCREEN_WIDTH/2 - scaleX_6(10));
    }];
    
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(scaleX_6(10));
        make.top.equalTo(self.origin.mas_bottom).offset(scaleY_6(15));
        make.width.mas_equalTo(SCREEN_WIDTH/2 - scaleX_6(10));
    }];
    
    [self.award mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(SCREEN_WIDTH/2 + scaleX_6(10));
        make.top.equalTo(self.time.mas_top);
        make.width.mas_equalTo(SCREEN_WIDTH/2 - scaleX_6(10));
    }];
}

- (CGFloat)viewHeight{
    
    [self layoutIfNeeded];
    
    return CGRectGetMaxY(self.award.frame) + scaleY_6(15);
    
}

#pragma mark ----   懒加载  ----

- (UILabel *)origin{
    if (!_origin) {
        _origin = [[UILabel alloc]init];
        _origin.font = kFontSize6(13);
        _origin.textColor = [UIColor blackColor];
    }
    return _origin;
}

- (UILabel *)returnWay{
    if (!_returnWay) {
        _returnWay = [[UILabel alloc]init];
        _returnWay.font = kFontSize6(13);
        _returnWay.textColor = [UIColor blackColor];
    }
    return _returnWay;
}

- (UILabel *)time{
    if (!_time) {
        _time = [[UILabel alloc]init];
        _time.font = kFontSize6(13);
        _time.textColor = [UIColor blackColor];
    }
    return _time;
}

- (UILabel *)award{
    if (!_award) {
        _award = [[UILabel alloc]init];
        _award.font = kFontSize6(13);
        _award.textColor = [UIColor blackColor];
    }
    return _award;
}

@end
