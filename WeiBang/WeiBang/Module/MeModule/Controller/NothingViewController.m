//
//  NothingViewController.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/20.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "NothingViewController.h"

@interface NothingViewController ()
{
    NSString *_titleText;
}
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
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
