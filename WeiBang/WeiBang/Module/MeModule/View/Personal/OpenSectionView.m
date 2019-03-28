//
//  OpenSectionView.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "OpenSectionView.h"

@implementation OpenSectionView

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
    UILabel *title = [[UILabel alloc]init];
    [self addSubview:title];
    self.title = title;
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(scaleX_6(10));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
}

@end
