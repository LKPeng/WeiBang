//
//  MsgHeadView.m
//  WeiBang
//
//  Created by tchzt on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MsgHeadView.h"
#import "HomeView.h"

@implementation MsgHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = KWhiteColor;
        [self setup];
    }
    return self;
}

- (void)setup{
    
    UIView *headView = [[UIView alloc]init];
    headView.backgroundColor = RGB(221, 230, 240);
    [self addSubview:headView];
    
    HomeView *home = [[HomeView alloc]init];
    [self addSubview:home];
    
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(scaleX_6(330));
        make.height.mas_equalTo(scaleY_6(60));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.equalTo(self);
    }];
    
    [home mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(scaleY_6(250));
        make.left.right.equalTo(self);
        make.top.equalTo(headView.mas_bottom).offset(scaleY_6(10));
    }];
    
    
    UILabel *pingLable = [[UILabel alloc]init];
    pingLable.text = @"专注小额借贷的网贷投资平台";
    pingLable.font = kFontSize6(17);
    [headView addSubview:pingLable];
    
    [pingLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(headView.mas_top).offset(scaleY_6(20));
//        make.height.mas_equalTo(scaleY_6(20));
        make.centerY.mas_equalTo(headView.mas_centerY);
        make.centerX.mas_equalTo(headView.mas_centerX);
    }];
}
@end
