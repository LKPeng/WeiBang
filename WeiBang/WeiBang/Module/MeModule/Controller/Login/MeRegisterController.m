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
#import "UnderlineButton.h"
#import "PrivacyViewController.h"
#import "RegistrationAgreementController.h"
//#import "UserAgreementViewController.h"
#import "CopyrightTipLabel.h"

@interface MeRegisterController ()
@property (strong, nonatomic) TemplateView         *AccountView;
@property (strong, nonatomic) TemplateView         *passwordView;
@property (strong, nonatomic) TemplateView         *surePasswordView;
@property (strong, nonatomic) TemplateView         *pushView;
@property(nonatomic,strong) CopyrightTipLabel *tipLabel;
@property (weak, nonatomic) VerificationCodeView *verificationCodeView;

@property (strong, nonatomic) UnderlineButton         *underlineButton;
@property (strong, nonatomic) UnderlineButton         *ysButton;

@property (strong, nonatomic) UIButton *AgreeSelectBtn;
@property (strong, nonatomic) UIButton *PrivacySelectBtn;

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
    login.backgroundColor = kappMainGreen;
    [login setTitle:@"注册" forState:UIControlStateNormal];
    login.titleLabel.font = kFontSize6(14);
    [login addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    login.layer.cornerRadius = 2.f;
    [self.view addSubview:login];
    
    //按钮
    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pushView.mas_bottom).offset(scaleY_6(20));
        make.left.equalTo(self.view).offset(scaleX_6(15));
        make.right.equalTo(self.view).offset(-scaleX_6(15));
        make.height.mas_equalTo(scaleY_6(45));
    }];
    
    
    /*
     * 注册协议
     */

    [self.view addSubview:self.AgreeSelectBtn];
    [self.AgreeSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(login.mas_bottom).offset(scaleY_6(10));
        make.leading.mas_equalTo(login);
        make.size.mas_equalTo(CGSizeMake(scaleY_6(20), scaleY_6(20)));
    }];
    
    UILabel *textTitleL = [[UILabel alloc]init];
    textTitleL.text = @"我已阅读并同意";
    textTitleL.font = kFontSize6(13);
    textTitleL.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.8];
    [self.view addSubview:textTitleL];
    
    [textTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.AgreeSelectBtn.mas_top);
    make.left.equalTo(self.AgreeSelectBtn.mas_right).offset(scaleX_6(8));
        make.bottom.equalTo(self.AgreeSelectBtn.mas_bottom);
    }];
    
    [self.view addSubview:self.underlineButton];
    [_underlineButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.AgreeSelectBtn.mas_centerY);
        make.left.equalTo(textTitleL.mas_right).offset(scaleX_6(5));
    }];
    

    /*
     * 隐私协议
     */
    
    [self.view addSubview:self.PrivacySelectBtn];
    [self.PrivacySelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.AgreeSelectBtn.mas_bottom).offset(scaleY_6(10));
        make.leading.mas_equalTo(login);
        make.size.mas_equalTo(CGSizeMake(scaleY_6(20), scaleY_6(20)));
    }];
    
    UILabel *textTitleL1 = [[UILabel alloc]init];
    textTitleL1.text = @"我已阅读并同意";
    textTitleL1.font = kFontSize6(13);
    textTitleL1.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.8];
    [self.view addSubview:textTitleL1];
    
    [textTitleL1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.PrivacySelectBtn.mas_top);
        make.left.equalTo(self.PrivacySelectBtn.mas_right).offset(scaleX_6(8));
        make.bottom.equalTo(self.PrivacySelectBtn.mas_bottom);
    }];
    
    
    [self.view addSubview:self.ysButton];
    [self.ysButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.PrivacySelectBtn.mas_centerY);
        make.left.equalTo(textTitleL1.mas_right).offset(scaleX_6(5));
    }];
    
    [self.view addSubview:self.tipLabel];
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
    
    if (self.passwordView.accountText.text.length > 16 || 6 > self.passwordView.accountText.text.length) {
        [MBProgressHUD showMessage:@"请输入6-15位之间密码!"];
        return;
    }
    
    if (self.surePasswordView.accountText.text.length > 16 || 6 > self.surePasswordView.accountText.text.length) {
        [MBProgressHUD showMessage:@"请输入6-15位之间确认密码!"];
        return;
    }
    
    if(self.passwordView.accountText.text != self.surePasswordView.accountText.text){
        [MBProgressHUD showMessage:@"密码不一致!"];
        return;
    }
    
    if (!self.AgreeSelectBtn.selected) {
        [MBProgressHUD showMessage:@"请阅读并同意注册协议"];
        return;
    }
    
    if (!self.PrivacySelectBtn.selected) {
        [MBProgressHUD showMessage:@"请阅读并同意隐私协议"];
        return;
    }
    
    [MBProgressHUD showMessage:@"注册失败,请稍后再试"];
    
}
#pragma mark - 按钮点击事件
- (void)ClickagreeBtn{
    RegistrationAgreementController *vc = [[RegistrationAgreementController alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)ClickYSBtn{
    PrivacyViewController *vc = [[PrivacyViewController alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)ClickAgreeSelectBtn{
    self.AgreeSelectBtn.selected =! self.AgreeSelectBtn.selected;
}

- (void)ClickPrivacySelectBtn{
    self.PrivacySelectBtn.selected =! self.PrivacySelectBtn.selected;
}

- (void)popViewControllerAnimated:(UIButton *)button{
    [self bb_popViewController];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.AccountView.accountText resignFirstResponder];
    [self.passwordView.accountText resignFirstResponder];
    [self.surePasswordView.accountText resignFirstResponder];
    [self.pushView.accountText resignFirstResponder];
    [self.verificationCodeView.accountText resignFirstResponder];
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
        _passwordView.accountText.placeholder = @"密码范围在6-15位之间";
        _passwordView.testSecureTextEntry = YES;
        _passwordView.testkeyboardType = NO;
    }
    return _passwordView;
}

- (TemplateView *)surePasswordView{
    if (!_surePasswordView) {
        _surePasswordView = [[TemplateView alloc]init];
        _surePasswordView.accountImage.image = [UIImage imageNamed:@"zhanghao"];
        _surePasswordView.accountText.placeholder = @"请输入确认密码";
        _surePasswordView.testSecureTextEntry = YES;
        _surePasswordView.testkeyboardType = NO;
        
    }
    return _surePasswordView;
}

- (TemplateView *)pushView{
    if (!_pushView) {
        _pushView = [[TemplateView alloc]init];
        _pushView.accountImage.image = [UIImage imageNamed:@"mima"];
        _pushView.accountText.placeholder = @"请输入验证码(选填)";
        _pushView.testSecureTextEntry = YES;
        _pushView.testkeyboardType = NO;
    }
    return _pushView;
}


- (UnderlineButton *)underlineButton{
    if (!_underlineButton) {
        _underlineButton = [UnderlineButton buttonWithType:UIButtonTypeCustom];
        [_underlineButton setColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.8]];
        _underlineButton.titleLabel.font = kFontSize6(14);
        [_underlineButton setTitle:@"注册协议" forState:UIControlStateNormal];
        [_underlineButton setTitleColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.8] forState:UIControlStateNormal];
        [_underlineButton addTarget:self action:@selector(ClickagreeBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _underlineButton;
}

- (UnderlineButton *)ysButton{
    if (!_ysButton) {
        _ysButton = [UnderlineButton buttonWithType:UIButtonTypeCustom];
        [_ysButton setColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.8]];
        _ysButton.titleLabel.font = kFontSize6(14);
        [_ysButton setTitle:@"隐私协议" forState:UIControlStateNormal];
        [_ysButton setTitleColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.8] forState:UIControlStateNormal];
        [_ysButton addTarget:self action:@selector(ClickYSBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ysButton;
}

- (UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = [[CopyrightTipLabel alloc] initWithFrame:CGRectMake(0, self.view.height-30, KWIDTH, 15)];
        _tipLabel.textColor = [UIColor blackColor];
    }
    return _tipLabel;
}


- (UIButton *)AgreeSelectBtn{
    if(!_AgreeSelectBtn){
        _AgreeSelectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _AgreeSelectBtn.selected = YES;
        [_AgreeSelectBtn setImage:[UIImage imageNamed:@"条款_未选中"] forState:UIControlStateNormal];
        [_AgreeSelectBtn setImage:[UIImage imageNamed:@"条款_选中"] forState:UIControlStateSelected];
        [_AgreeSelectBtn addTarget:self action:@selector(ClickAgreeSelectBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _AgreeSelectBtn;
}

- (UIButton *)PrivacySelectBtn{
    if(!_PrivacySelectBtn){
        _PrivacySelectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _PrivacySelectBtn.selected = YES;
        [_PrivacySelectBtn setImage:[UIImage imageNamed:@"条款_未选中"] forState:UIControlStateNormal];
        [_PrivacySelectBtn setImage:[UIImage imageNamed:@"条款_选中"] forState:UIControlStateSelected];
        [_PrivacySelectBtn addTarget:self action:@selector(ClickPrivacySelectBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _PrivacySelectBtn;
}

@end
