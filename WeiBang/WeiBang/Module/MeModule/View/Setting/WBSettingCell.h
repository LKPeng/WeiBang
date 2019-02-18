//
//  WBSettingCell.h
//  WeiBang
//
//  Created by tchzt on 2019/2/18.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  设置cell的各种状态
 */
typedef enum{
    SettingPassWord,
    SettingNormal,
    SettingSwich
}SettingState;

@interface WBSettingCell : UITableViewCell

@property (strong, nonatomic) UILabel *titleLabel;

@property (nonatomic, assign) SettingState type;

@end
