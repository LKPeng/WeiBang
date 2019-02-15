//
//  UITableViewCell+Extension.m
//  WeiBang
//
//  Created by tchzt on 2019/2/11.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "UITableViewCell+Extension.h"

@implementation UITableViewCell (Extension)

//复用ID
+ (NSString *)cellReuseID{
    return NSStringFromClass([self class]);
}

//清除选中效果 选中背景
- (void)cleanCellSelectBackgroundStyle{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
