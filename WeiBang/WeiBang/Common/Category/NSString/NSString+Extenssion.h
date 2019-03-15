//
//  NSString+Extenssion.h
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Extenssion)
///MARK:- 文本自适应高度计算
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;


-(BOOL)isBlank;//清除空格之后
-(BOOL)isValid;//检查是否有效

- (NSString *)removeWhiteSpacesFromString;

- (NSUInteger)countNumberOfWords;
- (BOOL)containsString:(NSString *)subString;
- (BOOL)isBeginsWith:(NSString *)string;
- (BOOL)isEndssWith:(NSString *)string;

//替换某些子串
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;
- (NSString *)wgb_replaceOriginalStr:(NSString *)originalStr ReplaceStr:(NSString *)replaceStr;

- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;
- (NSString *)addString:(NSString *)string;
- (NSString *)removeSubString:(NSString *)subString;

- (BOOL)containsOnlyLetters;
- (BOOL)containsOnlyNumbers;
- (BOOL)containsOnlyNumbersAndLetters;
- (BOOL)isInThisarray:(NSArray*)array;


- (NSString *)getMyApplicationVersion;
+ (NSString *)getMyApplicationName;

- (NSData *)convertToData;
+ (NSString *)getStringFromData:(NSData *)data;

- (BOOL)isValidEmail;

// 正则判断手机号码格式
- (BOOL)isValidPhoneNumber;
- (BOOL)isMobileNumber;
- (BOOL)isValidUrl;

//判断是否是身份证号
- (BOOL)judgeIdentityStringValid;

/*!
 *  @author  WGB  , 16-05-10 10:05:28
 *
 *  @brief 根据文本内容返回自适应的尺寸
 *
 *  @param size 给定一个尺寸范围
 *  @param font 文本字体
 *
 *  @return 返回一个自适应的尺寸大小
 */
- (CGSize)boundingRectWithSize:(CGSize)size withFont:(NSInteger)font;



/*!
 * @author WGB, 16-04-07 09:04:12
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryTransformWithJsonString:(NSString *)jsonString;


/*!
 *  @author WGB, 16-04-07 09:04:52
 *
 *  @brief  @{字典}  转 @"字符串" 方法
 *
 *  @param params 字典
 *
 *  @return 字符串
 */
+ (NSString *)stringTransformWithObject:(NSDictionary*)params;


#pragma mark- 过滤字符串中的HTML标签-- 不用webview或者富文本渲染就过滤掉吧
+ (NSString *)filterHTML:(NSString *)html ;

///MARK:- 富文本加行间距
-(NSMutableAttributedString*)attributedStringWithLineSpacing:(CGFloat)spacing ;

//移除最后一个字符
+ (NSString*)removeLastOneChar:(NSString*)origin;




/**
 *  将阿拉伯数字转换为中文数字
 */
+(NSString *)translationArabicNum:(NSInteger)arabicNum;

@end
