//
//  LWebView.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/16.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LWebView.h"
#import "LDefine.h"

@implementation LWebView

#pragma mark - Interface

//- (instancetype)init {
//    self = [super init];
//    [self initialize];
//
//    return self;
//}
//
//- (instancetype)initWithCoder:(NSCoder *)coder {
//    self = [super initWithCoder:coder];
//    [self initialize];
//    
//    return self;
//}
//
//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    [self initialize];
//
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration {
    self = [super initWithFrame:frame configuration:configuration];
    [self initialize];
    
    return self;
}

- (NSString *)description {
    _logRetainCount(self);
    return [NSString stringWithFormat:@"%@:%@", self.class, [NSString isNullOrEmpty:self.uid] ? @"" : self.uid];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _logImport();
}

- (void)layoutUI {
    
}

#pragma mark - LInitProtocol

- (void)initialize {
    //static dispatch_once_t onceToken;
    //dispatch_once(&onceToken, ^{
    if (self.uid) {
        @throw [NSException exceptionWithName:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] reason:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] userInfo:nil];
    }
    
    self.uid = [NSUUID UUID].UUIDString;
    self.createTime = [[NSDate date] timeIntervalSince1970];    
    //});
}

@end
