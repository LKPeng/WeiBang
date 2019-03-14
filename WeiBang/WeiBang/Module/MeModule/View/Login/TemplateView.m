//
//  TemplateView.m
//  WeiBang
//
//  Created by tchzt on 2019/2/26.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "TemplateView.h"

@interface TemplateView()<UITextFieldDelegate>

@end

@implementation TemplateView

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
    
    UIView *AccountLine = [[UIView alloc]init];
    AccountLine.backgroundColor = kappLineColor;
    [self addSubview:AccountLine];
    
    
    [self.accountImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self.accountText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountImage.mas_right).offset(10);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.right.equalTo(self);
    }];
    
    [AccountLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

- (void)layoutSubviews{//test.secureTextEntry
    [super layoutSubviews];
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:self.accountText.placeholder];
    [placeholder addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:14]
                        range:NSMakeRange(0, self.accountText.placeholder.length)];
    _accountText.attributedPlaceholder = placeholder;
}

- (void)setTestSecureTextEntry:(BOOL)testSecureTextEntry{
    _testSecureTextEntry = testSecureTextEntry;
    if (testSecureTextEntry) {
        self.accountText.secureTextEntry = YES;
    }else{
        self.accountText.secureTextEntry = NO;
    }
    
}

- (void)setTestkeyboardType:(BOOL)testkeyboardType{
    _testkeyboardType = testkeyboardType;
    if (testkeyboardType) {
        self.accountText.keyboardType = UIKeyboardTypeNumberPad;
    }else{
        self.accountText.keyboardType = UIKeyboardTypeDefault;
    }
    
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
@end



