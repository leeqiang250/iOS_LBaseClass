//
//  LInput.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/8.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LObject.h"

@interface LInput : LObject

+ (instancetype)inputWithType:(NSUInteger)type info:(id)info;

- (instancetype)initWithType:(NSUInteger)type info:(id)info;

/**
 命令类型
 */
@property (nonatomic, assign) NSUInteger type;

/**
 命令消息
 */
@property (nonatomic, strong) id info;

@end
