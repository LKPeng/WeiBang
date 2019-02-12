//
//  UIButton+Extension.h
//  WeiBang
//
//  Created by tchzt on 2019/2/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^buttonClickActionBlock)(NSInteger tagIndex);
@interface UIButton (Extension)


// 加载图片
- (void)wgb_setImageWithUrlString:(NSString *)imageUrlStr placehoder:(NSString *)imageNameStr forState:(UIControlState )state;
- (void)wgb_setBackgroundImageWithUrlString:(NSString *)imageUrlStr placehoder:(NSString *)imageNameStr forState:(UIControlState )state;

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

///简便点击事件
-(void)addButtonActionClickHandler:(buttonClickActionBlock)clickHandlerr ;

///额外点击区域
@property (nonatomic,assign) UIEdgeInsets touchAreaInsets;

/// 倒计时按钮: 使用方法  [button addStartTime:12 title:@"倒计时" waitTittle:@"秒"];
-(void)addStartTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle ;

//点赞动画
- (void)dianZanAnimation;

@end
