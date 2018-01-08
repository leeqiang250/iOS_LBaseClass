//
//  LService.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LObject.h"
#import <ReactiveObjC/ReactiveObjC.h>


typedef NSString LCMDType _NS_TYPED_EXTENSIBLE_ENUM;//命令类型

FOUNDATION_EXPORT LCMDType * const LCMDTypeGetAll;//全部数据
FOUNDATION_EXPORT LCMDType * const LCMDTypeGetLastPage;//上一页数据
FOUNDATION_EXPORT LCMDType * const LCMDTypeGetNextPage;//下一页数据


@interface LService : LObject

/**
 命令
 */
@property (nonatomic, strong) RACCommand * command;

/**
 订阅
 */
@property (nonatomic, strong) RACSubject * subject;

@end
