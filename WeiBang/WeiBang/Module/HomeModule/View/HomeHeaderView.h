//
//  HomeHeaderView.h
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/12.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeHeaderView : UIView
@property (nonatomic,copy) dispatch_block_t newUserBlock;
@property (nonatomic,copy) dispatch_block_t loanBlock;
@property (nonatomic,copy) dispatch_block_t newsBlock;
@end
