//
//  LNavigationController.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LNavigationController : UINavigationController

/**
 *  唯一标识
 */
@property (nonatomic, strong) NSString *uid;

/**
 *  创建时间
 */
@property (nonatomic, assign) NSTimeInterval createTime;

@end
