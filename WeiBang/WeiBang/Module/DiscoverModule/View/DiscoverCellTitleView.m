//
//  DiscoverCellTitleView.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/26.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "DiscoverCellTitleView.h"

@interface DiscoverCellTitleView()

@end

@implementation DiscoverCellTitleView

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
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tuijian"]];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(scaleX(0));
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(imageView.mas_height);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"热点推荐";
    titleLabel.font = [UIFont boldSystemFontOfSize:scaleX(14)];
    [titleLabel setTextColor:[UIColor blackColor]];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.leading.mas_equalTo(imageView.mas_trailing);
    }];
}

@end
