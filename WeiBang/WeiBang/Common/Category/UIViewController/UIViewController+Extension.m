//
//  UIViewController+Extension.m
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (void)setupNavBarTitleViewWithText:(NSString *)text {
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 35)];
    titleLable.textColor = [UIColor blackColor];
    titleLable.font = KFontSize(17);
    titleLable.text = text;
    titleLable.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLable;
}

#pragma mark- 添加导航栏右侧的按钮
- (void)setRightItemButtons:(NSArray *)buttons{
    NSMutableArray *itemButtons = [NSMutableArray array];
    [buttons enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL * _Nonnull stop) {
        UIBarButtonItem *itemButton = [[UIBarButtonItem alloc]initWithCustomView:button];
        [itemButtons addObject:itemButton];
    }];
    self.navigationItem.rightBarButtonItems = itemButtons;
}

#pragma mark- 添加左边返回按钮
- (void)addNavgationLeftBackButton{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 44, 44);
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    UIImage *leftButtonImg = [UIImage imageNamed:@"rnol_navgaition_leftItem_back"];
    [leftButton setImage: leftButtonImg
                forState:UIControlStateNormal];
    //        leftButton.backgroundColor = [UIColor redColor];
    [leftButton addTarget:self action:@selector(backPopVCAction) forControlEvents:UIControlEventTouchUpInside];
    // 修改导航栏左边的item
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}

- (void)backPopVCAction{
    
}



- (void)setupNavBarRightButtonWithTitle:(NSString *)title {
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.width = 44;
    rightButton.height = 30;
    rightButton.x = SCREEN_WIDTH - rightButton.width;
    rightButton.y = 0;
    rightButton.titleLabel.font = KFontSize(17);
    rightButton.touchAreaInsets = UIEdgeInsetsMake(-10, -40, 0, -20);
    [rightButton setTitle:title forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(navRightAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

- (void)navRightAction:(UIButton *)button{
}

- (void)setupNavBarLeftButtonWithTitle:(NSString *)title {
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.width = 44;
    leftButton.height = 30;
    leftButton.x = 0;
    leftButton.y = 0;
    leftButton.titleLabel.font = KFontSize(17);
    leftButton.touchAreaInsets = UIEdgeInsetsMake(0, -10, -10, -20);
    [leftButton setTitle:title forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(navLeftAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}

- (void)navLeftAction:(UIButton *)button{
}


- (void)addNavLeftButtonWithImage:(NSString *)imageName {
    UIBarButtonItem *leftBarItme = [UIBarButtonItem initWithNormalImage:imageName target:self action:@selector(leftBarButtonAction)];
    self.navigationItem.leftBarButtonItem = leftBarItme;
}

- (void)addNavRightButtonWithImage:(NSString *)imageName {
    UIBarButtonItem *rightBarItme = [UIBarButtonItem initWithNormalImage:imageName target:self action:@selector(rightBarButtonAction)];
    self.navigationItem.rightBarButtonItem = rightBarItme;
}

- (void)leftBarButtonAction {
    
}

- (void)rightBarButtonAction {
    
}

@end
