//
//  LDB.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/10.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LDB.h"

#import <WCDB/WCDB.h>
#import "LObj.h"

@implementation LDB

- (void)dd {
    LObj * obj = [[LObj alloc] init];
    obj.version = [NSUUID UUID].UUIDString;
    obj.displayOrder = [NSUUID UUID].UUIDString;
    NSString * path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"tmp.db"];
    WCTDatabase * wcdb = [[WCTDatabase alloc] initWithPath:path];
    [wcdb createTableAndIndexesOfName:NSStringFromClass(LObj.class) withClass:LObj.class];
    [wcdb insertObject:obj into:NSStringFromClass(LObj.class)];
    
    NSArray * ddd =  [wcdb getAllObjectsOfClass:LObj.class fromTable:NSStringFromClass(LObj.class)];
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
