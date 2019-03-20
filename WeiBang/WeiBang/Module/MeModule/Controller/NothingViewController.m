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
    self.view.backgroundColor = kappMainColor;
    
    [self.view addSubview:self.tipLabel];
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

@end
