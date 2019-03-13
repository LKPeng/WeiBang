//
//  AccountOperationTableViewCell.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "AccountOperationTableViewCell.h"

@interface AccountOperationTableViewCell()
@property (strong, nonatomic) UIButton *rechargeButton;//充值
@property (strong, nonatomic) UIButton *withdrawalButton;//提现

@end

@implementation AccountOperationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

-(void)setUp{
    [self addSubview:self.rechargeButton];
    [self.rechargeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(scaleY(10));
        make.bottom.mas_equalTo(scaleY(-10));
        make.left.mas_equalTo(scaleX(50));
        make.width.mas_equalTo(scaleX(80));
    }];
    [self addSubview:self.withdrawalButton];
    [self.withdrawalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.rechargeButton.mas_top);
        make.centerY.mas_equalTo(self.rechargeButton.mas_centerY);
        make.width.mas_equalTo(self.rechargeButton.mas_width);
        make.right.mas_equalTo(scaleX(-50));
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//--事件
-(void)rechargeFunction{
    self.rechargeBlock? : self.rechargeBlock();
}
-(void)withdrawalFunction{
    self.withdrawBlock? : self.withdrawBlock();
}
//--懒加载
- (UIButton *)rechargeButton{
    if (!_rechargeButton) {
        _rechargeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rechargeButton setTitle:@"充值" forState:UIControlStateNormal];
        [_rechargeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _rechargeButton.layer.cornerRadius = autoSizeScale6(6);
        _rechargeButton.layer.borderWidth  = autoSizeScale6(0.8);
        _rechargeButton.layer.borderColor  = UIColor.redColor.CGColor;
        _rechargeButton.titleLabel.font = kFontSize6(13);
        _rechargeButton.clipsToBounds = true;
        weakself
        [_rechargeButton addButtonActionClickHandler:^(NSInteger tagIndex) {
            strongself
            !self.rechargeBlock? : self.rechargeBlock();
        }];
    }
    return _rechargeButton;
}

- (UIButton *)withdrawalButton{
    if (!_withdrawalButton) {
        _withdrawalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_withdrawalButton setTitle:@"提现" forState:UIControlStateNormal];
        [_withdrawalButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _withdrawalButton.layer.cornerRadius = autoSizeScale6(6);
        _withdrawalButton.layer.borderWidth  = autoSizeScale6(0.8);
        _withdrawalButton.layer.borderColor  = UIColor.redColor.CGColor;
        _withdrawalButton.titleLabel.font = kFontSize6(13);
        _withdrawalButton.clipsToBounds = true;
        weakself
        [_withdrawalButton addButtonActionClickHandler:^(NSInteger tagIndex) {
            strongself
            !self.withdrawBlock? : self.withdrawBlock();
        }];
    }
    return _withdrawalButton;
}
@end
