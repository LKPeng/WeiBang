//
//  UIViewController+Extension.h
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)
// 给导航栏添加标题
- (void)setupNavBarTitleViewWithText:(NSString *)text;
#pragma mark- 添加导航栏右侧的按钮
- (void)setRightItemButtons:(NSArray *)buttons ;
#pragma mark- 添加左边返回按钮
- (void)addNavgationLeftBackButton;


//导航栏按钮
- (void)setupNavBarRightButtonWithTitle:(NSString *)title;
- (void)setupNavBarLeftButtonWithTitle:(NSString *)title ;
- (void)addNavLeftButtonWithImage:(NSString *)imageName;
- (void)addNavRightButtonWithImage:(NSString *)imageName;

@end
