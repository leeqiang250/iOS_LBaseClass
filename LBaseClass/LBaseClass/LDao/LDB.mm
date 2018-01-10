//
//  LDB.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/10.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LDB.h"

#import <WCDB/WCDB.h>
#import "LObj2.h"
#import "LModel2.h"

@implementation LDB

- (void)dd {
    {
        LObj2 * obj = [[LObj2 alloc] init];
        obj.version = [NSUUID UUID].UUIDString;
        obj.displayOrder = [NSUUID UUID].UUIDString;
        obj.aaaa = [NSUUID UUID].UUIDString;
        NSString * path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"tmp.db"];
        WCTDatabase * wcdb = [[WCTDatabase alloc] initWithPath:path];
        [wcdb createTableAndIndexesOfName:NSStringFromClass(LObj2.class) withClass:LObj2.class];
        [wcdb insertObject:obj into:NSStringFromClass(LObj2.class)];
        
        NSArray * ddd =  [wcdb getAllObjectsOfClass:LObj2.class fromTable:NSStringFromClass(LObj2.class)];
        NSLog(@"%@", NSStringFromSelector(_cmd));
    }
    {
        LModel2 * obj = [[LModel2 alloc] init];
        obj.version = [NSUUID UUID].UUIDString;
        obj.displayOrder = [NSUUID UUID].UUIDString;
        NSString * path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"tmp.db"];
        WCTDatabase * wcdb = [[WCTDatabase alloc] initWithPath:path];
        [wcdb createTableAndIndexesOfName:NSStringFromClass(LModel2.class) withClass:LModel2.class];
        [wcdb insertObject:obj into:NSStringFromClass(LModel2.class)];
        
        NSArray * ddd =  [wcdb getAllObjectsOfClass:LModel2.class fromTable:NSStringFromClass(LModel2.class)];
        NSLog(@"%@", NSStringFromSelector(_cmd));
    }
}

@end
