//
//  HomeCell.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()

@end

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    UILabel *title = [[UILabel alloc]init];
    title.text = @"了解柚子";
    [self.contentView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self).offset(scaleY_6(10));
    }];
    
    CGFloat width = (KWIDTH - scaleX_6(20)*3)/2;
    CGFloat height = width/2.5;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"shuju.jpeg"] forState:UIControlStateNormal];
    leftButton.userInteractionEnabled = NO;
    [self.contentView addSubview:leftButton];

    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"zijin.jpeg"] forState:UIControlStateNormal];
    rightButton.userInteractionEnabled = NO;
    [self.contentView addSubview:rightButton];
    
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(width, height));
        make.top.equalTo(title.mas_bottom).offset(scaleY_6(15));
        make.left.equalTo(self).offset(scaleX_6(20));
    }];
    
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(width, height));
        make.top.equalTo(title.mas_bottom).offset(scaleY_6(15));
        make.left.equalTo(leftButton.mas_right).offset(scaleX_6(20));
    }];
}

@end
