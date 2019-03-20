//
//  RegistrationAgreementController.m
//  WeiBang
//
//  Created by tchzt on 2019/3/20.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "PrivacyViewController.h"

@interface PrivacyViewController ()<UIWebViewDelegate>
@property (nonatomic,weak) UIWebView *webView ;
//@property (nonatomic,weak) WKWebView *webView;

@end

@implementation PrivacyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavBarTitleViewWithText:@"隐私协议"];
    
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
    
    NSString * string = @"http://zmindaitong.com/dyPrivacy.html";
    NSURL *url = [[NSURL alloc] initWithString:string];
    // 加载网页
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    
    [webView loadRequest:request];
}

- (void)ClickbackBtnBtn{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
