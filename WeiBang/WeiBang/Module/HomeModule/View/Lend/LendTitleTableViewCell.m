//
//  LendTitleTableViewCell.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "LendTitleTableViewCell.h"

@interface LendTitleTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation LendTitleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

-(void)setTitleWithIndexPath:(NSIndexPath*)indexPath{
    if (indexPath.row == 0) {
        self.titleLabel.text = @"服务介绍";
    }else if (indexPath.row == 1) {
        self.titleLabel.text = @"风险揭示书";
    }else if (indexPath.row == 2) {
        self.titleLabel.text = @"常见问题";
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
