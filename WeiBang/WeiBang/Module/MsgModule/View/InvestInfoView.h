//
//  InvestInfoView.h
//  WeiBang
//
//  Created by tchzt on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvestInfoView : UIView
/* 可投金额 */
@property (strong, nonatomic) UILabel *canAmount;
/* 最低起投金额 */
@property (strong, nonatomic) UILabel *smallAmount;
/* 最高起投金额 */
@property (strong, nonatomic) UILabel *highAmount;
/* 投标奖励 */
@property (strong, nonatomic) UILabel *awardAmount;

- (CGFloat)viewHeight;
@end
