//
//  HTForgetViewController.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/26.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "HTForgetViewController.h"
#import "TemplateView.h"
#import "VerificationCodeView.h"

@interface HTForgetViewController ()
@property (strong, nonatomic) TemplateView         *telView;
@property (strong, nonatomic) TemplateView         *passwordView;
@property (strong, nonatomic) VerificationCodeView *verificationCodeView;
@property(nonatomic,strong) UIButton *confirmBtn;
@end

@implementation HTForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavBarTitleViewWithText:@"忘记密码"];
    [self setUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI{
    [self.view addSubview:self.telView];
    [self.telView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(kNavBarHeight+scaleX(10));
        make.leading.mas_equalTo(scaleX(10));
        make.trailing.mas_equalTo(scaleX(-10));
        make.height.mas_equalTo(scaleX(40));
    }];
    [self.view addSubview:self.verificationCodeView];
    [self.verificationCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.telView.mas_bottom);
        make.leading.mas_equalTo(self.telView.mas_leading);
        make.trailing.mas_equalTo(self.telView.mas_trailing);
        make.height.mas_equalTo(self.telView.mas_height);
    }];
    [self.view addSubview:self.passwordView];
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.verificationCodeView.mas_bottom);
        make.leading.mas_equalTo(self.verificationCodeView.mas_leading);
        make.trailing.mas_equalTo(self.verificationCodeView.mas_trailing);
        make.height.mas_equalTo(self.verificationCodeView.mas_height);
    }];
    [self.view addSubview:self.confirmBtn];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordView.mas_bottom).mas_offset(scaleX(60));
        make.leading.mas_equalTo(scaleX(30));
        make.trailing.mas_equalTo(scaleX(-30));
        make.height.mas_equalTo(scaleX(40));
    }];
}

-(void)confirmFunction{
    if (self.telView.accountText.text.length != 11) {
        [MBProgressHUD showMessage:@"请输入11位手机号码!"];
        return;
    }
    
    if (self.passwordView.accountText.text.length > 16 || 6 > self.passwordView.accountText.text.length) {
        [MBProgressHUD showMessage:@"请输入6-15位之间密码!"];
        return;
    }
    
    if (self.verificationCodeView.accountText.text.length != 6) {
        [MBProgressHUD showMessage:@"请输入6位验证码!"];
        return;
    }
    [MBProgressHUD showMessage:@"找回密码失败,请稍后再试"];
}

- (TemplateView *)telView{
    if (!_telView) {
        _telView = [[TemplateView alloc]init];
        _telView.accountImage.image = [UIImage imageNamed:@"zhanghao"];
        _telView.accountText.placeholder = @"请输入手机号";
        _telView.testSecureTextEntry = NO;
        _telView.testkeyboardType = YES;
    }
    return _telView;
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

- (VerificationCodeView *)verificationCodeView{
    if (!_verificationCodeView) {
        _verificationCodeView = [[VerificationCodeView alloc]init];
        _verificationCodeView.codeButtonBool = NO;
        _verificationCodeView.accountImage.image = [UIImage imageNamed:@"zhanghao"];
        _verificationCodeView.accountText.placeholder = @"输入验证码";
    }
    return _verificationCodeView;
}

- (UIButton *)confirmBtn{
    if (!_confirmBtn){
        _confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KWIDTH-scaleX(60), scaleX(40))];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:scaleX(13)];
        _confirmBtn.backgroundColor = [UIColor redColor];
        _confirmBtn.layer.cornerRadius = scaleX(20);
        _confirmBtn.clipsToBounds = true;
        [_confirmBtn addTarget:self action:@selector(confirmFunction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}
@end
