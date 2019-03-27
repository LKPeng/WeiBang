//
//  SettingController.m
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/27.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "SettingController.h"
#import "SetTableViewCell.h"
//#import "RealNameController.h"
#import "MyWebViewController.h"
#import "NothingViewController.h"

#define cachePath  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0]

@interface SettingController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIButton *quitButton;

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup{
    self.title = @"设置";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = true;
    [self.tableView reloadData];
    
    
}


// 获取文件尺寸字符串
- (NSString *)getFileSizeStr
{
    // 获取Cache文件夹路径
    // b -> b / 1000 KB -> KB / 1000 MB
    // 获取文件夹尺寸
    NSInteger totalSize = [self getDirectorySize:cachePath];
    
    NSString *str;
    if (totalSize > 1000 * 1000) { // MB
        CGFloat totalSizeF = totalSize / 1000.0 / 1000.0;
        str = [NSString stringWithFormat:@"%.1fMB",totalSizeF];
    } else if (totalSize > 1000) { // KB
        CGFloat totalSizeF = totalSize / 1000.0;
        str = [NSString stringWithFormat:@"%.1fKB",totalSizeF];
    } else if (totalSize > 0) { // B
        str = [NSString stringWithFormat:@"%ldB",(long)totalSize];
    }else if (totalSize == 0) { // B
        str = [NSString stringWithFormat:@"%ldB",(long)totalSize];
    }
    
    return str;
}

// 获取文件夹尺寸
- (NSInteger)getDirectorySize:(NSString *)directoryPath
{
    // 获取文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL isExist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    
    if (!isExist || !isDirectory) {
        // 报错:抛异常
        NSException *excp = [NSException exceptionWithName:@"filePathError" reason:@"笨蛋,传错,必须传文件夹路径" userInfo:nil];
        
        [excp raise];
        
    }
    
    
    /*
     获取这个文件夹中所有文件路径,然后累加 = 文件夹的尺寸
     */
    
    
    // 获取文件夹下所有的文件
    NSArray *subpaths = [mgr subpathsAtPath:directoryPath];
    NSInteger totalSize = 0;
    
    for (NSString *subpath in subpaths) {
        
        // 拼接文件全路径
        NSString *filePath = [directoryPath stringByAppendingPathComponent:subpath];
        
        // 排除文件夹
        BOOL isDirectory;
        BOOL isExist = [mgr fileExistsAtPath:filePath isDirectory:&isDirectory];
        if (!isExist || isDirectory) continue;
        
        // 隐藏文件
        if ([filePath containsString:@".DS"]) continue;
        
        // 指定路径获取这个路径的属性
        // attributesOfItemAtPath:只能获取文件属性
        NSDictionary *attr = [mgr attributesOfItemAtPath:filePath error:nil];
        NSInteger size = (NSInteger)[attr fileSize];
        
        totalSize += size;
    }
    
    return totalSize;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return scaleX(40);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SetTableViewCell cellReuseID]];
    [cell setTitleWithRow:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        NothingViewController *vc = [[NothingViewController alloc]init];
        vc.titleText = @"账户安全";
        [self.navigationController pushViewController:vc animated:true];
    }else if (indexPath.row == 1){
        [MBProgressHUD showSuccess:@"清除成功"];
    }
    else if (indexPath.row == 2){
        [MBProgressHUD showSuccess:@"敬请期待.."];
        //        MyTranlateController *vc = [[MyTranlateController alloc]init];
        //        [self.navigationController pushViewController:vc animated:true];
    }
    else if (indexPath.row == 3){
        [MBProgressHUD showSuccess:[self getFileSizeStr]];
        //        MyTranlateController *vc = [[MyTranlateController alloc]init];
        //        [self.navigationController pushViewController:vc animated:true];
    }
    
    else{
        
        MyWebViewController *vc = [[MyWebViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
        
    }
    
}

#pragma mark ----   懒加载  ----
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KWIDTH , KHIGHT) style:UITableViewStyleGrouped];
        adjustsScrollViewInsets_NO(_tableView, self);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView regsiterCellWithCellClass:[SetTableViewCell class] isNib:YES];
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH , 0.001)];
        _tableView.tableHeaderView = headerView;
        UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, -0, KWIDTH, scaleX(150))];
        footer.backgroundColor = [UIColor clearColor];
        [footer addSubview:self.quitButton];
        _tableView.tableFooterView = footer;
        [self.view addSubview: _tableView];
    }
    return _tableView;
}

-(UIButton *)quitButton {
    if (!_quitButton) {
        _quitButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 60, KWIDTH-20, 50)];
        [_quitButton setTitle:@"退出登录" forState:UIControlStateNormal];
        [_quitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _quitButton.backgroundColor = kappMainColor;
        _quitButton.layer.cornerRadius = 6;
        _quitButton.clipsToBounds = true;
        [_quitButton addTarget:self action:@selector(quitfunction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _quitButton;
}

-(void)quitfunction{
    weakself
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要退出登录吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancelAc = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击取消要执行的代码
    }];
    UIAlertAction *comfirmAc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击确定要执行的代码
        strongself
        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"user_login"];
        [MBProgressHUD showMessage:@"退出成功"];
        [strongSelf bb_popViewController];
    }];
    [alertVC addAction:cancelAc];
    [alertVC addAction:comfirmAc];
    [self presentViewController:alertVC animated:YES completion:nil];
}

-(void)quitfunctionIN{
    
    //    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"客服咨询  38410671@qq.com" message:@"版权所有：宁波御通网络科技有限公司" preferredStyle:UIAlertControllerStyleAlert];
    //    UIAlertAction * cancelAc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //        //点击取消要执行的代码
    //    }];
    //
    ////    UIAlertAction *comfirmAc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    ////        //点击确定要执行的代码
    ////        strongself
    ////        [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"user_login"];
    ////        [MBProgressHUD showMessage:@"退出成功"];
    ////        [strongSelf bb_popViewController];
    ////    }];
    //    [alertVC addAction:cancelAc];
    ////    [alertVC addAction:comfirmAc];
    //    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)baozhangclick{
    
}
@end
