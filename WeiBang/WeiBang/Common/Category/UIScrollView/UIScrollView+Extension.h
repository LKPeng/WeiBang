//
//  UIScrollView+Extension.h
//  WeiBang
//
//  Created by tchzt on 2019/2/11.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Extension)
//MARK:-添加下拉刷新
-(void)addHeaderRefreshWithTarget:(id)target  eventAction:(SEL)action;
//MARK:-添加上拉加载
-(void)addFooterRefreshWithTarget:(id)target  eventAction:(SEL)action;

//MARK:-开始刷新
- (void)beginRefreshing;
//MARK:-设置没有更多数据可以加载的状态
- (void)setFooterNoMoreDataState;

//MARK:- 释放刷新
- (void)releaseRefresh;

@end
