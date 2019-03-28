//
//  NothingViewController.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/20.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "NothingViewController.h"
#import "CopyrightTipLabel.h"

@interface NothingViewController ()
{
    NSString *_titleText;
}
@property(nonatomic,strong) CopyrightTipLabel *tipLabel;
@property(nonatomic,strong) UIImageView *tipImageView;
@property(nonatomic,strong) UILabel *noDataLabel;
@end

@implementation NothingViewController

-(void)setTitleText:(NSString *)titleText{
    _titleText = titleText;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupNavBarTitleViewWithText:self.titleText];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F0F0F0"];
    
//    [self.view addSubview:self.tipLabel];
    [self.view addSubview:self.tipImageView];
    [self.tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(128);
        make.height.mas_equalTo(84);
        make.top.mas_equalTo(KHIGHT*0.5-50);
        make.leading.mas_equalTo(KWIDTH*0.5-self.tipImageView.width*0.5);
    }];
    
    [self.view addSubview:self.noDataLabel];
    [self.noDataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tipImageView.mas_bottom).mas_offset(5);
        make.centerX.mas_equalTo(self.tipImageView.mas_centerX);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel = [[CopyrightTipLabel alloc] initWithFrame:CGRectMake(0, self.view.height-20, KWIDTH, 15)];
    }
    return _tipLabel;
}

- (UIImageView *)tipImageView{
    if (!_tipImageView) {
        _tipImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nothing_icon"]];
    }
    return _tipImageView;
}

-(UILabel *)noDataLabel {
    if(!_noDataLabel) {
        _noDataLabel = [[UILabel alloc] init];
        _noDataLabel.text = @"暂无数据";
        [_noDataLabel setTextColor:[UIColor lightGrayColor]];
        _noDataLabel.font = [UIFont systemFontOfSize:scaleX(12)];
    }
    return _noDataLabel;
}

@end
