//
//  LCmdTransfer.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/8.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LCmdTransfer.h"

@implementation LCmdTransfer

#pragma mark - Interface

+ (instancetype)cmdWithType:(LCMDType *)type value:(id)value {
    return [[self alloc] initWithType:type value:value];
}

- (instancetype)initWithType:(LCMDType *)type value:(id)value {
    self = [super init];
    
    self.type = type;
    self.value = value;
    
    return self;
}

@end
