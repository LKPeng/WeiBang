//
//  JJOptionView.m
//  DropdownListDemo
//
//  Created by 俊杰  廖 on 2018/9/20.
//  Copyright © 2018年 HoYo. All rights reserved.
//

#import "JJOptionView.h"
#import "Masonry.h"
#import "JJOptionTableViewCell.h"
#define WEAKSELF __weak typeof(self) weakSelf = self;

@interface JJOptionView ()<UITableViewDelegate,UITableViewDataSource>

/**
 标题控件
 */
@property (nonatomic, strong) UILabel *titleLabel1;
@property (nonatomic, strong) UILabel *titleLabel2;
@property (nonatomic, strong) UILabel *titleLabel3;

/**
 右边箭头图片
 */
@property (nonatomic, strong) UIImageView *rightImageView;

/**
 控件透明按钮，也可以给控件加手势
 */
@property (nonatomic, strong) UIButton *maskBtn1;
@property (nonatomic, strong) UIButton *maskBtn2;
@property (nonatomic, strong) UIButton *maskBtn3;
/**
 选项列表
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 蒙版
 */
@property (nonatomic, strong) UIButton *backgroundBtn;
/**
 tableView的高度
 */
@property (nonatomic, assign) CGFloat tableViewHeight;
@property (nonatomic, assign) BOOL isDirectionUp;
@end

static CGFloat const animationTime = 0.3;
static CGFloat const rowheight = 42;

@implementation JJOptionView


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource {
    if (self = [super initWithFrame:frame]) {
        self.dataSource = dataSource;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
//    [self addSubview:self.rightImageView];
    [self addSubview:self.titleLabel1];
    [self.titleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.leading.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(self.width*0.33);
    }];
    
    [self addSubview:self.titleLabel2];
    [self.titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.leading.mas_equalTo(self.width*0.33);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(self.width*0.33);
    }];
    
    [self addSubview:self.titleLabel3];
    [self.titleLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.leading.mas_equalTo(self.width*0.66);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(self.width*0.33);
    }];
    
    [self addSubview:self.maskBtn1];
    [self.maskBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(KWIDTH*0.33);
    }];
    [self addSubview:self.maskBtn2];
    [self.maskBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.leading.mas_equalTo(KWIDTH*0.33);
        make.width.mas_equalTo(KWIDTH*0.33);
    }];
    [self addSubview:self.maskBtn3];
    [self.maskBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.trailing.mas_equalTo(self);
        make.width.mas_equalTo(KWIDTH*0.33);
    }];
}


- (void)showWith:(UIButton*)button {
    WEAKSELF;
    
    if (button.tag == 1) {
        self.dataSource =  @[@"不限",@"信用标",@"秒标",@"净值标",@"抵押标"];
    }else if (button.tag == 2) {
        self.dataSource =  @[@"不限",@"1-3个月",@"4-6个月",@"7-9个月",@"10-12个月"];
    }else if (button.tag == 3) {
        self.dataSource =  @[@"全部",@"正在投标",@"满标待审",@"正在还款",@"还款完成"];
    }
    [self.tableView reloadData];
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.backgroundBtn];
    [window addSubview:self.tableView];
    
    // 获取按钮在屏幕中的位置
    CGRect frame = [self convertRect:self.bounds toView:window];
    CGFloat tableViewY = frame.origin.y + frame.size.height;
    CGRect tableViewFrame;
    tableViewFrame.size.width = frame.size.width;
    tableViewFrame.size.height = self.tableViewHeight;
    tableViewFrame.origin.x = frame.origin.x;
    
    if (tableViewY + self.tableViewHeight < CGRectGetHeight([UIScreen mainScreen].bounds)) {
        tableViewFrame.origin.y = tableViewY;
        self.isDirectionUp = NO;
    }else {
        tableViewFrame.origin.y = frame.origin.y - self.tableViewHeight;
        self.isDirectionUp = YES;
    }
    self.tableView.frame = CGRectMake(tableViewFrame.origin.x, tableViewFrame.origin.y+(self.isDirectionUp?self.tableViewHeight:0), tableViewFrame.size.width, 0);
    [UIView animateWithDuration:animationTime animations:^{
        weakSelf.rightImageView.transform = CGAffineTransformRotate(weakSelf.rightImageView.transform,self.isDirectionUp?-M_PI/2:M_PI/2);
        weakSelf.tableView.frame = CGRectMake(tableViewFrame.origin.x, tableViewFrame.origin.y, tableViewFrame.size.width, tableViewFrame.size.height);
        NSLog(@"%@",NSStringFromCGRect(self.tableView.frame));
    }];
    
}

- (void)dismiss {
    WEAKSELF;
    [UIView animateWithDuration:animationTime animations:^{
        weakSelf.rightImageView.transform = CGAffineTransformIdentity;
        weakSelf.tableView.frame = CGRectMake(weakSelf.tableView.frame.origin.x, weakSelf.tableView.frame.origin.y+(self.isDirectionUp?self.tableViewHeight:0), weakSelf.tableView.frame.size.width, 0);
    } completion:^(BOOL finished) {
        [weakSelf.backgroundBtn removeFromSuperview];
        [weakSelf.tableView removeFromSuperview];
    }];
    
}


