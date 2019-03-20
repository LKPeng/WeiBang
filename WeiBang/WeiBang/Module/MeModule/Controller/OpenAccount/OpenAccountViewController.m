//
//  OpenAccountViewController.m
//  WeiBang
//
//  Created by lkp on 2019/3/13.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "OpenAccountViewController.h"

@interface OpenAccountViewController ()
@property (weak, nonatomic) IBOutlet UIButton *openButton;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *userNumberField;
@property (weak, nonatomic) IBOutlet UITextField *telTextField;

@end

@implementation OpenAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupNavBarTitleViewWithText:@"开户"];
    self.openButton.layer.cornerRadius = 25;
    self.openButton.clipsToBounds = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}


- (IBAction)openAccountButton:(UIButton *)sender {
    if (self.userTextField.text.length == 0) {
        [MBProgressHUD showMessage:@"请填写真实姓名"];
        return;
    }
    
    if (self.userNumberField.text.length == 0) {
        [MBProgressHUD showMessage:@"请填写身份证号码"];
        return;
    }
    
    if (self.telTextField.text.length != 11) {
        [MBProgressHUD showMessage:@"请填写11位手机号码"];
        return;
    }
    
    [MBProgressHUD showMessage:@"开户失败5分钟后重试"];
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
