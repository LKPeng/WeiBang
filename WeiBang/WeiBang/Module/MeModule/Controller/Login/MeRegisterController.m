//
//  MeRegisterController.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MeRegisterController.h"
#import "TemplateView.h"
#import "VerificationCodeView.h"

@interface MeRegisterController ()
@property (strong, nonatomic) TemplateView         *AccountView;
@property (strong, nonatomic) TemplateView         *passwordView;
@property (strong, nonatomic) TemplateView         *surePasswordView;
@property (strong, nonatomic) TemplateView         *pushView;

@property (weak, nonatomic) VerificationCodeView *verificationCodeView;
@end

@implementation MeRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    [self setupNavBarTitleViewWithText:@"注册"];
    
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
    
    //账号
    [self.view addSubview:self.surePasswordView];
    
    //密码
    [self.view addSubview:self.pushView];
    
    
    VerificationCodeView *AccountView = [[VerificationCodeView alloc]init];
    AccountView.codeButtonBool = NO;
    AccountView.accountImage.image = [UIImage imageNamed:@"zhanghao"];
    AccountView.accountText.placeholder = @"请输入手机验证码";
    [self.view addSubview:AccountView];
    self.verificationCodeView = AccountView;
    
    
    [_AccountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(scaleX_6(15));
        make.right.equalTo(self.view.mas_right).offset(-scaleX_6(15));
        make.height.mas_equalTo(scaleY_6(45));
        make.top.equalTo(self.view.mas_top).offset(scaleY_6(150));
    }];
    
    [AccountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.AccountView);
        make.height.mas_equalTo(scaleY_6(45));
        make.top.equalTo(self.AccountView.mas_bottom).offset(scaleY_6(10));
    }];
    
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.AccountView);
        make.height.mas_equalTo(scaleY_6(45));
        make.top.equalTo(AccountView.mas_bottom).offset(scaleY_6(10));
    }];
    
    [self.surePasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.AccountView);
        make.height.mas_equalTo(scaleY_6(45));
        make.top.equalTo(self.passwordView.mas_bottom).offset(scaleY_6(10));
    }];
    
    [self.pushView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.AccountView);
        make.height.mas_equalTo(scaleY_6(45));
        make.top.equalTo(self.surePasswordView.mas_bottom).offset(scaleY_6(10));
    }];
    
    UIButton *login = [UIButton buttonWithType:UIButtonTypeCustom];
    login.backgroundColor = kappRed;
    [login setTitle:@"注册" forState:UIControlStateNormal];
    login.titleLabel.font = kFontSize6(14);
    [login addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    login.layer.cornerRadius = 2.f;
    [self.view addSubview:login];
    
    //登录按钮
    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pushView.mas_bottom).offset(scaleY_6(20));
        make.left.equalTo(self.view).offset(scaleX_6(15));
        make.right.equalTo(self.view).offset(-scaleX_6(15));
        make.height.mas_equalTo(scaleY_6(45));
    }];
}

/*
 * 注册
 */
- (void)btnClick{
    if (self.AccountView.accountText.text.length != 11) {
        [MBProgressHUD showMessage:@"请输入11位手机号码!"];
        return;
    }
    
    if (self.verificationCodeView.accountText.text.length != 6) {
        [MBProgressHUD showMessage:@"请输入6位验证码!"];
        return;
    }
    
    if (self.passwordView.accountText.text.length > 16 && 6 > self.passwordView.accountText.text.length) {
        [MBProgressHUD showMessage:@"请输入6-15位之间密码!"];
        return;
    }
    
    if (self.surePasswordView.accountText.text.length > 16 && 6 > self.surePasswordView.accountText.text.length) {
        [MBProgressHUD showMessage:@"请输入6-15位之间确认密码!"];
        return;
    }
    
    if(self.passwordView.accountText.text != self.surePasswordView.accountText.text){
        [MBProgressHUD showMessage:@"密码不一致!"];
        return;
    }
    
    [MBProgressHUD showMessage:@"注册失败,请稍后再试"];
    
}

- (void)popViewControllerAnimated:(UIButton *)button{
    [self bb_popViewController];
}

- (TemplateView *)AccountView{
    if (!_AccountView) {
        _AccountView = [[TemplateView alloc]init];
        _AccountView.accountImage.image = [UIImage imageNamed:@"zhanghao"];
        _AccountView.accountText.placeholder = @"请输入手机号码";
        
    }
    return _AccountView;
}

- (TemplateView *)passwordView{
    if (!_passwordView) {
        _passwordView = [[TemplateView alloc]init];
        _passwordView.accountImage.image = [UIImage imageNamed:@"mima"];
        _passwordView.accountText.placeholder = @"密码范围在6-15位之间";
    }
    return _passwordView;
}

- (TemplateView *)surePasswordView{
    if (!_surePasswordView) {
        _surePasswordView = [[TemplateView alloc]init];
        _surePasswordView.accountImage.image = [UIImage imageNamed:@"zhanghao"];
        _surePasswordView.accountText.placeholder = @"请输入确认密码";
        
    }
    return _surePasswordView;
}

- (TemplateView *)pushView{
    if (!_pushView) {
        _pushView = [[TemplateView alloc]init];
        _pushView.accountImage.image = [UIImage imageNamed:@"mima"];
        _pushView.accountText.placeholder = @"请输入验证码(选填)";
    }
    return _pushView;
}

@end
