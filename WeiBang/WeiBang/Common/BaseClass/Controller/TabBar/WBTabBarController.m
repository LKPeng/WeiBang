//
//  WBTabBarController.m
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "WBTabBarController.h"

#import "HomeViewController.h"
#import "MsgViewController.h"
#import "DiscoverViewController.h"

#import "MeViewController.h"
//#import "DiscoverViewController.h"

#import "WBNavigantionController.h"
#import "HTLoginViewController.h"


#define navBackGroundColor KWhiteColor
#define navTintColor [UIColor blackColor]
#define titleColor [UIColor blackColor]
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

    HomeViewController *home = [[HomeViewController alloc] init];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"nav_home"] selectedImage:[UIImage imageNamed:@"nav_home"] title:@"首页"];
    
    MsgViewController *msg = [[MsgViewController alloc] init];
    [self setUpOneChildViewController:msg image:[UIImage imageNamed:@"nav_find"] selectedImage:[UIImage imageNamed:@"nav_find"] title:@"产品"];
    
    DiscoverViewController *dis = [[DiscoverViewController alloc] init];
    [self setUpOneChildViewController:dis image:[UIImage imageNamed:@"nav_news"] selectedImage:[UIImage imageNamed:@"nav_news"] title:@"发现"];
    
    MeViewController *me = [[MeViewController alloc] init];
    [self setUpOneChildViewController:me image:[UIImage imageNamed:@"nav_me"] selectedImage:[UIImage imageNamed:@"nav_me"] title:@"我的"];
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


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    NSString * longinBool = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_login"];
    //判断用户是否登陆
//    if ([longinBool isEqualToString:@"YES"]) {
//
//    }else{
//        //这里拿到你想要的tabBarItem,这里的方法有很多,还有通过tag值,这里看你的需要了
//        if ([viewController.tabBarItem.title isEqualToString:@"更多"]) {
//            HTLoginViewController *vc = [HTLoginViewController new];
//            WBNavigantionController *nav = [[WBNavigantionController alloc] initWithRootViewController:vc];
//            [self setNavigation:nav];
//            [self presentViewController:nav animated:YES completion:nil];
//            //这里的NO是关键,如果是这个tabBarItem,就不要让他点击进去
//            return NO;
//        }
//    }
    //当然其余的还是要点击进去的
    return YES;
}



@end



