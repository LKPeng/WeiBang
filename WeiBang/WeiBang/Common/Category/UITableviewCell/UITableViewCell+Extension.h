//
//  UITableViewCell+Extension.h
//  WeiBang
//
//  Created by tchzt on 2019/2/11.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Extension)
//复用ID
+ (NSString *)cellReuseID;

//清除选中效果 选中背景
- (void)cleanCellSelectBackgroundStyle;


@end
