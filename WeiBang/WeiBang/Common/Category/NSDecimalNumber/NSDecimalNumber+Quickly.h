//
//  NSDecimalNumber+Quickly.h
//  December
//
//  Created by Wangguibin on 2016/11/21.
//  Copyright © 2016年 王贵彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber (Quickly)

- (NSDecimalNumber *(^)(NSDecimalNumber *temp))add;//加
- (NSDecimalNumber *(^)(NSDecimalNumber *temp))sub;//减
- (NSDecimalNumber *(^)(NSDecimalNumber *temp))mul;//乘
- (NSDecimalNumber *(^)(NSDecimalNumber *temp))div;//除


@end

@interface NSString (DecimalNumberCategory)

- (NSDecimalNumber *)decimalNumber;

@end
