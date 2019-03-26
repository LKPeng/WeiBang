//
//  DiscoverHeaderView.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/26.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "DiscoverHeaderView.h"
#import "PlanADScrollView.h"
#import "RNOLHomeNoticeView.h"
#import "DiscoverCellTitleView.h"
#import "HomeItemView.h"

@interface DiscoverHeaderView()<PlanADScrollViewDelegate>
@property(strong,nonatomic) PlanADScrollView *bannerView;
@property(strong,nonatomic) RNOLHomeNoticeView *noticeView1;
@end


@implementation DiscoverHeaderView

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
    [self addSubview:self.bannerView];
    [self addIconView];
    [self addSubview:self.noticeView1];
    DiscoverCellTitleView *cellTitleView = [[DiscoverCellTitleView alloc] initWithFrame:CGRectMake(0, scaleX(260), KWIDTH, scaleX(30))];
    [self addSubview:cellTitleView];
}

-(void)addIconView{
    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"HomeItemView" owner:self options:nil];
    HomeItemView *itemView = [arr lastObject];
    itemView.frame = CGRectMake(0, CGRectGetMaxY(self.bannerView.frame), KWIDTH, scaleX(80));
    [self addSubview:itemView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.bannerView.frame), KWIDTH, scaleX(80))];
    [btn addTarget:self action:@selector(tipFunction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}

-(void)tipFunction{
    [MBProgressHUD showMessage:@"敬请期待..."];
}

- (PlanADScrollView *)bannerView{
    if (!_bannerView) {
        NSArray *imageUrl1s = @[@"1.jpg",@"2.jpg"];
        _bannerView =[[PlanADScrollView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, scaleX(140))imageUrls:imageUrl1s placeholderimage:nil];
        _bannerView.delegate = self;
        _bannerView.pageContolStyle = PlanPageContolStyleNone;
    }
    return _bannerView;
}

- (RNOLHomeNoticeView *)noticeView1{
    if (!_noticeView1) {
        _noticeView1 = [[RNOLHomeNoticeView alloc] initWithFrame:CGRectMake(0, scaleX(220.5), KWIDTH , scaleX(35))];
        _noticeView1.backgroundColor = KWhiteColor;
        _noticeView1.msgArray = @[@"[长期有效]和大牛一起晒出借拿99元奖金",@"p友圈怎么玩?速速了解>>"];
    }
    return _noticeView1;
}

- (void)PlanADScrollViewdidSelectAtIndex:(NSInteger)index {}

@end
