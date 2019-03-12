//
//  InvestHeadView.h
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InvestHeadView : UIView

/**
 * <#注释#>
 */
@property (nonatomic,assign) CGFloat viewHeight;


-(void)setDataWithIndexPath:(NSInteger)indexPath;

@end

NS_ASSUME_NONNULL_END
