//
//  NSDate+Extension.h
//  WeiBang
//
//  Created by tchzt on 2019/2/11.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/**
 *  将NSDate类型转成带时区的date */
+ (NSDate *)dateAddTimeZone:(NSDate *)date;

/**
 *  将0时区的时间转成0时区的时间戳(10位数)
 */
+ (NSString *)transformToTimestampWithDate:(NSDate *)date;

/**
 *  将0时区的时间戳(10位数)转成0时区的时间
 */
+ (NSDate *)transformToDateWithTimestamp:(NSString *)timestamp;

/**
 *  将0时区的时间戳(10位数)转成8时区的时间文本格式（“2015-12-13 13：34：45”）
 */
+ (NSString *)transformToStringWithTimestamp:(NSString *)timestamp;

/**
 *  将0时区的时间戳(10位数)转成8时区的时间文本格式（“2012-12-12 12：12”）,带有只有时分的
 */
+ (NSString *)transformToHourMiniteFormatWithTimestamp:(NSString *)timestamp;

/**
 *  将8时区的时间文本格式（“2015-12-13 13：34：45”）转成 0时区的时间戳(10位数)
 */
+ (NSString *)transformToTimestampWithString:(NSString *)string;

/**
 *  将8时区的时间文本格式（“2015-12-13 13：34：45”）转成 0时区的NSDate
 */
+ (NSDate *)transformToDateWithString:(NSString *)string;

/**
 *  将0时区的NSDate转成 8时区的时间文本格式（“2015-12-13 13：34：45”）
 */
+ (NSString *)transformToStringWithDate:(NSDate *)date;

#pragma mark- iOS-两种时间格式实现几天前，几小时前，几分钟前
//后台给的格式为yyyy-MM-dd HH:mm:ss.SSS
+ (NSString *) compareCurrentTime:(NSString *)str ;
//后台给的格式为 纯数字1352170595000(13位)
- (NSString *)updateTimeWithTimeStamp:(NSString *)timeStamp;

@end
