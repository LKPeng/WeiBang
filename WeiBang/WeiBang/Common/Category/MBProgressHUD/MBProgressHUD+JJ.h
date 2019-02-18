
/**
 github:https://github.com/jiangbin1993/MBProgressHUD-JJ.git
 作者：Jonas
 **/

#import "MBProgressHUD.h"

// 统一的显示时长
#define kHudShowTime 1.5

@interface MBProgressHUD (JJ)

#pragma mark 在指定的view上显示hud
+ (void)showMessage:(NSString *)message toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showWarning:(NSString *)Warning toView:(UIView *)view;
+ (void)showMessageWithImageName:(NSString *)imageName message:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD *)showActivityMessage:(NSString*)message view:(UIView *)view;
+ (MBProgressHUD *)showProgressBarToView:(UIView *)view;


#pragma mark 在window上显示hud
+ (void)showMessage:(NSString *)message;
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (void)showWarning:(NSString *)Warning;
+ (void)showMessageWithImageName:(NSString *)imageName message:(NSString *)message;
+ (MBProgressHUD *)showActivityMessage:(NSString*)message;


#pragma mark 移除hud
+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end

/*
 case 0://提示信息
 {
 [MBProgressHUD showMessage:@"提示信息：你被包围了!哈哈哈哈!!!"];
 break;
 }
 
 case 1:{//报错
 [MBProgressHUD showError:@"出错了啊!"];
 break;
 }
 case 2:{//成功
 [MBProgressHUD showSuccess:@"成功了!"];
 break;
 }
 case 3:{//警告
 [MBProgressHUD showWarning:@"警告注意!"];
 break;
 }
 case 4:{//自定义图片信息
 [MBProgressHUD showMessageWithImageName:@"MBHUD_Info" message:@"哈哈哈！"];
 break;
 }
 case 5:{//加载中
 MBProgressHUD *hud = [MBProgressHUD showActivityMessage:@"加载中..."];
 [hud hide:YES afterDelay:kHudShowTime];
 break;
 }
 case 6:{//进度显示
 MBProgressHUD *hud = [MBProgressHUD showProgressBarToView:nil];
 // 模拟网络请求进度
 dispatch_async(dispatch_get_global_queue(0, 0), ^{
 
 float progress = 0.0f;
 
 while (progress < 1.0f) {
 progress += 0.01f;
 // 主线程刷新进度
 dispatch_async(dispatch_get_main_queue(), ^{
 hud.progress = progress;
 });
 // 进程挂起50毫秒
 usleep(50000);
 }
 // 100%后移除
 dispatch_async(dispatch_get_main_queue(), ^{
 [hud hide:YES];
 });
 });
 
 break;
 }
 
 */
