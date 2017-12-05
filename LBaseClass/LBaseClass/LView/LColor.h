//
//  LColor.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/30.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LInitProtocol.h"

@interface LColor : UIColor<LInitProtocol>

/**
 唯一标示
 */
@property (nonatomic, strong) NSString *uid;

/**
 创建时间
 */
@property (nonatomic, assign, readonly) NSTimeInterval createTime;

/**
 销毁时间
 */
@property (nonatomic, assign, readonly) NSTimeInterval destroyTime;

/**
 获取随机颜色
 */
+ (UIColor *)randomColor;

@end