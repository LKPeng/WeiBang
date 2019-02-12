//
//  UILabel+Attribute.h
//  DDYS
//
//  Created by 李树文 on 15/12/29.
//  Copyright © 2015年 lysw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Attribute)
/**
 *  设置UILabel中某一段文件的颜色属性
 *
 *  @param str   要改变颜色的文字
 *  @param color 要改变的颜色
 *
 */
-(void)moreColorWithAttributeString:(NSString *)str color:(UIColor *)color;
//加个字体
- (void)moreColorWithAttributeString:(NSString *)str color:(UIColor *)color font:(UIFont*)font;

/**
 *  设置UILabel中某一段文件的颜色属性
 *
 *  @param from  从该位置开始到最后的文字
 *  @param color 要改变的颜色
 */
-(void)moreColorFromIndex:(NSInteger)from color:(UIColor *)color;


/**  创建一个label  */
- (UILabel *)cloneLabWithFrame:(CGRect)frame
                 textAlignment:(NSTextAlignment)alignment
                          font:(UIFont *)font
                     textColor:(UIColor *)textColor
                          text:(NSString *)text
               backgroundColor:(UIColor *)bgColor;



//添加长按 copy  默认NO
@property (nonatomic,assign) BOOL isCopyable;







@end
