//
//  MyTranlateController.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/15.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MyTranlateController.h"

#import "TranslateView.h"
@interface MyTranlateController ()

@end

@implementation MyTranlateController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavBarTitleViewWithText:@"安全保障"];
    TranslateView *late = [[TranslateView alloc]init];

    [self.view addSubview:late];
    [late mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(scaleY_6(150));
        make.left.right.equalTo(self);
        make.height.mas_equalTo(scaleY_6(450));
    }];
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
