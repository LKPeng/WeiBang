//
//  OpenCell.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "OpenCell.h"
@interface OpenCell()


@end

@implementation OpenCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self.contentView addSubview:self.open];
    
    [self.open mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(scaleX_6(10));
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.equalTo(self).offset(-scaleX_6(10));
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:self.open.placeholder];
    [placeholder addAttribute:NSFontAttributeName
                        value:kFontSize6(15)
                        range:NSMakeRange(0, self.open.placeholder.length)];
    _open.attributedPlaceholder = placeholder;
    
}

- (UITextField *)open{
    if (!_open) {
        _open = [[UITextField alloc]init];
    }
    return _open;
}
@end
