//
//  MacroConstantsHeader.h
//  WeiBang
//
//  Created by tchzt on 2019/2/13.
//  Copyright © 2019年 lkp. All rights reserved.
//

#ifndef MacroConstantsHeader_h
#define MacroConstantsHeader_h


/// 网关域名
#define kServerValue 1     // 1.正式服务器,2.测试服务器,3.后台人员固定主机，

#if kServerValue   == 1
#define kBaseURL            @"https://www.rongniu360.com/api"
#define kServerDomain @"https://www.rongniu360.com"

#elif kServerValue == 2
#define kBaseURL            @"http://39.108.128.90:81/api"
#define kServerDomain @"http://39.108.128.90:81"

#elif kServerValue == 3
#define kBaseURL            @"http://192.168.20.129:8096/abao/api"
#define kServerDomain @"http://192.168.20.129:8096"
#else
#define kBaseURL @"http://www.abao.com:80/api"
#endif



///MARK-: 一些便捷的宏

#ifdef DEBUG
//Debug 阶段打印
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#define WGBLog(...)  NSLog(__VA_ARGS__)
#else
//发布阶段 取消打印
#define NSLog(...)
#endif
/**  打印方法名  */
#define LogFunc  NSLog(@"%s",__func__);


/// 字符串简单拼接用法
#ifndef WB_STR
#define WB_STR(str,...) [NSString stringWithFormat:str,##__VA_ARGS__]
#endif

// 拨打电话
#define kCallPhone(phone)  \
NSMutableString *str=[[NSMutableString alloc]initWithFormat:@"tel:%@",phone];\
NSString *message = [NSString stringWithFormat:@"是否呼叫客服热线 %@ ?",phone];\
UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message: message  preferredStyle:UIAlertControllerStyleAlert];\
UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){\
\
}];\
UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {\
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];\
}];\
[alertController addAction:cancelAction];\
[alertController addAction:otherAction];\
[kRootVC presentViewController:alertController animated:YES completion:nil];\


///适配iOS 11 scrollView向下偏移
#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)


///判断字符串为空  YES 为空  NO不为空
#define NULLString(string) ((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@""] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0)

//比较两个字符串
#define kCompareTwoString(A,B)  [A isEqualToString:B]

//字符串去空
#define DeleteAirString(string) [string stringByReplacingOccurrencesOfString:@" "withString:@""];

// 检测block是否可用
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };

/// 防空值判断
#define VerifyValue(value)\
({id tmp;\
if ([value isKindOfClass:[NSNull class]])\
tmp = nil;\
else\
tmp = value;\
tmp;\
})\

//View圆角和加边框 对象,圆角大小,边框宽度,颜色
#define ViewBorderRadius(View,Radius,Width,Color)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View圆角 对象,圆角大小
#define ViewRadius(View,Radius)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]


///MARK:- 获取实例或者参数------------------------

/// 拿到通知中心实例
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//本地存储UserDefault
#define kUserDefaults  [NSUserDefaults standardUserDefaults]

///AppDeleagte
#define kAppdelegate  AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

///关键盘
#define kCloseKeyboard       [[UIApplication sharedApplication].keyWindow endEditing:YES]

///RootVC
#define kRootVC  [UIApplication sharedApplication].keyWindow.rootViewController

//keyWindow
#define kWindow [UIApplication sharedApplication].keyWindow

//当前window
#define kCurrentWindow [[UIApplication sharedApplication].windows firstObject]

//app名称
#define kAppName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

//app版本
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


//获取当前系统版本
#define kCurrentSystemVersion  [ [ [UIDevice currentDevice]  systemVersion ] floatValue]

//加载比较大的图片 优化性能
#define kLoadImagae(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]
//定义UIImage对象
#define kImageNamed(imgName)  [UIImage imageNamed:imgName］
//获取图片宽高
#define kImgWidth(img)        ((img).size.width)
#define kImgHeight(img)       ((img).size.height)

//获取一段时间间隔  起点  终点
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime  NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)

//设置字体
#define kPingFang(F)  [UIFont fontWithName:@"PingFang SC" size:(F)]
#define kBoldPingFang(A) [UIFont fontWithName:@"PingFang-SC-Medium" size:A]
#define kFont(a) [UIFont fontWithName:@"Avenir-Light" size:(a)]

