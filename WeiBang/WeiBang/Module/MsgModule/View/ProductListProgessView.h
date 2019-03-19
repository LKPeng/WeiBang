//
//  ProductListProgessView.h
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/19.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductListProgessView : UIView

@property(nonatomic,assign)CGFloat radius; // 环半径
@property(nonatomic,assign)CGFloat lineWidth; // 环的宽度
@property(nonatomic,strong)UIColor *defaultColor; // 默认环的颜色
@property(nonatomic,strong)UIColor *progressColor; // 进度条颜色

@property(nonatomic,assign)CGFloat progress; // 进度值

@property(nonatomic,assign)BOOL backClear; // 是否添加文字

-(instancetype)initWithFrame:(CGRect)frame withRadius:(CGFloat)radius withLineWidth:(CGFloat)lineWidth;

-(void)updateProgress:(CGFloat)progress andTerm:(NSInteger)term;

@end

NS_ASSUME_NONNULL_END
