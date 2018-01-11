//
//  LDao.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LObject.h"
#import "LModel.h"
#import <WCDB/WCDB.h>

@interface LDao : LObject

//打开数据库
+ (instancetype)dbPath:(NSString *)dbPath secret:(NSString *)secret;

//打开数据库
- (BOOL)openWithDBPath:(NSString *)dbPath secret:(NSString *)secret;

//关闭连接
- (void)close;

//创建表
- (BOOL)createTable:(LModel *)model;

//删除表
- (BOOL)dropTable:(LModel *)model;

//插入对象
- (BOOL)insertObject:(LModel *)model;

//批量插入对象
- (BOOL)insertObjects:(NSArray<LModel *> *)models;

//删除全部对象
- (BOOL)deleteAllObjectsFromTable:(LModel *)model;

//按条件删除对象
- (BOOL)deleteObjectsFromTable:(LModel *)model condition:(const WCTCondition &)condition;

//获取全部对象
- (NSArray<LModel *> *)getAllObjectsFromTable:(LModel *)model;

//按条件获取全部对象
- (NSArray<LModel *> *)getObjectsFromTable:(LModel *)model condition:(const WCTCondition &)condition;

//按顺序获取全部对象
- (NSArray<LModel *> *)getObjectsFromTable:(LModel *)model orderList:(const WCTOrderByList &)orderList;

//按条件、顺序获取全部对象
- (NSArray<LModel *> *)getObjectsFromTable:(LModel *)model condition:(const WCTCondition &)condition orderList:(const WCTOrderByList &)orderList;

//按条件获取一个对象
- (LModel *)getObjectFromTable:(LModel *)model condition:(const WCTCondition &)condition;

//按顺序获取一个对象
- (LModel *)getObjectFromTable:(LModel *)model orderList:(const WCTOrderByList &)orderList;

//按条件、顺序获取一个对象
- (LModel *)getObjectFromTable:(LModel *)model condition:(const WCTCondition &)condition orderList:(const WCTOrderByList &)orderList;

//更新对象
- (BOOL)updateObject:(LModel *)model;

//更新对象
- (BOOL)updateObject:(LModel *)model property:(const WCTProperty &)property;

@end
