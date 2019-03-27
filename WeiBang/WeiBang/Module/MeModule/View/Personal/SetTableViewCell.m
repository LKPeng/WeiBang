//
//  SetTableViewCell.m
//  WeiBang
//
//  Created by lkp on 2019/3/13.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "SetTableViewCell.h"

@interface SetTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation SetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setTitleWithRow:(NSInteger)row{
    if (row == 0) {
        self.titleLabel.text = @"账户安全";
    }else if (row == 1) {
        self.titleLabel.text = @"清除缓存";
    }else if (row == 2) {
        self.titleLabel.text = @"推送设置";
    }else if (row == 3) {
        self.titleLabel.text = @"获取缓存大小";
    }else if (row == 4) {
        self.titleLabel.text = @"关于我们";
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
