//
//  LendTableViewCell.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "LendTableViewCell.h"

@interface LendTableViewCell()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *replaceView_height_const;//45
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *replaceView_left_const;//20
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *replaceView_top_const;//200
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *replaceView_right_const;//20

@property (weak, nonatomic) IBOutlet UILabel *time_in;
@property (weak, nonatomic) IBOutlet UILabel *time_start;
@property (weak, nonatomic) IBOutlet UILabel *time_keep;
@property (weak, nonatomic) IBOutlet UILabel *time_end;

@end

@implementation LendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    self.replaceView_top_const.constant     = scaleX_6(200);
    self.replaceView_left_const.constant    = scaleX_6(20);
    self.replaceView_right_const.constant   = scaleX_6(20);
    self.replaceView_height_const.constant  = scaleX_6(45);
    
    self.time_in.text       = [self getCurrentTimesAddDays:0];
    self.time_start.text    = [self getCurrentTimesAddDays:1];
    self.time_keep.text     = [self getCurrentTimesAddDays:30];
    self.time_end.text      = [self getCurrentTimesAddDays:365];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(NSString*)getCurrentTimesAddDays:(NSInteger)days{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYY.MM.dd"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    NSTimeInterval  oneDay = 24*60*60*1;
    
    if (days > 0){
        NSDate *theDate = [datenow initWithTimeIntervalSinceNow: +oneDay*days ];
        NSString *currentTimeString = [formatter stringFromDate:theDate];
        return currentTimeString;
    }else{
        NSString *currentTimeString = [formatter stringFromDate:datenow];
        return currentTimeString;
    }
}

@end
