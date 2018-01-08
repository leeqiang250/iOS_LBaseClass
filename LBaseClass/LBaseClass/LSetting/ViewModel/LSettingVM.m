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

- (void)dd {
    LSettingService * service = [[LSettingService alloc] init];
    [service.subject subscribeNext:^(id x) {
        
    }];
    
    [service.command execute:LCMDTypeGetNextPage];
    
}

@end
