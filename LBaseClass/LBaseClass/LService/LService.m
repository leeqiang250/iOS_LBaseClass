//
//  LService.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LService.h"
#import "NSString+Parser.h"


LCmd * const LCmdGetAll = @"LCmdGetAll";//全部数据
LCmd * const LCmdGetLastPage = @"LCmdGetLastPage";//上一页数据
LCmd * const LCmdGetNextPage = @"LCmdGetNextPage";//下一页数据


@implementation LService

#pragma mark - LCmdProtocol

@synthesize command = _command;
@synthesize subject = _subject;

/**
 命令信号
 */
- (RACCommand *)command {
    if (!_command) {
        _command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            if (input == nil || [NSString isNullOrEmpty:((LCmdTransfer *)input).cmd]) {
                return nil;
            }
            
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                return [self cmdHandle:input subscriber:subscriber];
            }];
        }];
    }
    
    return _command;
}

/**
 订阅信号
 */
- (RACSubject *)subject {
    if (!_subject) {
        _subject = [[RACSubject alloc] init];
    }
    
    return _subject;
}

/**
 订阅具体类型的命令
 */
- (RACDisposable *)subscribeNext:(LCmd *)cmd nextBlock:(void (^)(LCmdTransfer * x))nextBlock {
    return [self.subject subscribeNext:^(id x) {
        LCmdTransfer * transfer = x;
        if ([transfer.cmd isEqualToString:cmd] && nextBlock) {
            nextBlock(x);
        }
    }];
}

/**
 命令处理中心，外部不调用
 */
- (RACDisposable *)cmdHandle:(LCmdTransfer *)input subscriber:(id<RACSubscriber>)subscriber {
    [self.subject sendNext:[LCmdTransfer cmd:input.cmd value:nil]];
    [self.subject sendCompleted];
    
    return nil;
}

@end
