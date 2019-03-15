//
//  MyInvestmentSubController.h
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/15.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyInvestmentSubController : UIViewController

//- (RechargeType)type;
//
//- (void)topicReflash:(RechargeType)type;//提供方法给子类调用：用于刷新


@property (nonatomic,assign) RechargeType registerType;
@end

NS_ASSUME_NONNULL_END
