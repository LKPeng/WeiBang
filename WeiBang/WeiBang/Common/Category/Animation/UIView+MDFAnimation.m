//
//  UIView+Animation.m
//  JDBClient
//
//  Created by Tu You on 14/12/29.
//  Copyright (c) 2014年 JDB. All rights reserved.
//

#import "UIView+MDFAnimation.h"
#import "MDFAnimation.h"

@implementation UIView (MDFAnimation)

- (void)mdf_shake
{
    CAAnimation *shakeAnimation = [MDFAnimation mdf_shakeWithDuration:0.08 fromValue:-4 toValue:4 repeatCount:3];
    [self.layer addAnimation:shakeAnimation forKey:@"mdf.shake"];
}

@end
