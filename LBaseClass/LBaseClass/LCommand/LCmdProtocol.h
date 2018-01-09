
//
//  LCmdProtocol.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/9.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>

@protocol LCmdProtocol <NSObject>

/**
 命令信号
 */
@property (nonatomic, strong) RACCommand * command;

/**
 订阅信号
 */
@property (nonatomic, strong) RACSubject * subject;


@optional

/**
 订阅具体类型的命令
 */
- (RACDisposable *)subscribeNext:(LCMDType *)type nextBlock:(void (^)(LCmdTransfer * x))nextBlock;

/**
 命令处理中心，外部不调用
 */
- (RACDisposable *)cmdHandle:(LCmdTransfer *)input subscriber:(id<RACSubscriber>)subscriber;

@end
