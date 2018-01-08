//
//  LService.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LService.h"


LCMDType * const LCMDTypeGetAll = @"LCMDTypeGetAll";//全部数据
LCMDType * const LCMDTypeGetLastPage = @"LCMDTypeGetLastPage";//上一页数据
LCMDType * const LCMDTypeGetNextPage = @"LCMDTypeGetNextPage";//下一页数据


@implementation LService

#pragma mark - Interface

- (RACCommand *)command {
    if (!_command) {
        __weak typeof(self) weakSelf = self;
        _command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [weakSelf cmdHandle:input];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.subject sendNext:LCMDTypeGetAll];
                });
                
                return nil;
            }];
        }];
    }
    
    return _command;
}

- (RACSubject *)subject {
    if (!_subject) {
        _subject = [[RACSubject alloc] init];
    }
    
    
    return _subject;
}

- (void)cmdHandle:(id)input {
    
}

@end
