//
//  LCmdTransfer.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/8.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LObject.h"


typedef NSString LCMDType _NS_TYPED_EXTENSIBLE_ENUM;//命令类型


@interface LCmdTransfer : LObject

+ (instancetype)cmdWithType:(LCMDType *)type value:(id)value;

- (instancetype)initWithType:(LCMDType *)type value:(id)value;

/**
 命令类型
 */
@property (nonatomic, copy) LCMDType * type;

/**
 命令内容
 */
@property (nonatomic, strong) id value;

@end
