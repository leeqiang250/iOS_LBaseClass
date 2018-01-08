//
//  LViewModel.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/8.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LViewModel.h"

@implementation LViewModel

#pragma mark - Interface

- (RACSubject *)subject {
    if (!_subject) {
        _subject = [[RACSubject alloc] init];
    }
    
    return _subject;
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
}

@end
