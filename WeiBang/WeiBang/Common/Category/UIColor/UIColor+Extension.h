//
//  UIColor+Extension.h
//  WeiBang
//
//  Created by tchzt on 2019/2/11.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
//从十六进制字符串获取颜色，
+ (UIColor *)colorWithHexString:(NSString *)color;
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

// 注意转换出来的字符串不带＃号
+(NSString*)toStrByUIColor:(UIColor*)color ;
@end
