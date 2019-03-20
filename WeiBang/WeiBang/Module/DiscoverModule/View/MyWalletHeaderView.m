//
//  MyWalletHeaderView.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/18.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MyWalletHeaderView.h"

@interface MyWalletHeaderView()
@property (strong, nonatomic) UIImageView *imageView;//头像
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *telLabel;
@property (strong, nonatomic) UILabel *profitLabel;
@end

@implementation MyWalletHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kappMainGreen;
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    [self addSubview:self.profitLabel];
    [self.profitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(scaleX(-5));
    }];
    
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(scaleX(60));
        make.height.mas_equalTo(scaleX(24));
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self.profitLabel.mas_top).offset(scaleX(-10));
    }];
    
    [self addSubview:self.telLabel];
    [self.telLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self.nameLabel.mas_top).offset(scaleX(-5));
    }];
    
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(scaleX(60));
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self.telLabel.mas_top).offset(scaleX(-5));
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.layer.cornerRadius = scaleX(30);
    self.imageView.clipsToBounds = true;
    
    self.nameLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    self.nameLabel.layer.borderWidth = scaleX(0.5);
    self.nameLabel.layer.cornerRadius = scaleX(12);
    self.nameLabel.clipsToBounds = true;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"personal_backgroud_icon.png"]];
    }
    return _imageView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = kFontSize6(13);
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.text = @"刘俊熙";
    }
    return _nameLabel;
}
- (UILabel *)telLabel{
    if (!_telLabel) {
        _telLabel = [[UILabel alloc]init];
        _telLabel.font = kFontSize6(12);
        _telLabel.textColor = [UIColor whiteColor];
        _telLabel.text = @"135****9567";
    }
    return _telLabel;
}

- (UILabel *)profitLabel{
    if (!_profitLabel) {
        _profitLabel = [[UILabel alloc]init];
        _profitLabel.font = kFontSize6(12);
        _profitLabel.textColor = [UIColor lightGrayColor];
        
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"累计收益:0.00元"];
        [text addAttribute:NSFontAttributeName
                     value:[UIFont boldSystemFontOfSize:scaleX(15)]
                     range:[@"累计收益:0.00元" rangeOfString:@"0.00"]];
        [text addAttribute:NSForegroundColorAttributeName
                     value:[UIColor whiteColor]
                     range:[@"0.00元可投金额" rangeOfString:@"0.00"]];
        _profitLabel.attributedText = text;
    }
    return _profitLabel;
}

@end
