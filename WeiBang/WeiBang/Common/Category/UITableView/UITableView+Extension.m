//
//  UITableView+Extension.m
//  WeiBang
//
//  Created by tchzt on 2019/2/11.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

//注册cell
- (void)regsiterCellWithCellClass:(Class)cls isNib:(BOOL)nib{
    if (nib) {
        [self registerNib:[UINib nibWithNibName:NSStringFromClass(cls) bundle:nil] forCellReuseIdentifier:NSStringFromClass(cls)];
    }else{
        [self registerClass:cls forCellReuseIdentifier:NSStringFromClass(cls)];
    }
}

//隐藏下划线
- (void)hideUnderLine{
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}


@end
