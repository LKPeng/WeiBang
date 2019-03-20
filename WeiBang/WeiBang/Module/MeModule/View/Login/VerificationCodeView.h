//
//  VerificationCodeView.h
//  WeiBang
//
//  Created by tchzt on 2019/2/26.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VerificationCodeViewDelegate <NSObject>

@optional

-(void)getCodeNumber;

@end


@interface VerificationCodeView : UIView
/* 图标 */
@property (strong, nonatomic) UIImageView *accountImage;
/* 输入框 */
@property (strong, nonatomic) UITextField *accountText;
/* 点击输入验证码 */
@property (assign, nonatomic) id<VerificationCodeViewDelegate>delegate;


@property (nonatomic,assign) BOOL codeButtonBool;
@end
