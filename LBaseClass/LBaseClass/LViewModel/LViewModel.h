//
//  LViewModel.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/8.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LObject.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface LViewModel : LObject

/**
 命令
 */
@property (nonatomic, strong) RACCommand * command;

/**
 订阅
 */
@property (nonatomic, strong) RACSubject * subject;

@end
