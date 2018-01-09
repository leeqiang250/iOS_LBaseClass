//
//  LSettingVM.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/8.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LSettingVM.h"
#import "LSettingService.h"

@implementation LSettingVM

//- (void)dd {
//    LSettingService * service = [[LSettingService alloc] init];
//    [service subscribeNext:LCMDTypeGetNextPage nextBlock:^(LCmdTransfer * x) {
//        NSLog(@"%d%@", __LINE__, x);
//    }];
//    [service.subject subscribeNext:^(id x) {
//        NSLog(@"%d%@", __LINE__, x);
//    }];
//    [service.subject subscribeNext:^(id x) {
//        NSLog(@"%d%@", __LINE__, x);
//    }];
//    
//    [service.command execute:[LCmdTransfer cmdWithType:LCMDTypeGetNextPage value:nil]];
//}

@end
