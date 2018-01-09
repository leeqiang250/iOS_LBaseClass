
//
//  LCmdProtocol.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/9.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>
#import "LCmdTransfer.h"



//DEMO
//LSettingService * service = [[LSettingService alloc] init];
//[service subscribeNext:LCmdGetNextPage nextBlock:^(LCmdTransfer * x) {
//    //NSLog(@"%d%@", __LINE__, x);
//}];
//[service.subject subscribeNext:^(id x) {
//    //NSLog(@"%d%@", __LINE__, x);
//}];
//[service.subject subscribeNext:^(id x) {
//    //NSLog(@"%d%@", __LINE__, x);
//}];
//[service.command execute:[LCmdTransfer cmd:LCmdGetNextPage value:nil]];



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
 订阅具体类型的命令，建议使用该方法订阅命令，使代码更清晰
 */
- (RACDisposable *)subscribeNext:(LCmd *)type nextBlock:(void (^)(LCmdTransfer * x))nextBlock;

/**
 命令处理中心，外部不调用
 */
- (RACDisposable *)cmdHandle:(LCmdTransfer *)input subscriber:(id<RACSubscriber>)subscriber;

@end
