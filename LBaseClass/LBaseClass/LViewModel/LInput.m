//
//  LInput.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/8.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LInput.h"

@implementation LInput

#pragma mark - Interface

+ (instancetype)inputWithType:(NSUInteger)type info:(id)info {
    return [[self alloc] initWithType:type info:info];
}

- (instancetype)initWithType:(NSUInteger)type info:(id)info {
    self = [super init];
    
    self.type = type;
    self.info = info;
    
    return self;
}

@end
