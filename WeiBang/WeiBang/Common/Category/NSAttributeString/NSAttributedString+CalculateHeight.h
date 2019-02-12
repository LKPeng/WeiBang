//
//  NSAttributedString+CalculateHeight.h
//  JJYSPlusPlus
//
//  Created by Wangguibin on 2017/3/31.
//  Copyright © 2017年 王贵彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (CalculateHeight)
/*
 *  return 动态返回字符串size大小
 *
 *  @param aString 字符串
 *  @param width   指定宽度
 *  @param height  指定宽度
 *
 *  @return CGSize
 */
+ (CGSize)getStringRect:(NSAttributedString *)aString width:(CGFloat)width height:(CGFloat)height font:(UIFont *)font ;

@end
