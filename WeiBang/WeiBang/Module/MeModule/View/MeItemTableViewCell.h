//
//  MeItemTableViewCell.h
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeItemTableViewCell : UITableViewCell
@property (nonatomic,copy) dispatch_block_t yhqBlock;
@property (nonatomic,copy) dispatch_block_t yhkBlock;
@property (nonatomic,copy) dispatch_block_t wdjfBlock;
@property (nonatomic,copy) dispatch_block_t gywmBlock;
@property (nonatomic,copy) dispatch_block_t kfzxBlock;
@end
