//
//  TranslateView.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/15.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "TranslateView.h"


@interface TranslateView()
@property (strong, nonatomic) UIImageView *imageView;//头像
@property (strong, nonatomic) UILabel *totalAssetLabel;
@property (strong, nonatomic) UILabel *assetsLabel;
@end
@implementation TranslateView

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
    [self addSubview:self.totalAssetLabel];
    [self addSubview:self.assetsLabel];
    
    CGFloat bili = 762 / 816;
    CGFloat width = SCREEN_WIDTH - scaleX_6(10)*2;
    CGFloat height = width / bili;
    
    [self.totalAssetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(scaleY_6(10));
        make.centerX.mas_equalTo(self);
    }];
    
    [self.assetsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.totalAssetLabel.mas_bottom).offset(scaleY_6(20));
        make.centerX.mas_equalTo(self);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(scaleX_6(300), scaleY_6(325)));
        make.top.equalTo(self.assetsLabel.mas_bottom).offset(scaleY_6(20));
        make.centerX.mas_equalTo(self);
    }];
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Translate.png"]];
    }
    return _imageView;
}

- (UILabel *)totalAssetLabel{
    if (!_totalAssetLabel) {
        _totalAssetLabel = [[UILabel alloc]init];
        _totalAssetLabel.textColor = [UIColor whiteColor];
        _totalAssetLabel.font = kFontSize6(13);
        _totalAssetLabel.text = @"安全保障";
    }
    return _totalAssetLabel;
}
- (UILabel *)assetsLabel{
    if (!_assetsLabel) {
        _assetsLabel = [[UILabel alloc]init];
        _assetsLabel.font = kFontSize6(12);
        _assetsLabel.textColor = [UIColor whiteColor];
        _assetsLabel.text = @"浣熊理财与平安银行正式签署资金存管协议";
    }
    return _assetsLabel;
}

@end
