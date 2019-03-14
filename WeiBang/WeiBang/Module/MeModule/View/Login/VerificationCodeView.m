//
//  VerificationCodeView.m
//  WeiBang
//
//  Created by tchzt on 2019/2/26.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "VerificationCodeView.h"
#define labelColor  RGB(166.0,166.0,166.0)

@interface VerificationCodeView ()<UITextFieldDelegate>
@property (nonatomic,strong) UIButton *codeButton;
@end
@implementation VerificationCodeView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setup];
    }
    return self;
}

- (void)setup{
    [self addSubview:self.accountImage];
    [self addSubview:self.accountText];
    [self addSubview: self.codeButton];
    
    UIView *AccountLine = [[UIView alloc]init];
    AccountLine.backgroundColor = kappLineColor;
    [self addSubview:AccountLine];
    
    
    [self.accountImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(80);
        make.height.equalTo(@30);
    }];
    
    
    [self.accountText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountImage.mas_right).offset(10);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.right.equalTo(self.codeButton.mas_left).offset(-15);
    }];
    

    
    [AccountLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

- (void)setCodeButtonBool:(BOOL)codeButtonBool{
    _codeButtonBool = codeButtonBool;
    if (codeButtonBool) {
        self.codeButton.hidden = YES;
    }else{
        self.codeButton.hidden = NO;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:self.accountText.placeholder];
    [placeholder addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:14]
                        range:NSMakeRange(0, self.accountText.placeholder.length)];
    _accountText.attributedPlaceholder = placeholder;
    
    
    
    if (self.codeButtonBool) {
        [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-15);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.width.mas_equalTo(0);
            make.height.equalTo(@30);
        }];
        
        
        [self.accountText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.accountImage.mas_right).offset(10);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.right.equalTo(self).offset(-15);
        }];
    }else{
        [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-15);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.width.mas_equalTo(80);
            make.height.equalTo(@30);
        }];
        
        
        [self.accountText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.accountImage.mas_right).offset(10);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.right.equalTo(self.codeButton.mas_left).offset(-15);
        }];
    }
}



#pragma mark- 获取验证码
- (void)getCodeAction:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(getCodeNumber)]) {
        [self.delegate getCodeNumber];
    }
//    [button addStartTime:60 title:@"发送验证码" waitTittle:@"秒"];
    [MBProgressHUD showMessage:@"发送成功"];
}

#pragma mark ----   UITextFieldDelegate  ----

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];//取消第一响应者
    
    return YES;
}


#pragma mark ----   懒加载  ----

- (UIImageView *)accountImage{
    if (!_accountImage) {
        _accountImage = [[UIImageView alloc]init];
    }
    return _accountImage;
}

- (UITextField *)accountText{
    if (!_accountText) {
        _accountText = [[UITextField alloc]init];
        _accountText.delegate = self;
        _accountText.returnKeyType = UIReturnKeyDone;
    }
    return _accountText;
}

- (UIButton *)codeButton{
    if (!_codeButton) {
        _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _codeButton.backgroundColor = [UIColor whiteColor];
        [_codeButton setTitleColor:kappRed forState:UIControlStateNormal];
        [_codeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        _codeButton.titleLabel.font = KFontSize(12);
        [_codeButton.layer setCornerRadius:5];
        _codeButton.layer.masksToBounds = YES;
        [_codeButton.layer setBorderColor:kappRed.CGColor];
        [_codeButton.layer setBorderWidth:1.0];
        [_codeButton addTarget:self action:@selector(getCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeButton;
}
@end
