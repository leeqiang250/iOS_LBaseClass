//
//  LObj.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/10.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>

#import "LInitProtocol.h"
#import "LReflectProtocol.h"
#import "LSerializableProtocol.h"

@interface LObj : NSObject<LInitProtocol, LReflectProtocol, LSerializableProtocol, WCTTableCoding>


WCDB_PROPERTY(displayOrder)
WCDB_PROPERTY(version)

/**
 唯一标示
 */
@property (nonatomic, copy, readonly) NSString * uid;

/**
 创建时间
 */
@property (nonatomic, assign, readonly) NSTimeInterval createTime;

/**
 显示排序
 */
@property (nonatomic, copy) NSString * displayOrder;

/**
 数据版本号
 */
@property (nonatomic, copy) NSString * version;

@end
