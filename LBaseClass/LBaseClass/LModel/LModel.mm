//
//  LModel.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LModel.h"
#import "LModel+WCTTableCoding.h"

@implementation LModel


#pragma mark - 绑定表对应的类

WCDB_IMPLEMENTATION(LModel)


#pragma mark - 主键

WCDB_PRIMARY(LModel, uid)


#pragma mark - 索引

WCDB_INDEX(LModel, "_index", createTime)


#pragma mark - 绑定表和字段

WCDB_SYNTHESIZE(LModel, createTime)
WCDB_SYNTHESIZE(LModel, displayOrder)
WCDB_SYNTHESIZE(LModel, version)


@end
