//
//  UITableView+Extension.h
//  WeiBang
//
//  Created by tchzt on 2019/2/11.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extension)

//注册cell
- (void)regsiterCellWithCellClass:(Class)cls isNib:(BOOL)nib;

//隐藏下划线
- (void)hideUnderLine;


@end
