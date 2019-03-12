//
//  NewsBulletinModel.h
//  WeiBang
//
//  Created by 刘昆朋 on 2019/3/11.
//  Copyright © 2019年 lkp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsBulletinModel : NSObject
/**
 *     model1.newsTime = @"2018-07-27";
 model1.newsContent
 */
@property (nonatomic,strong) NSString *newsTime;

@property (nonatomic,strong) NSString *newsContent;

@property (nonatomic , assign) CGFloat cellHeight;
@end

NS_ASSUME_NONNULL_END