//系统默认字体
#define KFontSize(A)  [UIFont systemFontOfSize: A]
#define kFontBold(A)  [UIFont boldSystemFontOfSize:A]

#define kSizeScale autoSizeScale()
#define kSizeScale6 autoSizeScale6()
#define kFontSize6(x) [UIFont systemFontOfSize: (x + 1.5) * kSizeScale6]
#define kBoldFontSize6(x) [UIFont boldSystemFontOfSize: (x + 1.5) * kSizeScale6]

//weakSelf,strongSelf
#define weakself __weak __typeof(self)weakSelf = self;
#define strongself __strong __typeof(weakSelf)strongSelf = weakSelf;

///MARK:- 布局与适配相关------------------------

//获取view的frame
#define KGetFrame(view)   view.frame

//获取view的size
#define  KGetSize(view)     view.frame.size

//获取view的位置起始点
#define KGetOrigin(view)   view.frame.origin

// 物理屏幕宽度
#define KWIDTH  [[UIScreen mainScreen]bounds].size.width
// 物理屏幕高度
#define KHIGHT [[UIScreen mainScreen]bounds].size.height

// View 坐标(x,y)和宽高(width,height)
#define X(v)               (v).frame.origin.x
#define Y(v)               (v).frame.origin.y
#define WIDTH(v)           (v).frame.size.width
#define HEIGHT(v)          (v).frame.size.height

#define MinX(v)            CGRectGetMinX((v).frame) // 获得控件屏幕的x坐标
#define MinY(v)            CGRectGetMinY((v).frame) // 获得控件屏幕的Y坐标

#define MidX(v)            CGRectGetMidX((v).frame) //横坐标加上到控件中点坐标
#define MidY(v)            CGRectGetMidY((v).frame) //纵坐标加上到控件中点坐标

#define MaxX(v)            CGRectGetMaxX((v).frame) //横坐标加上控件的宽度
#define MaxY(v)            CGRectGetMaxY((v).frame) //纵坐标加上控件的高度

//状态栏高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏+状态栏
#define kNavBarHeight   (44.0 + kStatusBarHeight)
//tabBar高度
#define kTabBarHeight  ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

#define IS_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_Iphone_X  ((int)([[UIScreen mainScreen] currentMode].size.height / [[UIScreen mainScreen] currentMode].size.width * 100) == 216)
#define kBottomHeight IS_Iphone_X? 34 : 0


#define IS_Iphone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone7 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone7p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_Iphone8p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) : NO)




///MARK:- 颜色相关------------------------
//RGB
#define RGB(R,G,B)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0f]
//颜色 RGBA
#define RGBA(R, G, B, A)   [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]\

//主色调
#define kappMainColor RGB(240.0,240.0,240.0)
//十六进制颜色设置 hex是整型
#define kUIColorHex(hex) [UIColor colorWithHexString: hex]

//白色
#define KWhiteColor  [UIColor whiteColor]
//黑色
#define KBlackColor  [UIColor blackColor]
//红色
#define KRedColor  [UIColor redColor]
//橙色
#define KOrangeColor  [UIColor orangeColor]

//随机色
#define KRandomColor  [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f  blue:arc4random()%256/255.0f alpha:1.0f]

//下横线颜色
#define kappLineColor RGB(249, 249, 249)
#define kappRed RGB(238,61,61)
///MARK:- property属性快速声明
// 字符串属性
#define PropertyString(s) \
@property (nonatomic,copy) NSString *s;
// int
#define PropertyNSInteger(s) \
@property (nonatomic,assign) NSInteger s;
//float
#define PropertyFloat(s) \
@property (nonatomic,assign) float s;
//NSNumber
#define PropertyNSNumber(s) \
@property (nonatomic,strong) NSNumber *s;
//字典
#define PropertyNSDictionary(s) \
@property (nonatomic,strong) NSDictionary *s;
//可变字典
#define PropertyNSMutableDictionary(s) \
@property (nonatomic,strong) NSMutableDictionary *s;
//数组
#define PropertyNSArray(s) \
@property (nonatomic,strong) NSArray *s;
//可变数组
#define PropertyNSMutableArray(s) \
@property (nonatomic,strong) NSMutableArray *s;


///MARK:- 沙盒目录路径
//获取temp
#define kPathTempPath NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


/// MARK:- 判断真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif


#endif /* MacroConstantsHeader_h */
