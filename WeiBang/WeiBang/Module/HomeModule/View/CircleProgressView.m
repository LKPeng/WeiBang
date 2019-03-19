//
//  CircleProgressView.m
//  WeiBang
//
//  Created by tchzt on 2019/3/18.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "CircleProgressView.h"

#define kappMainOrange  [UIColor colorWithRed:248/255.0 green:124/255.0 blue:6/255.0 alpha:1.0f]
#define kappMainGray  [UIColor colorWithRed:175/255.0 green:175/255.0 blue:175/255.0 alpha:1.0f]
#define kappMainTitleGray  [UIColor colorWithRed:195/255.0 green:195/255.0 blue:195/255.0 alpha:1.0f]

@interface CircleProgressView ()

@property(nonatomic,strong)CAShapeLayer *progressLayer;

@property(nonatomic,strong)UILabel *label;

@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)UILabel *termLabel;

@property(nonatomic,strong)UILabel *lineLabel;

@end

@implementation CircleProgressView


-(instancetype)initWithFrame:(CGRect)frame withRadius:(CGFloat)radius withLineWidth:(CGFloat)lineWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.lineWidth = lineWidth;
        self.defaultColor = kappMainGray;
        self.progressColor = kappMainOrange;
        self.progress = 0.0f;
        self.radius = self.frame.size.width / 2;
        
        // 环
        CGFloat circleX = self.frame.size.width / 2 - self.radius;
        CGFloat circleY = self.frame.size.height / 2 - self.radius;
        CGFloat circleWidth = self.radius * 2;
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(circleX, circleY, circleWidth, circleWidth) cornerRadius:self.radius];
        
        // 环形layer
        CAShapeLayer *circleLayer = [CAShapeLayer layer];
        circleLayer.fillColor = [UIColor clearColor].CGColor;
        circleLayer.strokeColor = self.defaultColor.CGColor;
        //    circleLayer.lineCap = kCALineCapRound;
        circleLayer.lineWidth = self.lineWidth;
        circleLayer.path = circlePath.CGPath;
        circleLayer.strokeEnd = 1;
        [self.layer addSublayer:circleLayer];
        
        // 进度layer
        self.progressLayer = [CAShapeLayer layer];
        self.progressLayer.fillColor = [UIColor clearColor].CGColor;
        self.progressLayer.strokeColor = self.progressColor.CGColor;
        self.progressLayer.lineCap = kCALineCapRound;
        self.progressLayer.lineWidth = self.lineWidth;
        self.progressLayer.path = circlePath.CGPath;
        self.progressLayer.strokeEnd = 0;
        [self.layer addSublayer:self.progressLayer];
        
        [self label];
        [self titleLabel];
        [self termLabel];
        [self lineLabel];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
}

- (void)setBackClear:(BOOL)backClear{
    _backClear = backClear;
    if (backClear) {
        self.termLabel.hidden = YES;
        self.lineLabel.hidden = YES;
        self.titleLabel.hidden = YES;
    }else{
        self.termLabel.hidden = NO;
        self.lineLabel.hidden = NO;
        self.titleLabel.hidden = NO;
    }
}

#pragma mark - lazy load
-(UILabel *)label
{
    if (!_label) {
        CGFloat width = self.frame.size.width - scaleX_6(30);
        CGFloat height = scaleY_6(50);
        CGFloat x = (self.frame.size.width - width) / 2;
        CGFloat y = (self.frame.size.height - height) / 2;
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
        _label.text = @"8.68%";
        _label.font = kBoldFontSize6(28);
        _label.textColor = kappMainOrange;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_label];
    }
    return _label;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        CGFloat width = self.frame.size.width - scaleX_6(30);
        CGFloat height = scaleY_6(35);
        CGFloat x = (self.frame.size.width - width) / 2;
        CGFloat y = (self.frame.size.height - height) / 2;
        //加上label高度
        y = y - scaleY_6(35);
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
        _titleLabel.text = @"年化收益";
        _titleLabel.font = kBoldFontSize6(18);
        _titleLabel.textColor = kappMainTitleGray;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

-(UILabel *)termLabel
{
    if (!_termLabel) {
        CGFloat width = self.frame.size.width - scaleX_6(30);
        CGFloat height = scaleY_6(35);
        CGFloat x = (self.frame.size.width - width) / 2;
        CGFloat y = (self.frame.size.height - height) / 2;
        //加上label高度
        y = y + scaleY_6(50);
        
        _termLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
        _termLabel.font = kBoldFontSize6(18);
        _termLabel.textColor = kappMainTitleGray;
        _termLabel.textAlignment = NSTextAlignmentCenter;
        _termLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_termLabel];
    }
    return _termLabel;
}

-(UILabel *)lineLabel
{
    if (!_lineLabel) {
        CGFloat width = self.frame.size.width - scaleX_6(30);
        CGFloat height = scaleY_6(5);
        CGFloat x = (self.frame.size.width - width) / 2;
        CGFloat y = (self.frame.size.height - height) / 2;
        //加上label高度
        y = y + scaleY_6(25);
        
        _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
        _lineLabel.font = kBoldFontSize6(18);
        _lineLabel.textColor = kappMainTitleGray;
        _lineLabel.text = @"--------";
        _lineLabel.textAlignment = NSTextAlignmentCenter;
        _lineLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_lineLabel];
    }
    return _lineLabel;
}

#pragma mark - 富文本设置部分字体颜色


#pragma mark - private method
-(void)updateProgress:(CGFloat)progress andTerm:(NSInteger)term
{
    NSString *str = [NSString stringWithFormat:@"期限 %ld 天",(long)term];
    NSMutableAttributedString *indroStr = [NSString setupAttributeString:str rangeText:[NSString stringWithFormat:@"%ld",term] textColor:[UIColor blackColor]];
    self.termLabel.attributedText= indroStr;
    
    self.progress = progress;
    self.label.text = [NSString stringWithFormat:@"%.2f%%",progress*100];
    self.progressLayer.strokeEnd = progress;
    //开始执行扇形动画
    CABasicAnimation *strokeEndAni = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAni.fromValue = @0;
    strokeEndAni.toValue = @(self.progress);
    strokeEndAni.duration = 1.0f;
    strokeEndAni.repeatCount = 1; // 重复次数
    [self.progressLayer addAnimation:strokeEndAni forKey:@"ani"];
}

@end
