//
//  HomeView.m
//  WeiBang
//
//  Created by tchzt on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "HomeView.h"
#import "ProductListSubView.h"

@interface HomeView()
/* 设备 */
@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UILabel *percentLabel;

@property (strong, nonatomic) UILabel *historyLabel;

@property (strong, nonatomic) UIButton *borrowButton;

@property (strong, nonatomic) UIButton *timesButton;
@end

@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = KWhiteColor;
        [self setup];
    }
    return self;
}

- (void)setup{
    [self addSubview:self.titleLabel];
    [self addSubview:self.percentLabel];
    [self addSubview:self.historyLabel];
    [self addSubview:self.borrowButton];
    [self addSubview:self.timesButton];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGB(235, 235, 235);
    [self addSubview:lineView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(scaleY_6(20));
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(scaleY_6(15));
        make.width.mas_equalTo(scaleX_6(60));
        make.height.mas_equalTo(scaleY_6(1));
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    [self.percentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.equalTo(lineView.mas_bottom).offset(scaleY_6(15));
    }];
    
    [self.historyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.equalTo(self.percentLabel.mas_bottom).offset(scaleY_6(15));
    }];
    
    ProductListSubView *subView = [[ProductListSubView alloc]init];
    subView.backgroundColor = [UIColor whiteColor];
    [self addSubview:subView];
    
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(scaleX_6(250));
        make.height.mas_equalTo(scaleY_6(30));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.equalTo(self.historyLabel.mas_bottom).offset(scaleY_6(15));
    }];
    
    [self.borrowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(scaleX_6(15));
        make.right.equalTo(self.mas_right).offset(-scaleX_6(15));
        make.top.equalTo(subView.mas_bottom).offset(scaleY_6(15));
        make.height.mas_equalTo(scaleY_6(40));
    }];
    
    [self.timesButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.percentLabel.mas_right).offset(scaleX(3));
        make.top.equalTo(self.percentLabel.mas_top);
        make.width.mas_equalTo(scaleX_6(50));
        make.height.mas_equalTo(scaleY_6(15));
    }];
}


- (void)borrowButtonClick{
    !self.borrowBlock? : self.borrowBlock();
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_borrowButton setAllCorner:scaleY_6(20)];
    [_timesButton setAllCorner:scaleY_6(2)];
}

#pragma mark ----   懒加载  ----
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"新手专享自助投";
    }
    return _titleLabel;
}

- (UILabel *)percentLabel{
    if (!_percentLabel) {
        _percentLabel = [[UILabel alloc]init];
        _percentLabel.text = @"8% + 5%";
        _percentLabel.textColor = kappMainRed;
        _percentLabel.font = kFontSize6(25);
    }
    return _percentLabel;
}

- (UILabel *)historyLabel{
    if (!_historyLabel) {
        _historyLabel = [[UILabel alloc]init];
        _historyLabel.text = @"· 历史年化利率 ·";
        _historyLabel.textColor = kappMainRed;
        _historyLabel.font = kFontSize6(11);
    }
    return _historyLabel;
}

- (UIButton *)borrowButton{
    if (!_borrowButton) {
        _borrowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _borrowButton.backgroundColor = kappMainRed;
        [_borrowButton setTitle:@"立即出借" forState:UIControlStateNormal];
        _borrowButton.titleLabel.textColor = KWhiteColor;
        [_borrowButton addTarget:self action:@selector(borrowButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _borrowButton;
}

- (UIButton *)timesButton{
    if (!_timesButton) {
        _timesButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_timesButton setTitle:@"限购一次" forState:UIControlStateNormal];
        _timesButton.backgroundColor = kappMainRed;
        _timesButton.titleLabel.textColor = KWhiteColor;
        _timesButton.titleLabel.font = kFontSize6(9);
    }
    return _timesButton;
}

@end







