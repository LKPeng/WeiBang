//
//  MyInvestmentController.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/15.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MyInvestmentController.h"
#import "MyInvestmentSubController.h"

@interface MyInvestmentController ()<UIScrollViewDelegate>
@property (nonatomic,weak) UIScrollView *scrollView;

//标题栏
@property (nonatomic,weak) UIView *titleView;

@property(nonatomic, strong) NSMutableArray *titleBtn;

//保存上一个选中的按钮
@property (nonatomic,weak) UIButton *previousBtn;
//下划线
@property (nonatomic,weak) UIView *underlineView;

@end

@implementation MyInvestmentController


- (NSMutableArray *)titleBtn{
    if (_titleBtn == nil) {
        _titleBtn = [NSMutableArray array];
    }
    return _titleBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //设置导航条
    [self setUpNav];
    //添加子控制器
    [self addChildController];
    //添加一个scollView
    [self addScrollView];
    //添加一个标题栏
    [self addTitleView];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationItem setHidesBackButton:YES];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationController.navigationBar.backItem setHidesBackButton:YES];
    
    self.tabBarController.hidesBottomBarWhenPushed = YES;
    [self.navigationController.navigationBar setShadowImage:nil];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"白色顶层"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)setUpNav
{
    //设置标题的文字
    //    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    //    titleL.backgroundColor = [UIColor redColor];
    titleL.font = kFontSize6(17);
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.text = @"我的资产";
    self.navigationItem.titleView = titleL;
    
    
    
    
}

- (void)leftbackBtn
{//跳到登录页面
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}
#pragma mark --添加子控制器
- (void)addChildController
{
    MyInvestmentSubController *sub1 = [[MyInvestmentSubController alloc]init];
    sub1.registerType = RechargeTypeAll;
    [self addChildViewController:sub1];
    
    MyInvestmentSubController *sub2 = [[MyInvestmentSubController alloc]init];
    sub1.registerType = RechargeTypeIncome;
    [self addChildViewController:sub2];
}

- (void)addScrollView{
    //不要自动调整scrollView的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    //    scrollView.backgroundColor = [UIColor purpleColor];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    scrollView.delegate = self;
    //让这个控制器的返回顶部功能失效,交给对应的子控制处理
    scrollView.scrollsToTop = NO;
    CGFloat count = self.childViewControllers.count;
    
    //设置scrollView
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * count, 0);
    scrollView.pagingEnabled = YES;
}

#pragma mark --添加一个标题栏
- (void)addTitleView
{
    UIScrollView *titleScrollView = [[UIScrollView alloc] init];
    titleScrollView.backgroundColor =  [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    //    CGFloat y = self.navigationController.navigationBarHidden? 20 : 64;
    
    titleScrollView.frame = CGRectMake(0, kNavBarHeight, SCREEN_WIDTH, scaleY_6(50));
    
    [self.view addSubview:titleScrollView];
    
    self.titleView = titleScrollView;
    //设置标题按钮
    [self setTitleBtn];
    //设置下划线
    [self setUnderLine];
    //设置程序进来加载全部界面
    [self addChildViewToScrollView:0];
}
#pragma mark --设置标题按钮
- (void)setTitleBtn
{
    NSArray *title =@[@"回款中",@"已回款"];
    CGFloat width = SCREEN_WIDTH / title.count;
    CGFloat height = self.titleView.height-1;
    
    for (int i = 0; i < title.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = [UIFont systemFontOfSize:17];
        [btn setTitleColor:[UIColor colorWithHexString:@"#a8a8aa"] forState:UIControlStateNormal];
        [btn setTitleColor:kappRed forState:UIControlStateSelected];
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
        strongself
        //为了让一开始就加载开始界面,这里需要抽取一个方法方便调用
        //        取出控制器的view加到scrollView上面去
        [strongSelf addChildViewToScrollView:btn.tag];
    }];
    
    // 控制scrollView的scrollsToTop属性
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        //        UIScrollView *scrollView = (UIScrollView *)self.childViewControllers[i].view;不能这样写,会造成所有的view都被加载了
        
        UIViewController *vc = self.childViewControllers[i];
        //判断控制器的view有没有被创建了,没有的话不执行
        if (!vc.isViewLoaded) continue;
        
        // 如果控制器的view不是scrollView,就跳过
        if (![vc.view isKindOfClass:[UIScrollView class]]) continue;
        //判断控制器的view是不是scrollView,是的话就设置可以返回顶部
        UIScrollView *ScrollView = (UIScrollView *)vc.view;
        //子控制器的索引跟被点击的按钮的tag一致的才需要设置成为yes
        ScrollView.scrollsToTop = (i == btn.tag);
        //        if (i == btn.tag) {
        //            ScrollView.scrollsToTop = YES;
        //        }else
        //        {
        //            ScrollView.scrollsToTop = NO;
        //        }
        
    }
    
}
#pragma mark --取出控制器的view加到scrollView上面去
- (void)addChildViewToScrollView:(NSInteger)tag
{
    //傻逼代码别写,
    //    UIView *childView = self.childViewControllers[tag].view;
    UIViewController *VC = self.childViewControllers[tag];
    //只加载一次
    if (VC.isViewLoaded) return;
    //        childView.lkp_x = i * LKPScreenW;
    
    VC.view.frame = CGRectMake(tag * SCREEN_WIDTH, 0, _scrollView.width, _scrollView.height);
    //    childView.frame = self.scrollView.bounds;
    [self.scrollView addSubview:VC.view];
}

#pragma mark - UIScrollViewDelegate
//监听scrolView滚动完成
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取角标
    NSInteger i = scrollView.contentOffset.x/SCREEN_WIDTH;
    //获取选择标题按钮
    UIButton *selectBtn = self.titleBtn[i];
    //选中的标题
    [self clickTitleBtn:selectBtn];
    //把对应自控制器的view添加上去
    [self addChildViewToScrollView:i];
}


@end

