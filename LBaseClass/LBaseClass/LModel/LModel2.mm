//
//  LModel.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LModel2.h"
#import <objc/runtime.h>

@implementation LModel2


WCDB_IMPLEMENTATION(LModel2)
WCDB_SYNTHESIZE(LModel2, displayOrder)
WCDB_SYNTHESIZE(LModel2, version)


#pragma mark - Interface



#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
}

@end
