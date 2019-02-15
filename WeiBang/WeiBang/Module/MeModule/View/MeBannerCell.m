//
//  MeBannerCell.m
//  WeiBang
//
//  Created by tchzt on 2019/2/15.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MeBannerCell.h"
@interface MeBannerCell()<SDCycleScrollViewDelegate>
@property (nonatomic,strong) SDCycleScrollView *bannerView;
@end
@implementation MeBannerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self addSubview: self.bannerView];
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

#pragma mark- <SDCycleScrollViewDelegate>
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
}


#pragma mark ----   懒加载  ----
- (SDCycleScrollView *)bannerView{
    if (!_bannerView) {
        _bannerView = [[SDCycleScrollView alloc] init];
        _bannerView.imageURLStringsGroup = @[@"https://www.rongniu360.com/cmsImages/51269F32CCA3D60FC18EC7C727284768.jpg"];
        _bannerView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        _bannerView.showPageControl = YES;
        _bannerView.delegate = self;
        _bannerView.autoScrollTimeInterval = 2;
        _bannerView.pageDotColor = [UIColor whiteColor];
        _bannerView.pageControlDotSize = CGSizeMake(8, 8);
        _bannerView.currentPageDotColor = RGB(191, 151, 20);
    }
    return _bannerView;
}


@end
