//
//  newsCell.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/13.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "newsCell.h"
#import "NewsBulletinModel.h"


@interface newsCell ()

/* 图片 */
@property (strong, nonatomic) UIImageView *newsImage;
/* 时间 */
@property (strong, nonatomic) UILabel *newsTime;
/* 新闻 */
@property (strong, nonatomic) UILabel *newsContent;

@property (strong, nonatomic) UIView *lineView;

@end

@implementation newsCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    
    [self.contentView addSubview:self.newsImage];
    [self.contentView addSubview:self.newsTime];
    [self.contentView addSubview:self.newsContent];
    [self.contentView addSubview:self.lineView];
    
    CGFloat height = (SCREEN_WIDTH - scaleX_6(10)*2) / 12 *8;
    
    [self.newsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(scaleY_6(10));
        make.left.equalTo(self).offset(scaleX_6(10));
        make.right.equalTo(self).offset(-scaleX_6(10));
        make.height.mas_equalTo(height);
    }];
    
    [self.newsTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newsImage.mas_bottom).offset(scaleY_6(10));
        make.left.equalTo(self).offset(scaleX_6(15));
    }];
    
    [self.newsContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newsTime.mas_bottom).offset(scaleY_6(10));
        make.left.equalTo(self).offset(scaleX_6(15));
        make.right.equalTo(self).offset(-scaleX_6(15));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self.newsContent.mas_bottom).offset(scaleY_6(10));
    }];
}

- (void)setModel:(NewsBulletinModel *)model{
    _model = model;
//    NSArray *imageUrl1s = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    self.newsImage.image = [UIImage imageNamed:@"1.jpg"];
    self.newsTime.text = model.newsTime;
    self.newsContent.text = model.newsContent;
    
    [self layoutIfNeeded];
    model.cellHeight = CGRectGetMaxY(self.lineView.frame);
}

- (void)setRow:(NSInteger)row{
    _row = row;
    NSInteger imagetag =  (row)%3 + 1;
    NSString *imageName = [NSString stringWithFormat:@"%ld.jpg",(long)imagetag];
    self.newsImage.image = [UIImage imageNamed:imageName];
}

#pragma mark ----   懒加载  ----

- (UILabel *)newsTime{
    if (!_newsTime) {
        _newsTime = [[UILabel alloc]init];
        _newsTime.font = kFontSize6(13);
        _newsTime.textColor = RGB(206, 206, 206);
    }
    return _newsTime;
}

- (UILabel *)newsContent{
    if (!_newsContent) {
        _newsContent = [[UILabel alloc]init];
        _newsContent.font = kFontSize6(14);
    }
    return _newsContent;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = kappLineColor;
    }
    return _lineView;
}

- (UIImageView *)newsImage{
    if (!_newsImage) {
        _newsImage = [[UIImageView alloc]init];
    }
    return _newsImage;
}

@end

