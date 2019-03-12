//
//  RNOLHomeNoticeView.m
//  RongNiuOnline
//
//  Created by apple on 2018/4/8.
//  Copyright © 2018年 rongniu. All rights reserved.
//

#import "RNOLHomeNoticeView.h"

@interface RNOLHomeNoticeView()

@property (nonatomic,strong) UIImageView *voiceImgView;
@property (nonatomic,strong) SDCycleScrollView *autoScrollView;
@property (nonatomic,strong) UILabel *moreLabel;

@end


@implementation RNOLHomeNoticeView


- (UIImageView *)voiceImgView{
    if (!_voiceImgView) {
        _voiceImgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 12 , 12)];
        _voiceImgView.image = [UIImage imageNamed:@"notice.png"];
        _voiceImgView.centerY = self.height/2.0;
    }
    return _voiceImgView;
    
}

- (SDCycleScrollView *)autoScrollView{
    if (!_autoScrollView) {
        _autoScrollView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(50, 0, 200 , 25)];
        _autoScrollView.centerY = self.height/2.0;
        _autoScrollView.onlyDisplayText = YES;
        [_autoScrollView disableScrollGesture];
        _autoScrollView.titleLabelTextFont = KFontSize(12);
        _autoScrollView.titleLabelTextColor = UIColor.lightGrayColor;
        _autoScrollView.titleLabelBackgroundColor = KWhiteColor;
        _autoScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
        _autoScrollView.backgroundColor = [UIColor whiteColor];
    }
    return _autoScrollView;
}

- (UILabel *)moreLabel{
    if (!_moreLabel) {
        _moreLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.autoScrollView.frame), 0, 44 , 15)];
        _moreLabel.textAlignment = NSTextAlignmentRight;
        _moreLabel.text = @"";
        _moreLabel.frame = CGRectMake(CGRectGetMaxX(self.autoScrollView.frame), 0, 44 , 15);
        _moreLabel.centerY = self.height/2.0;
    }
    return _moreLabel;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview: self.voiceImgView];
        [self addSubview: self.autoScrollView];
        [self addSubview: self.moreLabel];
        [self layoutUI];
        
        weakself;
        self.moreLabel.userInteractionEnabled = YES ;
        [self.moreLabel addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            strongself;
            //更多
            !self.moreBlock? : self.moreBlock();
         }];
    }
    return self;
}

- (void)layoutUI{
    [self.voiceImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.height.equalTo(@12);
        make.left.equalTo(@15);
    }];
    
    [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.equalTo(@44);
        make.height.equalTo(@25);
        make.right.equalTo(self).offset(-15);
    }];
    
    [self.autoScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.voiceImgView).offset(20);
        make.right.equalTo(self.moreLabel.mas_left).offset(-20);
        make.height.equalTo(@25);
        make.centerY.equalTo(self);
    }];
}


- (void)setMsgArray:(NSArray *)msgArray{
    _msgArray = msgArray ;
    self.autoScrollView.titlesGroup = msgArray;
    weakself;
    [self.autoScrollView setClickItemOperationBlock:^(NSInteger currentIndex) {
        strongself;
        !self.noticeIndexBlock? : self.noticeIndexBlock(currentIndex);
    }];
}


@end
