//
//  HTLoginViewController.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/25.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "HTLoginViewController.h"
#import "TemplateView.h"
#import "VerificationCodeView.h"
#import "HTForgetViewController.h"
#import "UnderlineButton.h"
#import "PrivacyViewController.h"
#import "RegistrationAgreementController.h"

@interface HTLoginViewController ()
@property(nonatomic,strong) UIImageView *topView;
@property(nonatomic,strong) UILabel *topLabel;
@property(nonatomic,strong) UIButton *switchLoginBtn;
@property(nonatomic,strong) UIButton *switchRegisterBtn;
@property(nonatomic,strong) UIView *line1;
@property(nonatomic,strong) UIView *line2;
@property(nonatomic,strong) UIView *switchLoginView;
@property(nonatomic,strong) UIView *switchRegisterView;
@property (strong, nonatomic) TemplateView         *loginAccountView;
@property (strong, nonatomic) TemplateView         *loginPasswordView;
@property (strong, nonatomic) TemplateView         *registerAccountView;
@property (strong, nonatomic) TemplateView         *registerPasswordView;
@property (strong, nonatomic) VerificationCodeView *verificationCodeView;
@property (strong, nonatomic) TemplateView         *recTelView;
@property(nonatomic,strong) UIButton *forgetBtn;
@property(nonatomic,strong) UIButton *loginBtn;
@property(nonatomic,strong) UIButton *registerBtn;
@property (strong, nonatomic) UnderlineButton         *underlineButton;
@property (strong, nonatomic) UnderlineButton         *ysButton;
@property (strong, nonatomic) UIButton *AgreeSelectBtn;
@property (strong, nonatomic) UIButton *PrivacySelectBtn;
@end

@implementation HTLoginViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setBackItem];
    [self setUI];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI{
    
    [self.view addSubview:self.topLabel];
    [self.view addSubview:self.switchLoginBtn];
    [self.view addSubview:self.switchRegisterBtn];
    [self.view addSubview:self.line1];
    [self.view addSubview:self.line2];
    [self.view addSubview:self.switchLoginView];
}

-(void)setBackItem{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 30, 30);
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
    UIImage *leftButtonImg = [UIImage imageNamed:@"goback"];
    [leftButton setImage: leftButtonImg
                forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}
