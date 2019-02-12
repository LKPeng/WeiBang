//
//  NSDate+Extension.m
//  WeiBang
//
//  Created by tchzt on 2019/2/11.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSDate *)dateAddTimeZone:(NSDate *)date{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *zoneDate = [date  dateByAddingTimeInterval:interval];
    return zoneDate;
}

/**
 *  将0时区的时间转成0时区的时间戳
 */
+ (NSString *)transformToTimestampWithDate:(NSDate *)date{
    NSTimeInterval inter = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%ld", (long)inter];
}

/**
 *  将0时区的时间戳转成0时区的时间
 */
+ (NSDate *)transformToDateWithTimestamp:(NSString *)timestamp{
    NSTimeInterval inter = [timestamp doubleValue];
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:inter];
    return date;
}

/**
 *  将0时区的时间戳转成8时区的时间文本格式（“2015-12-13 13：34：45”）
 */
+ (NSString *)transformToStringWithTimestamp:(NSString *)timestamp{
    //1.先将时间戳->NSDate
    NSDate *date = [self transformToDateWithTimestamp:timestamp];
    //2.将date->NSString
    return [[self transformToStringWithDate:date] substringToIndex:16];
}


/**
 *  将0时区的时间戳(10位数)转成8时区的时间文本格式（“2012-12-12 12：12”）,带有只有时分的
 */
+ (NSString *)transformToHourMiniteFormatWithTimestamp:(NSString *)timestamp{
    //1.先将时间戳->NSDate
    NSDate *date = [self transformToDateWithTimestamp:timestamp];
    //2.将date->NSString
    return [[self transformToStringWithDate:date] substringToIndex:13];
}

/**
 *  将8时区的时间文本格式（“2015-12-13 13：34：45”）转成 0时区的时间戳
 */
+ (NSString *)transformToTimestampWithString:(NSString *)string{
    //1.先将NSString->NSDate
    NSDate *date = [self transformToDateWithString:string];
    //2.将date->timestamp
    return [self transformToStringWithDate:date];
}

/**
 *  将8时区的时间文本格式（“2015-12-13 13：34：45”）转成 0时区的NSDate
 */
+ (NSDate *)transformToDateWithString:(NSString *)string{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[NSLocale currentLocale]];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [df dateFromString:string];
    return date;
}

/**
 *  将0时区的NSDate转成 8时区的时间文本格式（“2015-12-13 13：34：45”）
 */
+ (NSString *)transformToStringWithDate:(NSDate *)date{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setLocale:[NSLocale currentLocale]];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *string = [df stringFromDate:date];
    return string;
}

#pragma mark- iOS-两种时间格式实现几天前，几小时前，几分钟前
//后台给的格式为yyyy-MM-dd HH:mm:ss.SSS
+ (NSString *) compareCurrentTime:(NSString *)str
{
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    
    //得到与当前时间差
    NSTimeInterval  timeInterval = [timeDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    //标准时间和北京时间差8个小时
    timeInterval = timeInterval - 8*60*60;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}

//后台给的格式为 纯数字1352170595000(13位)
- (NSString *)updateTimeWithTimeStamp:(NSString *)timeStamp {
    // 获取当前时时间戳 1466386762.345715 十位整数 6位小数
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    // 后台返回的时间 一般是13位数字
    NSTimeInterval createTime = timeStamp.integerValue/1000;
    // 时间差
    NSTimeInterval time = currentTime - createTime;
    
    if(time<60){
        
        return @"刚刚";
    }
    
    //秒转分钟
    NSInteger minute = time/60;
    if (minute < 60) {
        return [NSString stringWithFormat:@"%ld分钟前",minute];
    }
    // 秒转小时
    NSInteger hours = time/3600;
    if (hours<24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    //秒转天数
    NSInteger days = time/3600/24;
    if (days < 30) {
        return [NSString stringWithFormat:@"%ld天前",days];
    }
    //秒转月
    NSInteger months = time/3600/24/30;
    if (months < 12) {
        return [NSString stringWithFormat:@"%ld月前",months];
    }
    //秒转年
    NSInteger years = time/3600/24/30/12;
    return [NSString stringWithFormat:@"%ld年前",years];
}

@end
