//
//  LTableViewController.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LTableViewController.h"

@interface LTableViewController ()

@end

@implementation LTableViewController

#pragma mark - Interface

- (instancetype)init {
    self = [super init];
    
    [self initialize];
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
    [self initialize];
    
    return self;
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    [self initialize];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    [self initialize];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _enterTime = [[NSDate date] timeIntervalSince1970];

    if (self.visibleNavbar) {
        if (self.navigationController && self.navigationController.navigationBar.hidden) {
            self.navigationController.navigationBar.hidden = NO;
        }
    } else {
        if (self.navigationController && !self.navigationController.navigationBar.hidden) {
            self.navigationController.navigationBar.hidden = YES;
        }
    }
    
    if (self.visibleTabar) {
        if (self.tabBarController && self.tabBarController.tabBar.hidden) {
            self.tabBarController.tabBar.hidden = NO;
        }
    } else {
        if (self.tabBarController && !self.tabBarController.tabBar.hidden) {
            self.tabBarController.tabBar.hidden = YES;
        }
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    _stayTime += ([[NSDate date] timeIntervalSince1970] - self.enterTime);
    _enterTime = 0;
}

- (void)setVisibleNavbar:(BOOL)visibleNavbar {
    _visibleNavbar = visibleNavbar;
    
    if (_visibleNavbar) {
        if (self.navigationController && self.navigationController.navigationBar.hidden) {
            self.navigationController.navigationBar.hidden = NO;
        }
    } else {
        if (self.navigationController && !self.navigationController.navigationBar.hidden) {
            self.navigationController.navigationBar.hidden = YES;
        }
    }
}

- (void)setVisibleTabar:(BOOL)visibleTabar {
    _visibleTabar = visibleTabar;
    
    if (_visibleTabar) {
        if (self.tabBarController && self.tabBarController.tabBar.hidden) {
            self.tabBarController.tabBar.hidden = NO;
        }
    } else {
        if (self.tabBarController && !self.tabBarController.tabBar.hidden) {
            self.tabBarController.tabBar.hidden = YES;
        }
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - LInitProtocol

- (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self.visibleNavbar = NO;
        self.visibleTabar = NO;
        
        self.uid = [NSUUID UUID].UUIDString;
        _createTime = [[NSDate date] timeIntervalSince1970];
        _destroyTime = 0;
        _enterTime = 0;
        _stayTime = 0;
    });
}


@end
