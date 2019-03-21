//
//  CopyrightTipLabel.m
//  WeiBang
//
//  Created by XXX on 2019/3/20.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "CopyrightTipLabel.h"

@implementation CopyrightTipLabel

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    self.textColor = [UIColor lightGrayColor];
    self.font = [UIFont systemFontOfSize:scaleX_6(10)];
    self.text = @"© 2018 杭州中民贷通投资控股有限公司 Copyright Reserved";
    self.textAlignment = NSTextAlignmentCenter;
    
    if (self) {
        
    }
    return self;
}

@end
