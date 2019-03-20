//
//  HomeFootView.m
//  WeiBang
//
//  Created by tchzt on 2019/3/18.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "HomeFootView.h"
#import "HomeModel.h"
#import "RNOLNewHandInvestViewController.h"

#define kappMainGreen     RGB(54,153,30)
#define kappMainTitleGray  [UIColor colorWithRed:195/255.0 green:195/255.0 blue:195/255.0 alpha:1.0f]

@interface HomeFootView ()

@property(nonatomic,strong)UILabel *totalLabel;

@property(nonatomic,strong)UILabel *startLabel;

@property(nonatomic,strong)UIButton *immediatelyButton;
@end
@implementation HomeFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self addSubview:self.totalLabel];
    [self addSubview:self.startLabel];
    [self addSubview:self.immediatelyButton];
    
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.right.equalTo(self.mas_centerX).offset(- scaleX_6(10));
    }];
    
    [_startLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self.mas_centerX).offset( scaleX_6(10));
    }];
    
    [_immediatelyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(scaleX_6(15));
        make.right.equalTo(self).offset(-scaleX_6(15));
        make.top.equalTo(self.totalLabel.mas_bottom).offset(scaleY_6(10));
        make.height.mas_equalTo(scaleY_6(45));
    }];
}

- (void)setModel:(HomeModel *)model{
    _model = model;
    NSString *str0 = [NSString stringWithFormat:@"%.2f",model.total];
    NSMutableAttributedString *indroStr = [NSString setupAttributeString:[NSString stringWithFormat:@"总额 %@ 元",str0] rangeText:str0 textColor:[UIColor blackColor]];
    self.totalLabel.attributedText = indroStr;
    NSString *str1 = [NSString stringWithFormat:@"起投金额 %ld 元",(long)model.startAccount];
    NSMutableAttributedString *indroStr1 = [NSString setupAttributeString:str1 rangeText:[NSString stringWithFormat:@"%ld",(long)model.startAccount] textColor:[UIColor blackColor]];
    self.startLabel.attributedText = indroStr1;
}

#pragma mark ----   点击事件  ----

- (void)immediatelyButtonClick{
    UIViewController *controller = [self findViewController:self];
    
    RNOLNewHandInvestViewController *rechargeInfor = [[RNOLNewHandInvestViewController alloc]init];
    
    [controller.navigationController pushViewController:rechargeInfor animated:YES];
}
//获取当前控制器
- (UIViewController *)findViewController:(UIView *)sourceView
{
    id target=sourceView;
    while (target) {
        target = ((UIResponder *)target).nextResponder;
        if ([target isKindOfClass:[UIViewController class]]) {
            break;
        }
    }
    return target;
}

#pragma mark ----   懒加载  ----

- (UILabel *)totalLabel{
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.font = kFontSize6(14);
        _totalLabel.textColor = kappMainTitleGray;
    }
    return _totalLabel;
}

- (UILabel *)startLabel{
    if (!_startLabel) {
        _startLabel = [[UILabel alloc]init];
        _startLabel.font = kFontSize6(14);
        _startLabel.textColor = kappMainTitleGray;
    }
    return _startLabel;
}

- (UIButton *)immediatelyButton{
    if (!_immediatelyButton) {
        _immediatelyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _immediatelyButton.backgroundColor = kappMainGreen;
        _immediatelyButton.titleLabel.textColor = [UIColor whiteColor];
        [_immediatelyButton setTitle:@"立即投资" forState:UIControlStateNormal];
        _immediatelyButton.titleLabel.font = kFontSize6(14);
        weakself
        [_immediatelyButton addButtonActionClickHandler:^(NSInteger tagIndex) {
            strongself
            [strongSelf immediatelyButtonClick];
        }];
    }
    return _immediatelyButton;
}
@end






