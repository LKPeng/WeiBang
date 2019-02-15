//
//  MeHeadView.m
//  WeiBang
//
//  Created by tchzt on 2019/2/15.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MeHeadView.h"

@interface MeHeadView ()
@property (strong, nonatomic) UIButton *imageBtn;//头像
@property (strong, nonatomic) UIButton *titleBtn;//状态文字
@property (strong, nonatomic) UIButton *instructionsBtn;//指示按钮
@end

@implementation MeHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kappMainColor;
        [self setUp];
        
    }
    return self;
}

- (void)setUp{
    /*
     * 未登录
     */
    [self addSubview:self.imageBtn];
    [self addSubview:self.titleBtn];
    [self addSubview:self.instructionsBtn];
    /*
     * 已登录
     */
}

- (void)layoutSubviews{
    [super layoutSubviews];
    /*
     * 未登录
     */
    [_imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(scaleX(10));
        make.size.mas_equalTo(CGSizeMake(scaleY(50), scaleY(50)));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [_instructionsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-scaleX(10));
        make.size.mas_equalTo(CGSizeMake(scaleX(18), scaleY(55)));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageBtn.mas_right).offset(scaleX(5));
        make.height.mas_equalTo(scaleY(30));
        make.right.equalTo(self.instructionsBtn.mas_left).offset(-scaleX(10));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
}

#pragma mark ----   懒加载  ----
/*
 * 未登录
 */
- (UIButton *)imageBtn{
    if (!_imageBtn) {
        _imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imageBtn setImage:[UIImage imageNamed:@"u2779"] forState:UIControlStateNormal];
    }
    return _imageBtn;
}

- (UIButton *)titleBtn{
    if (!_titleBtn) {
        _titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_titleBtn setTitle:@"未登录,点击登录/注册" forState:UIControlStateNormal];
        [_titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _titleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _titleBtn.titleLabel.font = kFontSize6(17);
    }
    return _titleBtn;
}

- (UIButton *)instructionsBtn{
    if (!_instructionsBtn) {
        _instructionsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_instructionsBtn setImage:[UIImage imageNamed:@"u2823"] forState:UIControlStateNormal];
    }
    return _instructionsBtn;
}

/*
 * 已登录
 */

@end


