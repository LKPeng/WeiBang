//
//  MeLoginController.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MeLoginController.h"
#import "TemplateView.h"
#import "MeRegisterController.h"
#import "MeForgetController.h"

#define LFloginfont  14
#define LFregistfont  12

@interface MeLoginController ()
@property (strong, nonatomic) TemplateView         *AccountView;
@property (strong, nonatomic) TemplateView         *passwordView;

@end

@implementation MeLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    
    [self setupNavBarTitleViewWithText:@"登录"];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 30, 30);
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    UIImage *leftButtonImg = [UIImage imageNamed:@"goback"];
    [leftButton setImage: leftButtonImg
                forState:UIControlStateNormal];
    //        leftButton.backgroundColor = [UIColor redColor];
    [leftButton addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    // 修改导航栏左边的item
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    //底部图片
    UIImageView *baseImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登录注册底图"]];
    [self.view addSubview:baseImageV];
    
    [baseImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
    
    //账号
    [self.view addSubview:self.AccountView];
    
    //密码
    [self.view addSubview:self.passwordView];
    
    [_AccountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(scaleX_6(15));
        make.right.equalTo(self.view.mas_right).offset(-scaleX_6(15));
        make.height.mas_equalTo(scaleY_6(45));
        make.top.equalTo(self.view.mas_top).offset(scaleY_6(150));
    }];
    
    [_passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.AccountView);
        make.height.mas_equalTo(scaleY_6(45));
        make.top.equalTo(self.AccountView.mas_bottom).offset(scaleY_6(10));
    }];
    
    //登录按钮
    UIButton *login = [UIButton buttonWithType:UIButtonTypeCustom];
    login.backgroundColor = kappRed;
    [login setTitle:@"登录" forState:UIControlStateNormal];
    login.titleLabel.font = kFontSize6(LFloginfont);
    [login addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    login.layer.cornerRadius = 2.f;
    [self.view addSubview:login];
    
    //注册按钮
    UIButton *registeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registeBtn setTitle:@"注册" forState:UIControlStateNormal];
    registeBtn.titleLabel.font = kFontSize6(LFregistfont);
    [registeBtn addTarget:self action:@selector(btnRegisClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registeBtn];
    
    //忘记密码按钮
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetBtn.titleLabel.font = kFontSize6(LFregistfont);
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(btnforgetClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBtn];
    
    
    
    //登录按钮
    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordView.mas_bottom).offset(scaleY_6(20));
        make.left.equalTo(self.view).offset(scaleX_6(15));
        make.right.equalTo(self.view).offset(-scaleX_6(15));
        make.height.mas_equalTo(scaleY_6(45));
    }];
    
    //注册按钮
    [registeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(login.mas_bottom).offset(scaleY_6(15));
        make.left.equalTo(self.view).offset(scaleX_6(15));
    }];
    
    //忘记密码按钮
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-scaleX_6(15));
        make.top.equalTo(login.mas_bottom).offset(scaleY_6(15));
    }];
}

- (void)popViewControllerAnimated:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)btnRegisClick{
    MeRegisterController *regis = [[MeRegisterController alloc]init];
    [self.navigationController pushViewController:regis animated:YES];
}

- (void)btnforgetClick{
    MeForgetController *regis = [[MeForgetController alloc]init];
    [self.navigationController pushViewController:regis animated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.AccountView.accountText resignFirstResponder];
    [self.passwordView.accountText resignFirstResponder];
}

- (void)btnClick{
    if (self.AccountView.accountText.text.length != 11) {
        [MBProgressHUD showMessage:@"请输入11位手机号码!"];
        return;
    }
    NSLog(@"%lu..",self.passwordView.accountText.text.length);
    if (self.passwordView.accountText.text.length > 16 || 6 > self.passwordView.accountText.text.length) {
        [MBProgressHUD showMessage:@"请输入6-15位之间密码!"];
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"user_login"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (TemplateView *)AccountView{
    if (!_AccountView) {
        _AccountView = [[TemplateView alloc]init];
        _AccountView.accountImage.image = [UIImage imageNamed:@"zhanghao"];
        _AccountView.accountText.placeholder = @"请输入手机号码";
        _AccountView.testSecureTextEntry = NO;
        _AccountView.testkeyboardType = YES;
    }
    return _AccountView;
}

- (TemplateView *)passwordView{
    if (!_passwordView) {
        _passwordView = [[TemplateView alloc]init];
        _passwordView.accountImage.image = [UIImage imageNamed:@"mima"];
        _passwordView.accountText.placeholder = @"请输入密码";
        _passwordView.testSecureTextEntry = YES;
        _passwordView.testkeyboardType = NO;
    }
    return _passwordView;
}
@end
