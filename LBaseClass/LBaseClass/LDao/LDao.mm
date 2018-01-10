//
//  LDao.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LDao.h"
#import "LDao+WCTTableCoding.h"
#import "LApp.h"
#import "NSString+Parser.h"
#import "LModel+WCTTableCoding.h"

@interface LDao()

@property (nonatomic, strong) WCTDatabase * wcdb;

@end

@implementation LDao

#pragma mark - Interface

+ (instancetype)dbPath:(NSString *)dbPath secret:(NSString *)secret{
    LDao * dao = [[LDao alloc] init];
    
    return [dao openWithDBPath:dbPath secret:secret] ? dao : nil;
}

- (BOOL)openWithDBPath:(NSString *)dbPath secret:(NSString *)secret{
    @try {
        self.wcdb = [[WCTDatabase alloc] initWithPath:dbPath];
        if ([NSString isNullOrEmpty:secret]) {
            [self.wcdb setCipherKey:[[LApp CFBundleIdentifier] dataUsingEncoding:NSASCIIStringEncoding]];
        }else {
            [self.wcdb setCipherKey:[secret dataUsingEncoding:NSASCIIStringEncoding]];
        }
        
        return [self.wcdb canOpen] && [self.wcdb isOpened];
    }@catch(NSException * e) {
        return NO;
    }
}

- (void)close {
    @try {
        [self.wcdb close];
    }@catch(NSException * e) {
    }
}

- (BOOL)insertObject:(LModel *)model {
    if (!model) {
        return NO;
    }
    
    @try {
        return [self.wcdb insertObject:model into:NSStringFromClass(model.class)];
    }@catch(NSException * e) {
        return NO;
    }
}

- (BOOL)insertObjects:(NSArray<LModel *> *)models {
    if (!models || models.count == 0) {
        return NO;
    }
    
    @try {
        return [self.wcdb insertObjects:models into:NSStringFromClass(models.firstObject.class)];
    }@catch(NSException * e) {
        return NO;
    }
}

- (BOOL)deleteAllObjectsFromModel:(LModel *)model {
    if (!model) {
        return NO;
    }
    
    @try {
        return [self.wcdb deleteAllObjectsFromTable:NSStringFromClass(model.class)];
    }@catch(NSException * e) {
        return NO;
    }
}

- (NSArray<LModel *> *)getAllObjectsFromModel:(LModel *)model {
    if (!model) {
        return nil;
    }
    
    @try {
        return [self.wcdb getAllObjectsOfClass:model.class fromTable:NSStringFromClass(model.class)];
    }@catch(NSException * e) {
        return nil;
    }
}

- (BOOL)updateObject:(LModel *)model {
    if (!model) {
        return NO;
    }
    
    @try {
        return [self.wcdb updateAllRowsInTable:NSStringFromClass(model.class) onProperties:[model.class AllProperties] withObject:model];
    }@catch(NSException * e) {
        return NO;
    }
}

- (BOOL)updateObject:(LModel *)model property:(const WCTProperty &)property{
    if (!model) {
        return NO;
    }
    
    @try {
        return [self.wcdb updateAllRowsInTable:NSStringFromClass(model.class) onProperty:property withObject:model];
    }@catch(NSException * e) {
        return NO;
    }
}

@end
