//
//  investScrollView.m
//  WeiBang
//
//  Created by tchzt on 2019/3/13.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "investScrollView.h"

@interface investScrollView ()
@property (nonatomic,weak) UIScrollView *scrollView;

//标题栏
@property (nonatomic,weak) UIView *titleView;

@property(nonatomic, strong) NSMutableArray *titleBtn;

//保存上一个选中的按钮
@property (nonatomic,weak) UIButton *previousBtn;
//下划线
@property (nonatomic,weak) UIView *underlineView;

@end
@implementation investScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
        
    }
    return self;
}

- (void)setUp{
    [self addTitleView];
}

#pragma mark --添加一个标题栏
- (void)addTitleView
{
    UIScrollView *titleScrollView = [[UIScrollView alloc] init];
    titleScrollView.backgroundColor =  [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    //    CGFloat y = self.navigationController.navigationBarHidden? 20 : 64;
    
    titleScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, scaleY_6(45));
    
    [self addSubview:titleScrollView];
    
    self.titleView = titleScrollView;
    //设置标题按钮
    [self setTitleBtn];
    //设置下划线
    [self setUnderLine];
}

#pragma mark --设置标题按钮
- (void)setTitleBtn
{
    NSArray *title =@[@"支付订单",@"收款订单",@"收款订单",@"收款订单"];
    CGFloat width = SCREEN_WIDTH / title.count;
    CGFloat height = self.titleView.height-1;
    
    for (int i = 0; i < title.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitleColor:[UIColor colorWithHexString:@"#a8a8aa"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"#3e3a39"] forState:UIControlStateSelected];
        [btn setTitle:title[i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(i * width, 0, width, height);
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = i;
        //随机抽取颜色
        //        btn.backgroundColor = LKPRandomColor;
        [btn addTarget:self action:@selector(clickTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.titleView addSubview:btn];
        [self.titleBtn addObject:btn];
    }
}

- (void)setUnderLine
{
    //初始状态,取出第一个按钮给他设置下划线
    UIButton * titleBtn = self.titleView.subviews.firstObject;
    CGFloat underlineH = 2;
    CGFloat underlineY = self.titleView.height - underlineH;
    
    UIView *underlineView = [[UIView alloc]initWithFrame:CGRectMake(0, underlineY, 0, underlineH)];
    underlineView.backgroundColor = kappRed;
    
    self.underlineView = underlineView;
    [self.titleView addSubview:underlineView];
    //设置第一个按钮为默认选中的按钮
    //设置按钮的状态改变颜色
    titleBtn.selected = YES;
    self.previousBtn = titleBtn;
    
    //要显示才可以拿到字体的宽度
    [titleBtn.titleLabel sizeToFit];
    //宽度为字体的大小
    self.underlineView.width =titleBtn.titleLabel.width + 10;
    //设置中心点
    self.underlineView.centerX = titleBtn.centerX;
    
}

#pragma mark --点击了标题按钮:通过改变按钮状态改变颜色
- (void)clickTitleBtn:(UIButton *)btn
{
    //    if (self.previousBtn ==btn) {
    //        //发布重复点击的通知
    //        [[NSNotificationCenter defaultCenter] postNotificationName:LKPTitleButtonRepeatClickNotification object:nil];
    //    }
    
    //让上一个按钮的颜色取消
    self.previousBtn.selected = NO;
    //设置按钮的状态改变颜色
    btn.selected = YES;
    
    self.previousBtn = btn;
    
    weakself
    [UIView animateWithDuration:0.5 animations:^{
        strongself
        
        //宽度为字体的大小
        strongSelf.underlineView.width =btn.titleLabel.width + 10;
        //设置中心点
        strongSelf.underlineView.centerX = btn.centerX;
        
        strongSelf.scrollView.contentOffset = CGPointMake(btn.tag * weakSelf.scrollView.width, 0);
        
    }completion:^(BOOL finished) {
    }];

    
    
}

@end
