//
//  IntroduceViewController.m
//  WeiBang
//
//  Created by 吴凯耀 on 2019/3/13.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "IntroduceViewController.h"

@interface IntroduceViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"关于我们";
    
    NSString * string = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *url = [[NSURL alloc] initWithString:string];
    [self.webView loadRequest:[[NSURLRequest alloc]initWithURL:url]];
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
