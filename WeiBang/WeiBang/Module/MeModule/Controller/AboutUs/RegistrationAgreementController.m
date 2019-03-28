//
//  RegistrationAgreementController.m
//  WeiBang
//
//  Created by tchzt on 2019/3/20.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "RegistrationAgreementController.h"

@interface RegistrationAgreementController ()<UIWebViewDelegate>
@property (nonatomic,weak) UIWebView *webView ;
//@property (nonatomic,weak) WKWebView *webView;

@end

@implementation RegistrationAgreementController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加WKWebView
    //    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    //    for (UIView *_aView in [webView subviews])
    //    {
    //        if ([_aView isKindOfClass:[UIScrollView class]])
    //        {
    //            [(UIScrollView *)_aView setShowsVerticalScrollIndicator:NO];
    //            //右侧的滚动条
    //
    //            [(UIScrollView *)_aView setShowsHorizontalScrollIndicator:NO];
    //            //下侧的滚动条
    //
    //            for (UIView *_inScrollview in _aView.subviews)
    //            {
    //                if ([_inScrollview isKindOfClass:[UIImageView class]])
    //                {
    //                    _inScrollview.hidden = YES;  //上下滚动出边界时的黑色的图片
    //                }
    //            }
    //        }
    //    }
    //
    //    _webView = webView;
    //    [self.view insertSubview:webView atIndex:0];
    //
    //    // 加载网页
    //    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.0.99/lonfood/mobile/bonus.php?act=bonus_double_twelve"]];
    //    [webView loadRequest:request];
    //
    //    // KVO: 让self对象监听webView的estimatedProgress
    //    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    //
    
    [self setupNavBarTitleViewWithText:@"注册协议"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //双十二
    // 添加WKWebView
    //获取状态栏高度 [[UIApplication sharedApplication] statusBarFrame].size.height
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, [[UIApplication sharedApplication] statusBarFrame].size.height)];
    
    statusBarView.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:statusBarView];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    webView.delegate = self;
    [self.view insertSubview:webView atIndex:0];
    self.webView = webView;
    
    NSString * string = @"http://gxzqxd.com/zyPrivacy.html";
    NSURL *url = [[NSURL alloc] initWithString:string];
    // 加载网页
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    
    [webView loadRequest:request];
    
    
    
    
    
    
    //    //返回按钮
    //    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    backBtn.frame = CGRectMake(10, LFScreenH - LFTabBarH, 30, 30);
    //    if kDevice_Is_iPhoneX{
    //        backBtn.y =   LFScreenH - LF_XtabBarHeight;
    //    }
    //    [backBtn setImage:[UIImage imageNamed:@"IP_Back"] forState:UIControlStateNormal];
    //    [backBtn setImage:[UIImage imageNamed:@"IP_Back"] forState:UIControlStateSelected];
    //    [backBtn addTarget:self action:@selector(ClickbackBtnBtn) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:backBtn];
    //
    
    
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ToLogin) name:LFTestJSObjectToLoginNotification object:nil];
    //
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Toshop) name:LFTestJSObjectToshopNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //隐藏导航条
    
    
    // 加载网页
    //    NSURLRequest *request = [NSURLRequest requestWithURL:_url];
    //    [self.webView loadRequest:request];
}

//// 只要监听的属性有新值就会调用
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
//{
//    //    _progressView.progress = _webView.estimatedProgress;
//    //
//    //    _progressView.hidden = _progressView.progress >= 1;
//}
//
//// KVO一定要移除观察者
//- (void)dealloc
//{
//    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
//}


- (void)ClickbackBtnBtn{
    [self.navigationController popViewControllerAnimated:YES];
}






- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}





/*********************双十二******************/
//
//- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
////    [LFShowAlertView showAlert:@"网络繁忙，请稍后~" controll:self];
//    [self.navigationController popViewControllerAnimated:YES];
//}


@end
