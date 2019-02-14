//
//  AppDelegate.h
//  WeiBang
//
//  Created by tchzt on 2019/2/1.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBGestureBaseController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) BBGestureBaseView *gestureBaseView;

+ (AppDelegate* )shareAppDelegate;

@end

