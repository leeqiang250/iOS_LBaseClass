//
//  LObj.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/10.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WCDB/WCDB.h>

@interface LObj : NSObject<WCTTableCoding>

WCDB_PROPERTY(displayOrder)
WCDB_PROPERTY(version)

/**
 显示排序
 */
@property (nonatomic, copy) NSString * displayOrder;

/**
 数据版本号
 */
@property (nonatomic, copy) NSString * version;

@end