- (void)popViewControllerAnimated:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:true];
}
//选择登录
-(void)switchLoginFunction{
    [self.switchLoginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.switchRegisterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.line1.backgroundColor = [UIColor redColor];
    self.line2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.switchLoginView];
    [self.switchRegisterView removeFromSuperview];
}
//选择注册
-(void)switchRegisterFunction{
    [self.switchLoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.switchRegisterBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.line2.backgroundColor = [UIColor redColor];
    self.line1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.switchRegisterView];
    [self.switchLoginView removeFromSuperview];
}
//登录事件
-(void)loginFunction{
    if (self.loginAccountView.accountText.text.length != 11) {
        [MBProgressHUD showMessage:@"请输入11位手机号码!"];
        return;
    }
    
    if (self.loginPasswordView.accountText.text.length > 16 || 6 > self.loginPasswordView.accountText.text.length) {
        [MBProgressHUD showMessage:@"请输入6-15位之间密码!"];
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"user_login"];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:true];
}
//注册事件
-(void)registerFunction{
    if (self.registerAccountView.accountText.text.length != 11) {
        [MBProgressHUD showMessage:@"请输入11位手机号码!"];
        return;
    }
    
    if (self.registerPasswordView.accountText.text.length > 16 || 6 > self.registerPasswordView.accountText.text.length) {
        [MBProgressHUD showMessage:@"请输入6-15位之间密码!"];
        return;
    }
    
    if (self.verificationCodeView.accountText.text.length != 6) {
        [MBProgressHUD showMessage:@"请输入6位验证码!"];
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
//忘记密码
-(void)forgetPasswordFunction{
    HTForgetViewController *vc = [[HTForgetViewController alloc] init];
    [self.navigationController pushViewController:vc animated:true];
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
//------------------------------------懒加载--------------------------------------


-(UIImageView *)topView {
    if (!_topView) {
        _topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3"]];
        _topView.frame = CGRectMake(0, 0, KWIDTH, scaleX(160));
        _topView.contentMode = UIViewContentModeScaleToFill;
    }
    return _topView;
}

-(UILabel *)topLabel {
    if (!_topLabel){
        _topLabel = [[UILabel alloc] init];
        _topLabel.text = @"赢鑫金融";
        _topLabel.frame = CGRectMake(0, 0, KWIDTH, scaleX(160));
        [_topLabel setTextColor:[UIColor colorWithHexString:@"#A76E22"]];
        _topLabel.font = [UIFont boldSystemFontOfSize:scaleX(50)];
        _topLabel.textAlignment = NSTextAlignmentCenter;
        //分割线
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, scaleX(159), KWIDTH, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [_topLabel addSubview:line];
    }
    return _topLabel;
}

- (UIButton *)switchLoginBtn{
    if (!_switchLoginBtn){
        _switchLoginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, scaleX(160), KWIDTH*0.5, scaleX(40))];
        [_switchLoginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_switchLoginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _switchLoginBtn.titleLabel.font = [UIFont systemFontOfSize:scaleX(13)];
        [_switchLoginBtn addTarget:self action:@selector(switchLoginFunction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _switchLoginBtn;
}

- (UIButton *)switchRegisterBtn{
    if (!_switchRegisterBtn){
        _switchRegisterBtn = [[UIButton alloc] initWithFrame:CGRectMake(KWIDTH*0.5, scaleX(160), KWIDTH*0.5, scaleX(40))];
        [_switchRegisterBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_switchRegisterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _switchRegisterBtn.titleLabel.font = [UIFont systemFontOfSize:scaleX(13)];
        [_switchRegisterBtn addTarget:self action:@selector(switchRegisterFunction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _switchRegisterBtn;
}

-(UIView *)line1{
    if(!_line1) {
        _line1 = [[UIView alloc] initWithFrame:CGRectMake((KWIDTH*0.5-scaleX(20))*0.5, scaleX(195), scaleX(20), 0.8)];
        _line1.backgroundColor = [UIColor redColor];
    }
    return _line1;
}

-(UIView *)line2{
    if(!_line2) {
        _line2 = [[UIView alloc] initWithFrame:CGRectMake((KWIDTH*0.5-scaleX(20))*0.5+KWIDTH*0.5, scaleX(195), scaleX(20), 0.8)];
        _line2.backgroundColor = [UIColor clearColor];
    }
    return _line2;
}

-(UIView *)switchLoginView{
    if (!_switchLoginView) {
        _switchLoginView = [[UIView alloc] initWithFrame:CGRectMake(0, scaleX(200), KWIDTH, KHIGHT*0.5)];
        _switchLoginView.backgroundColor = [UIColor whiteColor];
        [_switchLoginView addSubview:self.loginAccountView];
        [self.loginAccountView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(scaleX(20));
            make.leading.mas_equalTo(scaleX(30));
            make.width.mas_equalTo(KWIDTH-scaleX(60));
            make.height.mas_equalTo(scaleX(40));
        }];
        [_switchLoginView addSubview:self.loginPasswordView];
        [self.loginPasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.loginAccountView.mas_bottom);
            make.leading.mas_equalTo(scaleX(30));
            make.width.mas_equalTo(KWIDTH-scaleX(60));
            make.height.mas_equalTo(scaleX(40));
        }];
        [_switchLoginView addSubview:self.forgetBtn];
        [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.mas_equalTo(self.loginPasswordView);
            make.top.mas_equalTo(self.loginPasswordView.mas_bottom);
            make.height.mas_equalTo(scaleX(30));
        }];
        [_switchLoginView addSubview:self.loginBtn];
        [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.loginPasswordView.mas_bottom).offset(60);
            make.leading.mas_equalTo(scaleX(40));
            make.width.mas_equalTo(KWIDTH-scaleX(80));
            make.height.mas_equalTo(scaleX(40));
        }];
    }
    return _switchLoginView;
}

-(UIView *)switchRegisterView{
    if (!_switchRegisterView) {
        _switchRegisterView = [[UIView alloc] initWithFrame:CGRectMake(0, scaleX(200), KWIDTH, KHIGHT*0.7)];
        _switchRegisterView.backgroundColor = [UIColor whiteColor];
        [_switchRegisterView addSubview:self.registerAccountView];
        [self.registerAccountView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(scaleX(20));
            make.leading.mas_equalTo(scaleX(30));
            make.width.mas_equalTo(KWIDTH-scaleX(60));
            make.height.mas_equalTo(scaleX(40));
        }];
        [_switchRegisterView addSubview:self.registerPasswordView];
        [self.registerPasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.registerAccountView.mas_bottom);
            make.leading.mas_equalTo(scaleX(30));
            make.width.mas_equalTo(KWIDTH-scaleX(60));
            make.height.mas_equalTo(scaleX(40));
        }];
        [_switchRegisterView addSubview:self.verificationCodeView];
        [self.verificationCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.registerPasswordView.mas_bottom);
            make.leading.mas_equalTo(scaleX(30));
            make.width.mas_equalTo(KWIDTH-scaleX(60));
            make.height.mas_equalTo(scaleX(40));
        }];
        [_switchRegisterView addSubview:self.recTelView];
        [self.recTelView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.verificationCodeView.mas_bottom);
            make.leading.mas_equalTo(scaleX(30));
            make.width.mas_equalTo(KWIDTH-scaleX(60));
            make.height.mas_equalTo(scaleX(40));
        }];
        [_switchRegisterView addSubview:self.registerBtn];
        [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.recTelView.mas_bottom).offset(60);
            make.leading.mas_equalTo(scaleX(40));
            make.width.mas_equalTo(KWIDTH-scaleX(80));
            make.height.mas_equalTo(scaleX(40));
        }];
        
        /*
         * 注册协议
         */
        
        [_switchRegisterView addSubview:self.AgreeSelectBtn];
        [self.AgreeSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.registerBtn.mas_bottom).offset(scaleY_6(10));
            make.leading.mas_equalTo(self.registerBtn);
            make.size.mas_equalTo(CGSizeMake(scaleY_6(20), scaleY_6(20)));
        }];
        
        UILabel *textTitleL = [[UILabel alloc]init];
        textTitleL.text = @"我已阅读并同意";
        textTitleL.font = kFontSize6(12);
        textTitleL.textColor = [UIColor lightGrayColor];//[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.8];
        [_switchRegisterView addSubview:textTitleL];
        
        [textTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.AgreeSelectBtn.mas_top);
            make.left.equalTo(self.AgreeSelectBtn.mas_right).offset(scaleX_6(8));
            make.bottom.equalTo(self.AgreeSelectBtn.mas_bottom);
        }];
        
        [_switchRegisterView addSubview:self.underlineButton];
        [_underlineButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.AgreeSelectBtn.mas_centerY);
            make.left.equalTo(textTitleL.mas_right).offset(scaleX_6(5));
        }];
        
        /*
         * 隐私协议
         */
        
        [_switchRegisterView addSubview:self.PrivacySelectBtn];
        [self.PrivacySelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.AgreeSelectBtn.mas_bottom).offset(scaleY_6(5));
            make.leading.mas_equalTo(self.registerBtn);
            make.size.mas_equalTo(CGSizeMake(scaleY_6(20), scaleY_6(20)));
        }];
        
        UILabel *textTitleL1 = [[UILabel alloc]init];
        textTitleL1.text = @"我已阅读并同意";
        textTitleL1.font = kFontSize6(12);
        textTitleL1.textColor = [UIColor lightGrayColor];
        [_switchRegisterView addSubview:textTitleL1];
        
        [textTitleL1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.PrivacySelectBtn.mas_top);
            make.left.equalTo(self.PrivacySelectBtn.mas_right).offset(scaleX_6(8));
            make.bottom.equalTo(self.PrivacySelectBtn.mas_bottom);
        }];
        
        [_switchRegisterView addSubview:self.ysButton];
        [self.ysButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.PrivacySelectBtn.mas_centerY);
            make.left.equalTo(textTitleL1.mas_right).offset(scaleX_6(5));
        }];
    }
    return _switchRegisterView;
}

