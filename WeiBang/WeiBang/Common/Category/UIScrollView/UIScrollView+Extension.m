//
//  UIScrollView+Extension.m
//  WeiBang
//
//  Created by tchzt on 2019/2/11.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "UIScrollView+Extension.h"
#import <MJRefresh/MJRefresh.h>

#define KFontSize(A)  [UIFont systemFontOfSize: A]
#define RGB(R,G,B)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0f]
#define kAppMainColor  RGB(43,163,252)

@implementation UIScrollView (Extension)

//MARK:-添加下拉刷新
-(void)addHeaderRefreshWithTarget:(id)target  eventAction:(SEL)action{
    //下拉刷新
    MJRefreshNormalHeader * header =
    [MJRefreshNormalHeader headerWithRefreshingTarget: target refreshingAction: action];
    // 设置文字
    [header setTitle:@"下拉刷新提供最新数据" forState:MJRefreshStateIdle];
    [header setTitle:@"松开即可刷新最新数据" forState:MJRefreshStatePulling];
    [header setTitle:@"正在加载最新数据..." forState:MJRefreshStateRefreshing];
    // 设置字体
    header.stateLabel.font = KFontSize(15);
    header.stateLabel.textColor = kAppMainColor;
    header.lastUpdatedTimeLabel.font = KFontSize(12);
    header.lastUpdatedTimeLabel.textColor = kAppMainColor;
    header.automaticallyChangeAlpha = YES;
    self.mj_header = header;
}

//MARK:-添加上拉加载
-(void)addFooterRefreshWithTarget:(id)target  eventAction:(SEL)action{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction: action];
    // 设置文字
    [footer setTitle:@"上拉加载更多数据" forState:MJRefreshStateIdle];
    [footer setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"没有更多数据了" forState:MJRefreshStateNoMoreData];
    
    footer.stateLabel.font = KFontSize(15);
    footer.automaticallyHidden = YES ;
    footer.stateLabel.textColor = kAppMainColor ;
    self.mj_footer = footer;
}


//MARK:-开始刷新
- (void)beginRefreshing{
    [self.mj_header beginRefreshing];
}
//MARK:-设置没有更多数据可以加载的状态
- (void)setFooterNoMoreDataState{
    [self.mj_footer setState: MJRefreshStateNoMoreData];
}

//MARK:- 释放刷新
- (void)releaseRefresh{
    if ([self.mj_header isRefreshing]) {
        [self.mj_header endRefreshing];
        [self.mj_footer endRefreshing];
    }
    if ([self.mj_footer isRefreshing]) {
        [self.mj_footer endRefreshing];
        [self.mj_header endRefreshing];
    }
}
@end
