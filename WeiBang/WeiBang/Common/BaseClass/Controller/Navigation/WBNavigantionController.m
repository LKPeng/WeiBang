//
//  WBNavigantionController.m
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//


#import "WBNavigantionController.h"
#import "AppDelegate.h"
#import "WBGestureBaseController.h"


@interface WBNavigantionController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation WBNavigantionController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.arrayScreenshot = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    //屏蔽系统的手势
    self.interactivePopGestureRecognizer.enabled = !BBIsCanleSystemPan;
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    _panGesture.delegate = self;
    [self.view addGestureRecognizer:_panGesture];
}




- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.view == self.view && [gestureRecognizer locationInView:self.view].x < (BBDistanceToStart == 0 ? UIScreen.mainScreen.bounds.size.width : BBDistanceToStart)) {
        WBGestureBaseController *topView = (WBGestureBaseController *)self.topViewController;
        if (!topView.isEnablePanGesture)
            return NO;
        else {
            CGPoint translate = [gestureRecognizer translationInView:self.view];
            BOOL possible = translate.x != 0 && fabs(translate.y) == 0;
            if (possible)
                return YES;
            else
                return NO;
            return YES;
        }
    }
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([otherGestureRecognizer isKindOfClass:NSClassFromString(@"UIScrollViewPanGestureRecognizer")] || [otherGestureRecognizer isKindOfClass:NSClassFromString(@"UIPanGestureRecognizer")]|| [otherGestureRecognizer isKindOfClass:NSClassFromString(@"UIScrollViewPagingSwipeGestureRecognizer")]) {
        UIView *aView = otherGestureRecognizer.view;
        if ([aView isKindOfClass:[UIScrollView class]]) {
            UIScrollView *sv = (UIScrollView *)aView;
            if (sv.contentOffset.x==0) {
                return YES;
            }
        }
        return NO;
    }
    return YES;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *rootVC = appDelegate.window.rootViewController;
    UIViewController *presentedVC = rootVC.presentedViewController;
    if (self.viewControllers.count == 1) {
        return;
    }
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        appDelegate.gestureBaseView.hidden = NO;
    }
    else if (panGesture.state == UIGestureRecognizerStateChanged) {
        CGPoint point_inView = [panGesture translationInView:self.view];
        if (point_inView.x >= BBDistanceToPan) {
            rootVC.view.transform = CGAffineTransformMakeTranslation(point_inView.x - BBDistanceToPan, 0);
            presentedVC.view.transform = CGAffineTransformMakeTranslation(point_inView.x - BBDistanceToPan, 0);
        }
    }
    else if (panGesture.state == UIGestureRecognizerStateEnded) {
        CGPoint point_inView = [panGesture translationInView:self.view];
        if (point_inView.x >= BBDistanceToLeft) {
            [UIView animateWithDuration:BBGestureSpeed animations:^{
                rootVC.view.transform = CGAffineTransformMakeTranslation(([UIScreen mainScreen].bounds.size.width), 0);
                presentedVC.view.transform = CGAffineTransformMakeTranslation(([UIScreen mainScreen].bounds.size.width), 0);
            } completion:^(BOOL finished) {
                [self popViewControllerAnimated:NO];
                rootVC.view.transform = CGAffineTransformIdentity;
                presentedVC.view.transform = CGAffineTransformIdentity;
                appDelegate.gestureBaseView.hidden = YES;
            }];
        }
        else {
            [UIView animateWithDuration:BBGestureSpeed animations:^{
                rootVC.view.transform = CGAffineTransformIdentity;
                presentedVC.view.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                appDelegate.gestureBaseView.hidden = YES;
            }];
        }
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    
    WBGestureBaseController *topView = (WBGestureBaseController *)self.topViewController;
    if (topView.isEnablePanGesture == NO)     return NO;
    if (self.viewControllers.count <= 1)    return NO;
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        CGPoint point = [touch locationInView:gestureRecognizer.view];
        if (point.x < [UIScreen mainScreen].bounds.size.width) {
            return YES;
        }
    }
    return NO;
}
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSArray *arr = [super popToViewController:viewController animated:animated];
    if (self.arrayScreenshot.count > arr.count){
        for (int i = 0; i < arr.count; i++) {
            [self.arrayScreenshot removeLastObject];
        }
    }
    return arr;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    //设置返回按钮
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(0, 0, 30, 30);
        leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
        UIImage *leftButtonImg = [UIImage imageNamed:@"goback"];
        [leftButton setImage: leftButtonImg
                    forState:UIControlStateNormal];
        //        leftButton.backgroundColor = [UIColor redColor];
        [leftButton addTarget:self action:@selector(popToControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        
    }
    
    if (self.viewControllers.count == 0) {
        return [super pushViewController:viewController animated:animated];
    }else if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(appdelegate.window.frame.size.width, appdelegate.window.frame.size.height), YES, 0);
    [appdelegate.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.arrayScreenshot addObject:viewImage];
    appdelegate.gestureBaseView.imgView.image = viewImage;
    [super pushViewController:viewController animated:animated];
    
}
- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self.arrayScreenshot removeLastObject];
    UIImage *image = [self.arrayScreenshot lastObject];
    if (image)
        appdelegate.gestureBaseView.imgView.image = image;
    UIViewController *viewController = [super popViewControllerAnimated:animated];
    return viewController;
}
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (self.arrayScreenshot.count > 2) {
        [self.arrayScreenshot removeObjectsInRange:NSMakeRange(1, self.arrayScreenshot.count - 1)];
    }
    UIImage *image = [self.arrayScreenshot lastObject];
    if (image)
        appdelegate.gestureBaseView.imgView.image = image;
    return [super popToRootViewControllerAnimated:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void )popToControllerAnimated:(BOOL)animated {
    [self popViewControllerAnimated:YES];
}


#pragma mark ----   获取当前控制器  ----


- (UIViewController *)getCurrentViewController{
    
    UIViewController* currentViewController = [self getRootViewController];
    BOOL runLoopFind = YES;
    while (runLoopFind) {
        if (currentViewController.presentedViewController) {
            
            currentViewController = currentViewController.presentedViewController;
        } else if ([currentViewController isKindOfClass:[UINavigationController class]]) {
            
            UINavigationController* navigationController = (UINavigationController* )currentViewController;
            currentViewController = [navigationController.childViewControllers lastObject];
            
        } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
            
            UITabBarController* tabBarController = (UITabBarController* )currentViewController;
            currentViewController = tabBarController.selectedViewController;
        } else {
            
            NSUInteger childViewControllerCount = currentViewController.childViewControllers.count;
            if (childViewControllerCount > 0) {
                
                currentViewController = currentViewController.childViewControllers.lastObject;
                
                return currentViewController;
            } else {
                
                return currentViewController;
            }
        }
        
    }
    return currentViewController;
}

- (UIViewController *)getRootViewController{
    
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    NSAssert(window, @"The window is empty");
    return window.rootViewController;
}

@end
