//
//  RNOLInvestDetailListCell.h
//  RongNiuOnline
//
//  Created by apple on 2018/5/23.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RNOLInvestDetailListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;
@property (weak, nonatomic) IBOutlet UIImageView *rightArrowImageView;

@end
