//
//  HomeHeaderView.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "HomeHeaderView.h"
#import "UIImageView+WebCache.h"
#import "PlanADScrollView.h"
#import "RNOLHomeNoticeView.h"

@interface HomeHeaderView()<PlanADScrollViewDelegate>
@property(strong,nonatomic) PlanADScrollView *bannerView;
@property(strong,nonatomic) RNOLHomeNoticeView *noticeView;
@property(strong,nonatomic) UIButton *loanButton;
@property(strong,nonatomic) UIButton *userButton;
@property(strong,nonatomic) UIButton *newsButton;
@property(strong,nonatomic) UIImageView *centerImageView;
@end

@implementation HomeHeaderView

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
    [self addSubview:self.bannerView];
    [self addSubview:self.noticeView];
    [self addSubview:self.loanButton];
    [self addSubview:self.userButton];
    [self addSubview:self.newsButton];
    [self addSubview:self.centerImageView];
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"love.png"]];
    icon.frame = CGRectMake(KWIDTH*0.5-scaleX(22), CGRectGetMaxY(self.centerImageView.frame)+scaleX(5), scaleX(12), scaleX(12));
    [self addSubview:icon];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(KWIDTH*0.5-scaleX(5), CGRectGetMaxY(self.centerImageView.frame)+scaleX(2), KWIDTH*0.4, scaleX(16))];
    label.text = @"推荐项目";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:scaleX(12)];
    [self addSubview:label];
}

- (PlanADScrollView *)bannerView{
    if (!_bannerView) {
        NSArray *imageUrl1s = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
        _bannerView =[[PlanADScrollView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, scaleX(140))imageUrls:imageUrl1s placeholderimage:nil];
        _bannerView.delegate = self;
        _bannerView.pageContolStyle = PlanPageContolStyleNone;
    }
    return _bannerView;
}

- (RNOLHomeNoticeView *)noticeView{
    if (!_noticeView) {
        _noticeView = [[RNOLHomeNoticeView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bannerView.frame), KWIDTH , scaleX(35))];
        _noticeView.backgroundColor = KWhiteColor;
        _noticeView.msgArray = @[@"习近平的网络强国策",@"李克强主持国务院常务会七措施提高职业技能",@"商务部再谈美制裁中兴：希望美方不要自作聪明",@"韩公布韩朝首脑会谈总统随行人员名单 | 韩朝商定首脑会晤握手等直播"];
    }
    return _noticeView;
}


- (UIButton *)loanButton{
    if (!_loanButton) {
        _loanButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.noticeView.frame), KWIDTH*0.333, scaleX(100))];
        [_loanButton setTitle:@"借款" forState:UIControlStateNormal];
        [_loanButton setImage:[UIImage imageNamed:@"loan.png"] forState:UIControlStateNormal];
        [_loanButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _loanButton.titleLabel.font = KFontSize(12);
        [_loanButton verticalCenterImageAndTitle:scaleX(6)];
    }
    return _loanButton;
}

- (UIButton *)userButton{
    if (!_userButton) {
        _userButton = [[UIButton alloc] initWithFrame:CGRectMake(KWIDTH*0.333, CGRectGetMaxY(self.noticeView.frame), KWIDTH*0.333, scaleX(100))];
        [_userButton setTitle:@"借款" forState:UIControlStateNormal];
        [_userButton setImage:[UIImage imageNamed:@"new_user.png"] forState:UIControlStateNormal];
        [_userButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _userButton.titleLabel.font = KFontSize(12);
        [_userButton verticalCenterImageAndTitle:scaleX(6)];
    }
    return _userButton;
}

- (UIButton *)newsButton{
    if (!_newsButton) {
        _newsButton = [[UIButton alloc] initWithFrame:CGRectMake(KWIDTH*0.666, CGRectGetMaxY(self.noticeView.frame), KWIDTH*0.333, scaleX(100))];
        [_newsButton setTitle:@"借款" forState:UIControlStateNormal];
        [_newsButton setImage:[UIImage imageNamed:@"news.png"] forState:UIControlStateNormal];
        [_newsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _newsButton.titleLabel.font = KFontSize(12);
        [_newsButton verticalCenterImageAndTitle:scaleX(6)];
    }
    return _newsButton;
}

- (UIImageView *)centerImageView{
    if (!_centerImageView) {
        _centerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.jpg"]];
        _centerImageView.frame = CGRectMake(0, CGRectGetMaxY(self.userButton.frame), KWIDTH, scaleX(140));
    }
    return _centerImageView;
}

@end