#pragma mark UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JJOptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[JJOptionTableViewCell cellReuseID]];
    [cell setData:self.dataSource[indexPath.row]];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.title = self.dataSource[indexPath.row];
    [self dismiss];
    if ([self.delegate respondsToSelector:@selector(optionView:selectedIndex:)]) {
        [self.delegate optionView:self selectedIndex:indexPath.row];
    }
    if (self.selectedBlock) {
        self.selectedBlock(self, indexPath.row);
    }
}

#pragma mark getter && setter

- (UILabel *)titleLabel1 {
    if (!_titleLabel1) {
        _titleLabel1 = [UILabel new];
        _titleLabel1.text = @"类型 ↓";
        _titleLabel1.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1];
        _titleLabel1.font = [UIFont systemFontOfSize:12];
        _titleLabel1.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel1;
}

- (UILabel *)titleLabel2 {
    if (!_titleLabel2) {
        _titleLabel2 = [UILabel new];
        _titleLabel2.text = @"期限 ↓";
        _titleLabel2.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1];
        _titleLabel2.font = [UIFont systemFontOfSize:12];
        _titleLabel2.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel2;
}

- (UILabel *)titleLabel3 {
    if (!_titleLabel3) {
        _titleLabel3 = [UILabel new];
        _titleLabel3.text = @"状态 ↓";
        _titleLabel3.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1];
        _titleLabel3.font = [UIFont systemFontOfSize:12];
        _titleLabel3.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel3;
}

- (UIImageView *)rightImageView {
    if(!_rightImageView) {
        _rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list_icon_drfault"]];
        _rightImageView.clipsToBounds = YES;
    }
    return _rightImageView;
}

- (UIButton *)maskBtn1 {
    if (!_maskBtn1) {
        _maskBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _maskBtn1.backgroundColor = [UIColor clearColor];
        _maskBtn1.clipsToBounds = YES;
        _maskBtn1.tag = 1;
        [_maskBtn1 addTarget:self action:@selector(showWith:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _maskBtn1;
}
- (UIButton *)maskBtn2 {
    if (!_maskBtn2) {
        _maskBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _maskBtn2.backgroundColor = [UIColor clearColor];
        _maskBtn2.clipsToBounds = YES;
        _maskBtn2.tag = 2;
        [_maskBtn2 addTarget:self action:@selector(showWith:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _maskBtn2;
}
- (UIButton *)maskBtn3 {
    if (!_maskBtn3) {
        _maskBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        _maskBtn3.backgroundColor = [UIColor clearColor];
        _maskBtn3.clipsToBounds = YES;
        _maskBtn3.tag = 3;
        [_maskBtn3 addTarget:self action:@selector(showWith:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _maskBtn3;
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.tableFooterView = [UIView new];
        _tableView.rowHeight = rowheight;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.layer.shadowOffset = CGSizeMake(4, 4);
        _tableView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        _tableView.layer.shadowOpacity = 0.8;
        _tableView.layer.shadowRadius = 4;
        _tableView.layer.borderColor = [UIColor grayColor].CGColor;
        _tableView.layer.borderWidth = 0.5;
        _tableView.layer.cornerRadius = self.cornerRadius;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 5, 0, 5);
        [_tableView regsiterCellWithCellClass:[JJOptionTableViewCell class] isNib:NO];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
        }
    }
    return _tableView;
}

- (UIButton *)backgroundBtn {
    if (!_backgroundBtn) {
        _backgroundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backgroundBtn.backgroundColor = [UIColor clearColor];
        _backgroundBtn.frame = [UIScreen mainScreen].bounds;
        [_backgroundBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundBtn;
}

- (void)setRowHeigt:(CGFloat)rowHeigt {
    _rowHeigt = rowHeigt;
    self.tableView.rowHeight = rowHeigt;
}

- (void)setTitle:(NSString *)title {
    _title = title;
//    self.titleLabel.text = title;
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    if (self.rowHeigt) {
        self.tableViewHeight = self.dataSource.count*self.rowHeigt;
    }else {
        self.tableViewHeight = self.dataSource.count*rowheight;
    }
}

- (void)setTitleFontSize:(CGFloat)titleFontSize {
    _titleFontSize = titleFontSize;
    self.titleLabel1.font = [UIFont systemFontOfSize:scaleX(12)];
    self.titleLabel2.font = [UIFont systemFontOfSize:scaleX(12)];
    self.titleLabel3.font = [UIFont systemFontOfSize:scaleX(12)];
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.titleLabel1.textColor = [UIColor blackColor];
    self.titleLabel2.textColor = [UIColor blackColor];
    self.titleLabel3.textColor = [UIColor blackColor];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return (UIColor *)self.layer.borderColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

@end
