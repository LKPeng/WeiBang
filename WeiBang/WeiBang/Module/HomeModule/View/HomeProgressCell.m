//
//  HomeProgressCell.m
//  WeiBang
//
//  Created by tchzt on 2019/3/18.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "HomeProgressCell.h"
#import "CircleProgressView.h"
#import "HomeModel.h"

#define kappMainGreen     RGB(54,153,30)
#define kappMainOrange    RGB(248,124,6)
#define kappMainGray      RGB(175,175,175)
#define kappMainTitleGray RGB(195,195,195)

@interface HomeProgressCell ()
@property(nonatomic,strong)UILabel *termLabel;
@property(nonatomic,weak) CircleProgressView *circleProgressView;
@end

@implementation HomeProgressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

-(void)setUp{
    CGFloat progressViewWH = scaleX_6(200);
    CGFloat progressViewX = (SCREEN_WIDTH - progressViewWH) / 2 ;
    CGFloat progressViewY = scaleY_6(40) ;
    
    CircleProgressView *circleProgressView = [[CircleProgressView alloc] initWithFrame:CGRectMake(progressViewX, progressViewY, progressViewWH , progressViewWH) withRadius:80.0f withLineWidth:5.0f];
    
    [self.contentView addSubview:circleProgressView];
    self.circleProgressView = circleProgressView;
    
    
    [self.contentView addSubview:self.termLabel];
    
}

- (void)setModel:(HomeModel *)model{
    _model = model;
    [self.circleProgressView updateProgress:model.Progress andTerm:model.term];
    self.circleProgressView.backClear = NO;
    self.termLabel.text = model.moneyTerm;
}

#pragma mark ----   懒加载  ----
-(UILabel *)termLabel
{
    if (!_termLabel) {
        CGFloat width = SCREEN_WIDTH;
        CGFloat height = scaleY_6(40);
        CGFloat x = 0;
        CGFloat y = 0;
        
        _termLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
        _termLabel.font = kBoldFontSize6(18);
        _termLabel.textColor = [UIColor blackColor];
        _termLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _termLabel;
}
@end
