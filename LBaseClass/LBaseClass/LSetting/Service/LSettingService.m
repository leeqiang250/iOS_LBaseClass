//
//  LSettingService.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/8.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LSettingService.h"

@implementation LSettingService

- (RACDisposable *)subscribeNext:(LCmd *)cmd nextBlock:(void (^)(LCmdTransfer *))nextBlock {
    return [self.subject subscribeNext:^(id x) {
        LCmdTransfer * transfer = x;
        if ([transfer.cmd isEqualToString:cmd] && nextBlock) {
            nextBlock(x);
        }
    }];
}

- (RACDisposable *)cmdHandle:(LCmdTransfer *)transfer subscriber:(id<RACSubscriber>)subscriber {
    id value = nil;
    if ([transfer.cmd isEqualToString:LCmdGetAll]) {
        NSMutableArray * data = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < 20; i++) {
            [data addObject:[[LSettingModel alloc] init]];
        }
        
        value = data;
    }
    
    [self.subject sendNext:[LCmdTransfer cmd:transfer.cmd value:value]];
    [self.subject sendCompleted];
    
    return nil;
}

@end
