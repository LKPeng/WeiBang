//
//  ProductListSubView.m
//  WeiBang
//
//  Created by tchzt on 2019/3/19.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "ProductListSubView.h"
//#import "ProductListModel.h"

@interface ProductListSubView ()
@property(nonatomic,strong)UILabel *termLabel;
@property(nonatomic,strong)UILabel *purchaseLabel;
@property(nonatomic,strong)UILabel *wayLabel;
@end

@implementation ProductListSubView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self addSubview:self.termLabel];
    [self addSubview:self.purchaseLabel];
    [self addSubview:self.wayLabel];
    
    [self.termLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = RGB(243, 243, 243);
    [self addSubview:lineView1];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.left.equalTo(self.termLabel.mas_right).offset(scaleX_6(10));
        make.top.bottom.equalTo(self);
    }];
    
    [self.purchaseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView1.mas_right).offset(scaleX_6(10));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = RGB(243, 243, 243);
    [self addSubview:lineView2];
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.left.equalTo(self.purchaseLabel.mas_right).offset(scaleX_6(10));
        make.top.bottom.equalTo(self);
    }];
    
    [self.wayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView2.mas_right).offset(scaleX_6(10));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
}

//- (void)setModel:(ProductListModel *)model{
//    _model = model;
//    self.termLabel.text = [NSString stringWithFormat:@"%ld天期限",(long)model.term];
//}
#pragma mark ----   懒加载  ----

- (UILabel *)termLabel
{
    if (!_termLabel) {
        _termLabel = [[UILabel alloc] init];
        _termLabel.font = kFontSize6(13);
        _termLabel.textColor = [UIColor blackColor];
        _termLabel.text = @"30天期限";
    }
    return _termLabel;
}

- (UILabel *)purchaseLabel
{
    if (!_purchaseLabel) {
        _purchaseLabel = [[UILabel alloc] init];
        _purchaseLabel.font = kFontSize6(13);
        _purchaseLabel.textColor = [UIColor blackColor];
        _purchaseLabel.text = @"1000元起购";
    }
    return _purchaseLabel;
}

- (UILabel *)wayLabel
{
    if (!_wayLabel) {
        _wayLabel = [[UILabel alloc] init];
        _wayLabel.font = kFontSize6(13);
        _wayLabel.textColor = [UIColor blackColor];
        _wayLabel.text = @"按息付息";
    }
    return _wayLabel;
}
@end
