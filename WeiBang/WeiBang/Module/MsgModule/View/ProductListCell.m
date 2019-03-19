//
//  ProductListCell.m
//  WeiBang
//
//  Created by tchzt on 2019/3/19.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "ProductListCell.h"
#import "ProductListSubView.h"
#import "CircleProgressView.h"

@interface ProductListCell()
@property(nonatomic,strong)UILabel *termLabel;
@property(nonatomic,strong)UILabel *progressLabel;
@property(nonatomic,strong)ProductListSubView *productListSubView;
@property(nonatomic,weak)  CircleProgressView *circleProgressView;
@end

@implementation ProductListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self addSubview:self.termLabel];
    [self addSubview:self.progressLabel];
    [self addSubview:self.productListSubView];
    
    CGFloat circleWH = scaleX_6(60);
    
    [self.termLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(circleWH + scaleX_6(30));
        make.top.equalTo(self).offset(scaleY_6(15));
    }];
    
    [self.progressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.termLabel);
        make.top.equalTo(self.termLabel.mas_bottom).offset(scaleY_6(15));
    }];
    
    [self.productListSubView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(scaleY_6(30));
        make.left.equalTo(self.termLabel);
        make.right.equalTo(self.mas_right).offset(- scaleX_6(10));
        make.top.equalTo(self.progressLabel.mas_bottom).offset(scaleY_6(15));
    }];
    
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = kappLineColor;
    [self addSubview:lineView1];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    
    
    CircleProgressView *circleProgressView = [[CircleProgressView alloc] initWithFrame:CGRectMake(scaleX_6(15), scaleY_6(15), circleWH , circleWH) withRadius:scaleX_6(24) withLineWidth:5.0f];
    
    [self.contentView addSubview:circleProgressView];
    self.circleProgressView = circleProgressView;
    
    [self.circleProgressView updateProgress:0.0833 andTerm:30];
    self.circleProgressView.backClear = YES;
    
}

#pragma mark ----   懒加载  ----
- (UILabel *)termLabel
{
    if (!_termLabel) {
        _termLabel = [[UILabel alloc] init];
        _termLabel.font = kBoldFontSize6(14);
        _termLabel.textColor = [UIColor blackColor];
        _termLabel.text = @"银票通30天";
    }
    return _termLabel;
}

- (UILabel *)progressLabel
{
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] init];
        _progressLabel.font = kBoldFontSize6(14);
        _progressLabel.textColor = [UIColor blackColor];
        _progressLabel.text = @"年化收益 8.28%";
    }
    return _progressLabel;
}

- (ProductListSubView *)productListSubView{
    if (!_productListSubView) {
        _productListSubView = [[ProductListSubView alloc]init];
    }
    return _productListSubView;
}
@end
