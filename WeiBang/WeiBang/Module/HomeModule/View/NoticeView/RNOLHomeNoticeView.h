//
//  RNOLHomeNoticeView.h
//  RongNiuOnline
//
//  Created by apple on 2018/4/8.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RNOLHomeNoticeView : UIView


@property (nonatomic,strong) NSArray *msgArray;
@property (nonatomic,copy) void (^noticeIndexBlock)(NSInteger index);
@property (nonatomic,copy) dispatch_block_t  moreBlock;

@end
