//
//  InvestContectView.h
//  WeiBang
//
//  Created by tchzt on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvestContectView : UIView
/* 项目起息 */
@property (strong, nonatomic) UILabel *origin;
/* 还款方式 */
@property (strong, nonatomic) UILabel *returnWay;
/* 剩余时间 */
@property (strong, nonatomic) UILabel *time;
/* 是否奖励 */
@property (strong, nonatomic) UILabel *award;

- (CGFloat)viewHeight;
@end
