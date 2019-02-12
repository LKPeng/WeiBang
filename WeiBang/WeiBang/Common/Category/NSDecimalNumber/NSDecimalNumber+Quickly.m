
	//
//  NSDecimalNumber+Quickly.m
//  December
//
//  Created by Wangguibin on 2016/11/21.
//  Copyright © 2016年 王贵彬. All rights reserved.
//

#import "NSDecimalNumber+Quickly.h"

@implementation NSDecimalNumber (Quickly)
	//加
- (NSDecimalNumber *(^)(NSDecimalNumber *temp))add
{
	return ^(NSDecimalNumber *temp){
		NSDecimalNumber *num = [self decimalNumberByAdding:temp];
		return num;
	};
}

	//减
- (NSDecimalNumber *(^)(NSDecimalNumber *temp))sub{
	return ^(NSDecimalNumber *temp){

		NSDecimalNumber *num = [self decimalNumberBySubtracting: temp];
		return num;
	};
}

	//乘
- (NSDecimalNumber *(^)(NSDecimalNumber *temp))mul{
	return ^(NSDecimalNumber *temp){
		NSDecimalNumber *num = [self decimalNumberByMultiplyingBy: temp];
		return num;
	};
}

	//除
- (NSDecimalNumber *(^)(NSDecimalNumber *temp))div{
	return ^(NSDecimalNumber *temp){
		if (temp.floatValue == 0) { // 0 好像不能作为除数来着
			return  [@"1" decimalNumber];
		}
		NSDecimalNumber *num = [self decimalNumberByDividingBy: temp];
		return num;
	};
}

@end


@implementation NSString(DecimalNumberCategory)

- (NSDecimalNumber *)decimalNumber{
	return [NSDecimalNumber decimalNumberWithString: self];
}

@end



