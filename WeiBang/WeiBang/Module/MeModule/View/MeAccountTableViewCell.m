//
//  MeAccountTableViewCell.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MeAccountTableViewCell.h"
#import "OpenViewController.h"

@implementation MeAccountTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)rechargeClick:(UIButton *)sender {
    
    UIViewController *controller = [self findViewController:self];
    
    OpenViewController *setting = [[OpenViewController alloc]init];
    
    [controller.navigationController pushViewController:setting animated:YES];
}

- (IBAction)withdrawClick:(UIButton *)sender {
    [MBProgressHUD showMessage:@"您暂时没有余额"];
}

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


@end
