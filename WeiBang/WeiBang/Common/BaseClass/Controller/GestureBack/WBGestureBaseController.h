//
//  WBGestureBaseController.h
//  WeiBang
//
//  Created by tchzt on 2019/2/11.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBGestureBaseController : UIViewController
@property (nonatomic) Boolean isEnablePanGesture;// default is YES.

- (void)bb_popViewController;
- (void)bb_popToViewController:(UIViewController *)viewController;
- (void)bb_popToRootViewController;
@end


@interface BBGestureBaseView : UIView
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) NSMutableArray *arrayImage;

- (void)showEffectChange:(CGPoint)pt;
- (void)restore;
- (void)screenShot;
@end

/*
 -(void)popClick{
 [self bb_popViewController];
 }
 
 -(void)popToClick{
 UIViewController *viewController = self.navigationController.viewControllers[0];
 [self bb_popToViewController:viewController];
 }
 
 -(void)popToRootClick{
 [self bb_popToRootViewController];
 }
 
*/
