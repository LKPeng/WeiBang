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
#import "MyAccountViewController.h"

#import "WBNavigantionController.h"


@interface WBTabBarController ()

@end

@implementation WBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildViewController];
}
- (void)setUpAllChildViewController {
    
    HomeViewController *home = [[HomeViewController alloc] init];
    [self setUpOneChildViewController:home image:[UIImage imageNamed:@"TabBarHomeNormal"] selectedImage:[UIImage imageNamed:@"TabBarHomeSelected"] title:@"Home"];
    
    MsgViewController *msg = [[MsgViewController alloc] init];
    [self setUpOneChildViewController:msg image:[UIImage imageNamed:@"TabBarUserNormal"] selectedImage:[UIImage imageNamed:@"TabBarUserSelected"] title:@"User"];
    
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"TabBarUserNormal"] selectedImage:[UIImage imageNamed:@"TabBarUserSelected"] title:@"User"];
    
    MyAccountViewController *me = [[MyAccountViewController alloc] init];
    [self setUpOneChildViewController:me image:[UIImage imageNamed:@"TabBarUserNormal"] selectedImage:[UIImage imageNamed:@"TabBarUserSelected"] title:@"User"];
}
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title {
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    WBNavigantionController *nav = [[WBNavigantionController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
