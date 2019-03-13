//
//  AccountOperationTableViewCell.h
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountOperationTableViewCell : UITableViewCell
@property (nonatomic,copy) dispatch_block_t rechargeBlock;
@property (nonatomic,copy) dispatch_block_t withdrawBlock;
@end
