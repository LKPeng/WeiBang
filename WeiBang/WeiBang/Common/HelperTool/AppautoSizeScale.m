//
//  AppautoSizeScale.m
//  lonfood
//
//  Created by 农畉 on 16/11/25.
//  Copyright © 2016年 农畉. All rights reserved.
//

#import "AppautoSizeScale.h"
//6 :375 667 
@implementation AppautoSizeScale
CGFloat autoSizeScaleX()
{
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat autoSizeScaleX = 1.0f;
    if ([[UIScreen mainScreen] bounds].size.height > 480.0f) {
        autoSizeScaleX = screenWidth / 320.0f;
    }
    return autoSizeScaleX;
}

CGFloat autoSizeScaleY()
{
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    CGFloat autoSizeScaleY = 1.0f;
    if (screenHeight > 480.0f) {
        autoSizeScaleY = screenHeight / 568.0f;
    }
    if IS_Iphone_X{
        NSLog(@"是iPhone X")
        autoSizeScaleY = 667.0f / 568.0f;
        if (KWIDTH == 414) {
            autoSizeScaleY = 736 / 568.0f;
            NSLog(@"是iPhone XS Max")
        }
        
    }
    return autoSizeScaleY;
}

CGFloat autoSizeScale()
{
    if ([[UIScreen mainScreen] bounds].size.height > 568.0f) {
        NSLog(@"当前比例为%f",MIN(autoSizeScaleX(), autoSizeScaleY()));
        return MIN(autoSizeScaleX(), autoSizeScaleY());
    }
    return 1.0f;
}

CGFloat scaleX(CGFloat value)
{
    return value * autoSizeScaleX();
}

CGFloat scaleY(CGFloat value)
{
    return value * autoSizeScaleY();
}

#pragma mark - iPhone6尺寸
//CGFloat autoSizeScaleX6()
//{
//    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
//    CGFloat autoSizeScaleX = 1.0f;
//    if ([[UIScreen mainScreen] bounds].size.height > 667.0f) {
//        autoSizeScaleX = screenWidth / 320.0;
//    }
//    return autoSizeScaleX;
//}
//
//CGFloat autoSizeScaleY6()
//{
//    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
//    CGFloat autoSizeScaleY = 1.0f;
//    if (screenHeight > 667.0f) {
//        autoSizeScaleY = screenHeight / 568.0f;
//    }
//    return autoSizeScaleY;
//}

CGFloat scaleX_6(CGFloat value)
{
    return value * autoSizeScaleX() * (320.0/375.0);
}

CGFloat scaleY_6(CGFloat value)
{
    return value * autoSizeScaleY() * (568/667.0);
}

CGFloat autoSizeScale6()
{
    if ([[UIScreen mainScreen] bounds].size.width == 320) {
        return autoSizeScale() * (480/667.0);
    }
    return autoSizeScale() * (568/667.0);
    //    if ([[UIScreen mainScreen] bounds].size.height > 667.0f) {
    //        return MIN(autoSizeScaleX(), autoSizeScaleY());
    //    }
    //    return 1.0f;
}
@end
