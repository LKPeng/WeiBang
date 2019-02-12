//
//  NSAttributedString+CalculateHeight.m
//  JJYSPlusPlus
//
//  Created by Wangguibin on 2017/3/31.
//  Copyright © 2017年 王贵彬. All rights reserved.
//

#import "NSAttributedString+CalculateHeight.h"

@implementation NSAttributedString (CalculateHeight)
/*
*  return 动态返回字符串size大小
*
*  @param aString 字符串
*  @param width   指定宽度
*  @param height  指定宽度
*
*  @return CGSize
*/
+ (CGSize)getStringRect:(NSAttributedString *)aString width:(CGFloat)width height:(CGFloat)height font:(UIFont *)font
{
	CGSize size = CGSizeZero;
	if (!aString) {
		return size;
	}
	NSMutableAttributedString *atrString = [[NSMutableAttributedString alloc] initWithAttributedString: aString];
	NSRange range = NSMakeRange(0, atrString.length);

		//获取指定位置上的属性信息，并返回与指定位置属性相同并且连续的字符串的范围信息。
	NSDictionary* dic = [atrString attributesAtIndex:0 effectiveRange:&range];
		//不存在段落属性，则存入默认值
	NSMutableParagraphStyle *paragraphStyle = dic[NSParagraphStyleAttributeName];
	if (!paragraphStyle || nil == paragraphStyle) {
		paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
		paragraphStyle.lineSpacing = 0.0;//增加行高
		paragraphStyle.headIndent = 0;//头部缩进，相当于左padding
		paragraphStyle.tailIndent = 0;//相当于右padding
		paragraphStyle.lineHeightMultiple = 0;//行间距是多少倍
		paragraphStyle.alignment = NSTextAlignmentLeft;//对齐方式
		paragraphStyle.firstLineHeadIndent = 0;//首行头缩进
		paragraphStyle.paragraphSpacing = 0;//段落后面的间距
		paragraphStyle.paragraphSpacingBefore = 0;//段落之前的间距
		[atrString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
	}

		//设置默认字体属性
	UIFont *fontTemp = dic[NSFontAttributeName];
	if (!fontTemp || nil == fontTemp) {
		fontTemp =  font;
		[atrString addAttribute:NSFontAttributeName value: fontTemp range:range];
	}

	NSMutableDictionary *attDic = [NSMutableDictionary dictionaryWithDictionary:dic];
	[attDic setObject:font forKey:NSFontAttributeName];
	[attDic setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
	CGSize strSize = [[aString string] boundingRectWithSize:CGSizeMake(width, height)
													options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
												 attributes:attDic
													context:nil].size;

	size = CGSizeMake(strSize.width, strSize.height);
	return size;
}
@end
