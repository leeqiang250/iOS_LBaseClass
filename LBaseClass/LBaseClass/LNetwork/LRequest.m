//
//  LRequest.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LRequest.h"
#import "LApp.h"
#import "UIDevice+IdentifierAddition.h"

@implementation LRequest

#pragma mark - Interface



#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.method = HttpMethodGet;
    self.timeoutInterval = 30;
    self.bundleIdentifier = [LApp CFBundleIdentifier];
    self.releaseVersion = [LApp CFBundleShortVersionString];
    self.buildVersion = [LApp CFBundleVersion];
    self.deviceIdentifier = [[UIDevice currentDevice] uniqueDeviceIdentifier];
    self.responseClass = LResponse.class;
    
    self.url = @"http://www.suizhi.com/DRM/client/product/verifyAppVersion";
}

#pragma mark - LSerializableProtocol

- (NSString *)getQuery {
    NSMutableDictionary * keyValues = [self getParameter];
    NSMutableArray * params = [[NSMutableArray alloc] initWithCapacity:keyValues.count];

    for (NSString * key in keyValues.allKeys) {
        id value = [keyValues objectForKey:key];
        if ([value isEqual:[NSNull null]] || value == nil) {
            continue;
        }
        
        NSString * param = [NSString stringWithFormat:@"%@=%@", key, value];
        [params addObject:param];
    }

    return [params componentsJoinedByString:@"&"];
}

- (NSMutableDictionary *)getParameter {
    NSMutableDictionary * keyValues = [self propertyKeyValues:YES];
    
    
    
    
    
    [keyValues removeAllObjects];
    [keyValues setObject:@"ios" forKey:@"device"];
    [keyValues setObject:@"3.0.2" forKey:@"app_version"];
    [keyValues setObject:@"SuiZhi_for_iOS" forKey:@"application_name"];
    [keyValues setObject:@"718d79a2269955f5252befbe8238bc9e9f6a1a6d" forKey:@"IMEI"];
    [keyValues setObject:@"wx1463726184162" forKey:@"username"];
    [keyValues setObject:@"d6ebab7b63170ce1f213f9395edc19c6" forKey:@"token"];
    if (keyValues) {
        return keyValues;
    }
    
    
    
    
    
    NSMutableSet * removeKeys = [LModel propertyKeys:YES];
    [keyValues removeObjectsForKeys:removeKeys.allObjects];

    [keyValues removeObjectForKey:@"url"];
    [keyValues removeObjectForKey:@"method"];
    [keyValues removeObjectForKey:@"timeoutInterval"];
    [keyValues removeObjectForKey:@"responseClass"];
    
    return keyValues;
}

@end
