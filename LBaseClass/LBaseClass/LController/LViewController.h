//
//  LViewController.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LInitProtocol.h"

@interface LViewController : UIViewController<LInitProtocol>

/**
 唯一标识
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
 进入页面时间
 */
@property (nonatomic, assign, readonly) NSTimeInterval enterTime;

/**
 停留时长
 */
@property (nonatomic, assign, readonly) NSTimeInterval stayTime;

/**
 是否显示导航控制器
 */
@property (nonatomic, assign) BOOL visibleNavbar;

/**
 是否显示导航控制器
 */
@property (nonatomic, assign) BOOL visibleTabar;

@end
