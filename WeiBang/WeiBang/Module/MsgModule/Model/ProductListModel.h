//
//  ProductListModel.h
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/19.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductListModel : NSObject
//进度
@property (nonatomic ,assign) CGFloat Progress;
//期限
@property (nonatomic ,assign) NSInteger term;
//总额
@property (nonatomic ,assign) CGFloat total;
//起投金额
@property (nonatomic ,assign) NSInteger startAccount;
//银票通30天
@property (nonatomic ,strong) NSString *moneyTerm;

//进度
@property (nonatomic ,assign) CGFloat Profit;
@end

NS_ASSUME_NONNULL_END
