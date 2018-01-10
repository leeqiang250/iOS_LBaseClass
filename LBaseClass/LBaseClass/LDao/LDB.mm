//
//  LDB.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/10.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LDB.h"

#import <WCDB/WCDB.h>
#import "LModel.h"
#import "LModel+WCTTableCoding.h"

@implementation LDB

- (void)dd {
    
    {
        LModel * obj = [[LModel alloc] init];
        obj.version = [NSUUID UUID].UUIDString;
        obj.displayOrder = [NSUUID UUID].UUIDString;
        NSString * path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"tmp.db"];
        WCTDatabase * wcdb = [[WCTDatabase alloc] initWithPath:path];
        [wcdb createTableAndIndexesOfName:NSStringFromClass(LModel.class) withClass:LModel.class];
        [wcdb insertObject:obj into:NSStringFromClass(LModel.class)];

        NSArray * ddd =  [wcdb getAllObjectsOfClass:LModel.class fromTable:NSStringFromClass(LModel.class)];
        NSLog(@"%@", NSStringFromSelector(_cmd));
    }
    
}

@end
