//
//  RNOLNewHandInvestModel.h
//  RongNiuOnline
//
//  Created by apple on 2018/7/3.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RNOLNewHandInvestModel : NSObject
@property(nonatomic, copy)NSString *repayType;//还款方式
@property(nonatomic, copy)NSString *projectName;//项目名称
@property(nonatomic, copy)NSString *status;//项目状态
@property(nonatomic, copy)NSString *isNewInvestorOnly;//是否为新手标
@property(nonatomic, copy)NSString *period;//期限
@property(nonatomic, copy)NSString *restMoney;//剩余金额
@property(nonatomic, copy)NSString *borrowAmount;//借款总金额
@property(nonatomic, copy)NSString *type;//类型
@property(nonatomic, copy)NSString *title;//标题
@property(nonatomic, copy)NSString *projectId;//项目id
@property(nonatomic, copy)NSString *days;//募集天数
@property(nonatomic, copy)NSString *annualRate;//年利率
@property(nonatomic, copy)NSString *projectType;//标的类型
@property(nonatomic, copy)NSString *restTime;//募集剩余时间
@property(nonatomic, copy)NSString *additionAlannualRate;//附加年利率

@end
