//
//  WBStaticConstant.h
//  WeiBang
//
//  Created by tchzt on 2019/2/13.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

#define WB_EXTERN  FOUNDATION_EXTERN

///MARK:- 通知相关

// 监听网络状态的变化
WB_EXTERN NSString *const kNetworkingReachabilityStateChangeNotification;


// Screen system to return gesture.（是否屏蔽系统返回手势）
WB_EXTERN const Boolean BBIsCanleSystemPan;
// The distance from the left can be automatically returned.(距离左边多少距离，可以自动返回)
WB_EXTERN const CGFloat BBDistanceToLeft;
// BottomView Scaling.(底层缩放比例)
WB_EXTERN const CGFloat BBWindowToScale;
// BottomView alpha.(底层透明度)
WB_EXTERN const CGFloat BBMaskingAlpha;
// Automatic return speed.(自动返回速度)
WB_EXTERN const CGFloat BBGestureSpeed;
// Range of drag and drop.(拖拽的范围,大于此值才有效果)
WB_EXTERN const CGFloat BBDistanceToPan;
// The default is 0, 0 for full screen return, and also for distance.（默认为0，0为全屏返回，也可指定距离）
WB_EXTERN const CGFloat BBDistanceToStart;


typedef NS_ENUM(NSUInteger, RechargeType) {
    /** 全部 */
    RechargeTypeAll = 0,
    /** 收入 */
    RechargeTypeIncome = 1,
};
