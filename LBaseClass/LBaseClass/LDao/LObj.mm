//
//  LObj.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/10.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LObj.h"

@implementation LObj

WCDB_IMPLEMENTATION(LObj)
WCDB_SYNTHESIZE(LObj, displayOrder)
WCDB_SYNTHESIZE(LObj, version)

- (instancetype)init {
    self = [super init];
    
    [self initialize];
    
    return self;
}

#pragma mark - LInitProtocol

- (void)initialize {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
        if (self.uid) {
            @throw [NSException exceptionWithName:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] reason:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] userInfo:nil];
        }
        
        _uid = [NSUUID UUID].UUIDString;
        _createTime = [[NSDate date] timeIntervalSince1970];
//    });
}









#pragma mark - LReflectProtocol

- (NSMutableDictionary *)propertyKeyValues:(BOOL)isIncludeParent {
    NSMutableSet * keys = [self propertyKeys:isIncludeParent];
    NSMutableDictionary * keyValues = [[NSMutableDictionary alloc] initWithCapacity:keys.count];
    
    for (NSString * key in keys) {
        id value = [self valueForKey:key];
        if ([value isEqual:[NSNull null]] || value == nil) {
            continue;
        }
        
        [keyValues setObject:value forKey:key];
    }
    
    return keyValues.count == 0 ? nil : keyValues;
}

- (NSMutableSet *)propertyKeys:(BOOL)isIncludeParent {
    return [[self class] propertyKeys:isIncludeParent];
}

+ (NSMutableSet *)propertyKeys:(BOOL)isIncludeParent {
    NSMutableSet * keys = [[NSMutableSet alloc] init];
    Class aClass = self;
    
    while (YES) {
        unsigned int outCount, i;
        objc_property_t * properties = class_copyPropertyList(aClass, &outCount);
        
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            NSString * propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            [keys addObject:propertyName];
        }
        
        free(properties);
        
        if (!isIncludeParent || aClass == nil || aClass == LObj.class) {
            break;
        }
        
        aClass = aClass.superclass;
    }
    
    return keys.count == 0 ? nil : keys;
}

- (BOOL)reflect:(NSDictionary *)obj {
    NSMutableSet * keys = [self propertyKeys:YES];
    for (NSString * key in keys) {
        id value = [obj valueForKey:key];
        if ([value isEqual:[NSNull null]] || value == nil) {
            continue;
        }
        
        [self setValue:value forKey:key];
    }
    
    return YES;
}


#pragma mark - LSerializableProtocol

- (NSString *)getJSON {
    return nil;
}

- (NSString *)getXML {
    return nil;
}

- (NSString *)getQuery {
    return nil;
}

- (NSMutableDictionary *)getParameter {
    return nil;
}


@end
