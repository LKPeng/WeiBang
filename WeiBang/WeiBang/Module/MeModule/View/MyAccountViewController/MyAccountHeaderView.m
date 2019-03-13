//
//  MyAccountHeaderView.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MyAccountHeaderView.h"

@interface MyAccountHeaderView()
@property (strong, nonatomic) UIImageView *imageView;//头像
@property (strong, nonatomic) UILabel *totalAssetLabel;
@property (strong, nonatomic) UILabel *assetsLabel;
@property (strong, nonatomic) UILabel *codeLabel;
@property (strong, nonatomic) UILabel *recommendCodeLabel;
@end

@implementation MyAccountHeaderView

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
    
    [self addSubview:self.codeLabel];
    [self.codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scaleX(10));
        make.bottom.mas_equalTo(scaleY(-4));
    }];

    [self addSubview:self.recommendCodeLabel];
    [self.recommendCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(scaleX(-10));
        make.bottom.mas_equalTo(self.codeLabel.mas_bottom);
    }];
    
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(scaleX(45));
        make.left.mas_equalTo(scaleX(25));
        make.bottom.mas_equalTo(self.codeLabel.mas_top).offset(scaleX(-4));
    }];
    
    [self addSubview:self.totalAssetLabel];
    [self.totalAssetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_top);
        make.left.mas_equalTo(self.imageView.mas_right).offset(scaleX(12));
    }];
    
    [self addSubview:self.assetsLabel];
    [self.assetsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.totalAssetLabel.mas_leading);
        make.bottom.mas_equalTo(self.imageView.mas_bottom);
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.layer.cornerRadius = scaleX(45/2);
    self.imageView.clipsToBounds = true;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"u2779"]];
    }
    return _imageView;
}

- (UILabel *)totalAssetLabel{
    if (!_totalAssetLabel) {
        _totalAssetLabel = [[UILabel alloc]init];
        _totalAssetLabel.font = kFontSize6(13);
        _totalAssetLabel.textColor = [UIColor whiteColor];
        _totalAssetLabel.text = @"总资产(元)";
    }
    return _totalAssetLabel;
}
- (UILabel *)assetsLabel{
    if (!_assetsLabel) {
        _assetsLabel = [[UILabel alloc]init];
        _assetsLabel.font = kFontSize6(11);
        _assetsLabel.textColor = [UIColor whiteColor];
        _assetsLabel.text = @"0.00元";
    }
    return _assetsLabel;
}

- (UILabel *)codeLabel{
    if (!_codeLabel) {
        _codeLabel = [[UILabel alloc]init];
        _codeLabel.font = kFontSize6(11);
        _codeLabel.textColor = [UIColor whiteColor];
        _codeLabel.text = @"13789897890";
    }
    return _codeLabel;
}

- (UILabel *)recommendCodeLabel{
    if (!_recommendCodeLabel) {
         _recommendCodeLabel = [[UILabel alloc]init];
        _recommendCodeLabel.font = kFontSize6(11);
        _recommendCodeLabel.textColor = [UIColor whiteColor];
        _recommendCodeLabel.text = @"推荐码:2864107";
    }
    return _recommendCodeLabel;
}

@end
