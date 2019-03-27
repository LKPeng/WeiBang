//
//  MeItemTableViewCell.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MeItemTableViewCell.h"

@implementation MeItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//优惠券
- (IBAction)youhui:(UIButton *)sender {
    !self.yhqBlock? : self.yhqBlock();
}
//银行卡
- (IBAction)yinhangka:(UIButton *)sender {
    !self.yhkBlock? : self.yhkBlock();
}

//我的积分
- (IBAction)jifen:(UIButton *)sender {
    !self.wdjfBlock? : self.wdjfBlock();
}

//关于我们
- (IBAction)gaunyuwomen:(UIButton *)sender {
    !self.gywmBlock? : self.gywmBlock();
}

//客服中心
- (IBAction)kefuzhongxin:(UIButton *)sender {
    !self.kfzxBlock? : self.kfzxBlock();
}

@end
