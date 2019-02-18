//
//  MeHeadCell.m
//  WeiBang
//
//  Created by tchzt on 2019/2/15.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import "MeHeadCell.h"

@interface MeHeadCell ()
@property (strong, nonatomic) UIButton *releaseBtn;//发布
@property (strong, nonatomic) UIButton *dynamicBtn;//动态
@property (strong, nonatomic) UIButton *albumBtn;//相册
@property (strong, nonatomic) UIButton *collectionBtn;//收藏
@end

@implementation MeHeadCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self.contentView addSubview:self.releaseBtn];
    [self.contentView addSubview:self.dynamicBtn];
    [self.contentView addSubview:self.albumBtn];
    [self.contentView addSubview:self.collectionBtn];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //间隔
    CGFloat width = scaleY(80);
    CGFloat height = scaleY(50);
    CGFloat space = ((KWIDTH - width * 4) - scaleX(10)) / 3;
    CGFloat magin = scaleY(20);
    
    [_releaseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(scaleX(10));
        make.size.mas_equalTo(CGSizeMake(width, height));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [_releaseBtn verticalCenterImageAndTitle:magin];
    
    [_dynamicBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.releaseBtn.mas_right).offset(space);
        make.size.mas_equalTo(CGSizeMake(width, height));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [_dynamicBtn verticalCenterImageAndTitle:magin];
    
    [_albumBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dynamicBtn.mas_right).offset(space);
        make.size.mas_equalTo(CGSizeMake(width, height));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [_albumBtn verticalCenterImageAndTitle:magin];
    
    [_collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-scaleX(10));
        make.size.mas_equalTo(CGSizeMake(width, height));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [_collectionBtn verticalCenterImageAndTitle:magin];
    
    
}

#pragma mark ----   按钮点击  ----
- (void)pushRelease{
    
}

- (void)pushDynamic{
    
}

- (void)pushAlbum{
    
}

- (void)pushCollection{
    
}
#pragma mark ----   懒加载  ----

- (UIButton *)releaseBtn{
    if (!_releaseBtn) {
        _releaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_releaseBtn setImage:[UIImage imageNamed:@"u2779"] forState:UIControlStateNormal];
        [_releaseBtn setTitle:@"我的发布" forState:UIControlStateNormal];
        [_releaseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _releaseBtn.titleLabel.font = kFontSize6(13);
        weakself
        [_releaseBtn addButtonActionClickHandler:^(NSInteger tagIndex) {
            strongself
            [strongSelf pushRelease];
        }];
    }
    return _releaseBtn;
}

- (UIButton *)dynamicBtn{
    if (!_dynamicBtn) {
        _dynamicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dynamicBtn setImage:[UIImage imageNamed:@"u2779"] forState:UIControlStateNormal];
        [_dynamicBtn setTitle:@"我的动态" forState:UIControlStateNormal];
        [_dynamicBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _dynamicBtn.titleLabel.font = kFontSize6(13);
        weakself
        [_dynamicBtn addButtonActionClickHandler:^(NSInteger tagIndex) {
            strongself
            [strongSelf pushDynamic];
        }];
    }
    return _dynamicBtn;
}

- (UIButton *)albumBtn{
    if (!_albumBtn) {
        _albumBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_albumBtn setImage:[UIImage imageNamed:@"u2779"] forState:UIControlStateNormal];
        [_albumBtn setTitle:@"我的相册" forState:UIControlStateNormal];
        [_albumBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _albumBtn.titleLabel.font = kFontSize6(13);
        weakself
        [_albumBtn addButtonActionClickHandler:^(NSInteger tagIndex) {
            strongself
            [strongSelf pushAlbum];
        }];
    }
    return _albumBtn;
}

- (UIButton *)collectionBtn{
    if (!_collectionBtn) {
        _collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectionBtn setImage:[UIImage imageNamed:@"u2779"] forState:UIControlStateNormal];
        [_collectionBtn setTitle:@"我的收藏" forState:UIControlStateNormal];
        [_collectionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _collectionBtn.titleLabel.font = kFontSize6(13);
        weakself
        [_collectionBtn addButtonActionClickHandler:^(NSInteger tagIndex) {
            strongself
            [strongSelf pushCollection];
        }];
    }
    return _collectionBtn;
}
@end
