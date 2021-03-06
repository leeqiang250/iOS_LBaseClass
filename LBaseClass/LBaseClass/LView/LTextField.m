//
//  LTextField.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/30.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LTextField.h"
#import "LDefine.h"

@implementation LTextField

#pragma mark - Interface

- (instancetype)init {
    self = [super init];
    [self initialize];
    
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    [self initialize];
//    
//    return self;
//}

//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    [self initialize];
//    
//    return self;
//}

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

- (void)setPlaceholderFont:(UIFont *)font {
    [self setValue:font forKeyPath:@"_placeholderLabel.font"];
}

- (void)setPlaceholderColor:(UIColor *)color {
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)setPlaceholderAligment:(NSTextAlignment)alignment {
    [self setValue:[NSNumber numberWithInteger:alignment] forKeyPath:@"_placeholderLabel.textAligment"];
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
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    //});
}

@end