- (TemplateView *)loginAccountView{
    if (!_loginAccountView) {
        _loginAccountView = [[TemplateView alloc]init];
        _loginAccountView.accountImage.image = [UIImage imageNamed:@"zhanghao"];
        _loginAccountView.accountText.placeholder = @"请输入手机号码";
        _loginAccountView.testSecureTextEntry = NO;
        _loginAccountView.testkeyboardType = YES;
    }
    return _loginAccountView;
}

- (TemplateView *)loginPasswordView{
    if (!_loginPasswordView) {
        _loginPasswordView = [[TemplateView alloc]init];
        _loginPasswordView.accountImage.image = [UIImage imageNamed:@"mima"];
        _loginPasswordView.accountText.placeholder = @"请输入密码";
        _loginPasswordView.testSecureTextEntry = YES;
        _loginPasswordView.testkeyboardType = NO;
    }
    return _loginPasswordView;
}

- (TemplateView *)registerAccountView{
    if (!_registerAccountView) {
        _registerAccountView = [[TemplateView alloc]init];
        _registerAccountView.accountImage.image = [UIImage imageNamed:@"zhanghao"];
        _registerAccountView.accountText.placeholder = @"请输入手机号";
        _registerAccountView.testSecureTextEntry = NO;
        _registerAccountView.testkeyboardType = YES;
    }
    return _registerAccountView;
}

