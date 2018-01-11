//
//  LModel+WCTTableCoding.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/10.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import <WCDB/WCDB.h>

@interface LModel(WCTTableCoding)<WCTTableCoding>

#pragma mark - 声明表的字段

WCDB_PROPERTY(uid)
WCDB_PROPERTY(createTime)
WCDB_PROPERTY(displayOrder)
WCDB_PROPERTY(version)

@end
