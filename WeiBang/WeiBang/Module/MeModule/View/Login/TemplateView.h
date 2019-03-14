//
//  TemplateView.h
//  WeiBang
//
//  Created by tchzt on 2019/2/26.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemplateView : UIView
/* 图标 */
@property (strong, nonatomic) UIImageView *accountImage;
/* 输入框 */
@property (strong, nonatomic) UITextField *accountText;

@property (assign, nonatomic) BOOL testSecureTextEntry;

@end
