//
//  LDao.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LObject.h"
#import "LModel.h"

@interface LDao : LObject

+ (instancetype)dbPath:(NSString *)dbPath secret:(NSString *)secret;

- (BOOL)openWithDBPath:(NSString *)dbPath secret:(NSString *)secret;

- (void)close;

@end
