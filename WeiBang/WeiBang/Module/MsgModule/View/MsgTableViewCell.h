//
//  MsgTableViewCell.h
//  WeiBang
//
//  Created by tchzt on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MsgModel;
@interface MsgTableViewCell : UITableViewCell
/* 设备 */
@property (strong, nonatomic) MsgModel *msgModel;
@end
