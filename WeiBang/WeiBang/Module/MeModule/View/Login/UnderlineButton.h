//
//  UnderlineButton.h
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/15.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UnderlineButton : UIButton
{
    UIColor *lineColor;
}
-(void)setColor:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
