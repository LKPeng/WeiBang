//
//  DiscoverTableViewCell.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/26.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "DiscoverTableViewCell.h"

@interface DiscoverTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *icon_right_const;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *time_left_const;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *icon_left_const;
@end

@implementation DiscoverTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.icon_right_const.constant = scaleX(10);
    self.time_left_const.constant = scaleX(10);
    self.icon_left_const.constant = scaleX(15);
}

-(void)setDataWithIndexpath:(NSIndexPath *)indexpath{
    if (indexpath.row == 0) {
        self.contentLabel.text = @"和赵丽颖飙过对手戏!论演员p粉的自我修养";
        self.timeLabel.text = @"2天前";
        self.iconImageView.image = [UIImage imageNamed:@"u=3299395027,4156645097&fm=26&gp=0"];
    }else if (indexpath.row == 1) {
        self.contentLabel.text = @"合伙人佣金1.2万!ta推荐的亲友已经收益50多万";
        self.timeLabel.text = @"3个小时前";
        self.iconImageView.image = [UIImage imageNamed:@"u=3132686255,1654105307&fm=200&gp=0"];
    }else if (indexpath.row == 2) {
        self.contentLabel.text = @"求教!手握7张神券,大家来说说哪个最合算?";
        self.timeLabel.text = @"3天前";
        self.iconImageView.image = [UIImage imageNamed:@"u=3496345838,732839400&fm=26&gp=0"];
    }else if (indexpath.row == 3) {
        self.contentLabel.text = @"低PE值股票更安全,更值得投资吗?";
        self.timeLabel.text = @"6个小时前";
        self.iconImageView.image = [UIImage imageNamed:@"u=370587021,1045835663&fm=72"];
    }else if (indexpath.row == 4) {
        self.contentLabel.text = @"为了女优,大学生辞职回乡当保安,这个故事还有反转";
        self.timeLabel.text = @"昨天";
        self.iconImageView.image = [UIImage imageNamed:@"u=3220681365,3634029949&fm=26&gp=0"];
    }else if (indexpath.row == 5) {
        self.contentLabel.text = @"PPMoney成中互金协会首批项目公示单位 信息透明度再上新阶";
        self.timeLabel.text = @"5天前";
        self.iconImageView.image = [UIImage imageNamed:@"u=1968244136,3721688661&fm=26&gp=0"];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
