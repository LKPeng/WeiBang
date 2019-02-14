//
//  AppautoSizeScale.h
//  lonfood
//
//  Created by 农畉 on 16/11/25.
//  Copyright © 2016年 农畉. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 * 屏幕适配
 */
@interface AppautoSizeScale : NSObject
CGFloat scaleX(CGFloat value);
CGFloat scaleY(CGFloat value);
CGFloat autoSizeScale();

#pragma mark - iPhone6尺寸
CGFloat scaleX_6(CGFloat value);
CGFloat scaleY_6(CGFloat value);
CGFloat autoSizeScale6();
@end