- (TemplateView *)registerPasswordView{
    if (!_registerPasswordView) {
        _registerPasswordView = [[TemplateView alloc]init];
        _registerPasswordView.accountImage.image = [UIImage imageNamed:@"mima"];
        _registerPasswordView.accountText.placeholder = @"请输入密码";
        _registerPasswordView.testSecureTextEntry = YES;
        _registerPasswordView.testkeyboardType = NO;
    }
    return _registerPasswordView;
}

- (VerificationCodeView *)verificationCodeView{
    if (!_verificationCodeView) {
        _verificationCodeView = [[VerificationCodeView alloc]init];
        _verificationCodeView.codeButtonBool = NO;
        _verificationCodeView.accountImage.image = [UIImage imageNamed:@"zhanghao"];
        _verificationCodeView.accountText.placeholder = @"请输入手机验证码";
    
    }
    return _verificationCodeView;
}


- (TemplateView *)recTelView{
    if (!_recTelView) {
        _recTelView = [[TemplateView alloc]init];
        _recTelView.accountImage.image = [UIImage imageNamed:@"mima"];
        _recTelView.accountText.placeholder = @"填写推荐人手机号(选填)";
        _recTelView.testSecureTextEntry = NO;
        _recTelView.testkeyboardType = YES;
    }
    return _recTelView;
}

- (UIButton *)loginBtn{
    if (!_loginBtn){
        _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KWIDTH-scaleX(60), scaleX(40))];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:scaleX(13)];
        _loginBtn.backgroundColor = [UIColor redColor];
        _loginBtn.layer.cornerRadius = scaleX(20);
        _loginBtn.clipsToBounds = true;
        [_loginBtn addTarget:self action:@selector(loginFunction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIButton *)registerBtn{
    if (!_registerBtn){
        _registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KWIDTH-scaleX(60), scaleX(40))];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:scaleX(13)];
        _registerBtn.backgroundColor = [UIColor redColor];
        _registerBtn.layer.cornerRadius = scaleX(20);
        _registerBtn.clipsToBounds = true;
        [_registerBtn addTarget:self action:@selector(registerFunction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}

- (UIButton *)forgetBtn{
    if (!_forgetBtn){
        _forgetBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, scaleX(60), scaleX(40))];
        [_forgetBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:scaleX(11)];
        [_forgetBtn sizeToFit];
        [_forgetBtn addTarget:self action:@selector(forgetPasswordFunction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetBtn;
}

- (UnderlineButton *)underlineButton{
    if (!_underlineButton) {
        _underlineButton = [UnderlineButton buttonWithType:UIButtonTypeCustom];
        [_underlineButton setColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.8]];
        _underlineButton.titleLabel.font = kFontSize6(12);
        [_underlineButton setTitle:@"<注册协议>" forState:UIControlStateNormal];
        [_underlineButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_underlineButton addTarget:self action:@selector(ClickagreeBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _underlineButton;
}

- (UnderlineButton *)ysButton{
    if (!_ysButton) {
        _ysButton = [UnderlineButton buttonWithType:UIButtonTypeCustom];
        [_ysButton setColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.8]];
        _ysButton.titleLabel.font = kFontSize6(12);
        [_ysButton setTitle:@"<隐私协议>" forState:UIControlStateNormal];
        [_ysButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_ysButton addTarget:self action:@selector(ClickYSBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ysButton;
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
