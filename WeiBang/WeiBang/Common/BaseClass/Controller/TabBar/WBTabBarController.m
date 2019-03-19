//
//  WBTabBarController.m
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "WBTabBarController.h"

#import "HomeController.h"
#import "ProductListController.h"
//#import "MeViewController.h"
//#import "DiscoverViewController.h"

#import "WBNavigantionController.h"

#import "MyWalletViewController.h"
#import "MoreViewController.h"

#define navBackGroundColor kappMainGreen
#define navTintColor [UIColor whiteColor]
#define titleColor [UIColor whiteColor]
#define My_BaDouNavigationTitleFont [UIFont boldSystemFontOfSize:17]

@interface WBTabBarController ()<UITabBarControllerDelegate>

@end

@implementation WBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildViewController];
    self.delegate = self;
}
- (void)setUpAllChildViewController {
    
    HomeController *home = [[HomeController alloc] init];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"nav_home"] selectedImage:[UIImage imageNamed:@"nav_home"] title:@"首页"];
    
    ProductListController *msg = [[ProductListController alloc] init];
    [self setUpOneChildViewController:msg image:[UIImage imageNamed:@"nav_find"] selectedImage:[UIImage imageNamed:@"nav_find"] title:@"产品列表"];
    
    MyWalletViewController *dis = [[MyWalletViewController alloc] init];
    [self setUpOneChildViewController:dis image:[UIImage imageNamed:@"nav_find"] selectedImage:[UIImage imageNamed:@"nav_find"] title:@"我的钱袋"];
    
    MoreViewController *me = [[MoreViewController alloc] init];
    [self setUpOneChildViewController:me image:[UIImage imageNamed:@"nav_me"] selectedImage:[UIImage imageNamed:@"nav_me"] title:@"更多"];
}
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title {
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    WBNavigantionController *nav = [[WBNavigantionController alloc] initWithRootViewController:vc];
    [self setNavigation:nav];
    [self addChildViewController:nav];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setNavigation:(UINavigationController *)nav{
    nav.navigationBar.barTintColor = !navBackGroundColor ? [UIColor whiteColor] : navBackGroundColor;
    nav.navigationBar.tintColor = navTintColor ;
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    
    textAttrs[NSForegroundColorAttributeName] = titleColor;//标题文字颜色
    textAttrs[NSFontAttributeName] = My_BaDouNavigationTitleFont ; //标题文体大小
    
    
    
    NSShadow * shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(0, 0);
    textAttrs[NSShadowAttributeName] = shadow;
    nav.navigationBar.titleTextAttributes = textAttrs;
    
}


@end



