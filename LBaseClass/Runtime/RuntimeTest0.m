//
//  RuntimeTest0.m
//  LBaseClass
//
//  Created by liqiang on 2018/3/22.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "RuntimeTest0.h"
#import <objc/runtime.h>
#import <objc/NSObjCRuntime.h>

@implementation RuntimeTest0

- (instancetype)init {
    self = [super init];
    [self say0];
    [self say1:[NSUUID UUID].UUIDString];
    [self say2:@"test" p2:[NSUUID UUID].UUIDString];
    [self say3:@"aaa" p2:@"bbb" p3:@"ccc"];
    return self;
}

- (void)say0 {
    NSLog(@"%s", __FUNCTION__);
}

- (void)say1:(NSString *)p1 {
    NSLog(@"%s", __FUNCTION__);
}

- (void)say2:(NSString *)p1 p2:(NSString *)p2 {
    NSLog(@"%s", __FUNCTION__);
}

- (void)say3:(NSString *)p1 p2:(NSString *)p2 p3:(NSString *)p3 {
    NSLog(@"%s", __FUNCTION__);
}

@end
