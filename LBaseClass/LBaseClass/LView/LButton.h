//
//  LButton.h
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 leeqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LInitProtocol.h"

@class LButton;

/**
 按钮点击事件
 */
typedef void(^LButtonClick)(LButton *);

@interface LButton : UIButton<LInitProtocol>

/**
 唯一标示
 */
@property (nonatomic, copy, readonly) NSString * uid;

/**
 创建时间
 */
@property (nonatomic, assign, readonly) NSTimeInterval createTime;

/**
 刷新UI
 */
- (void)refreshUI;

@end
