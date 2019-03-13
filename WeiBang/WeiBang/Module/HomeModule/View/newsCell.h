//
//  newsCell.h
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/13.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsBulletinModel;
NS_ASSUME_NONNULL_BEGIN

@interface newsCell : UITableViewCell
@property(nonatomic, strong) NewsBulletinModel *model;

@property (nonatomic,assign) NSInteger row;
@end

NS_ASSUME_NONNULL_END
