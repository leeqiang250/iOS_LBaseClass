//
//  TimerRetainVC.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/4.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "TimerRetainVC.h"
#import "LDefine.h"

@interface TimerRetainVC ()

@property (nonatomic, strong) NSTimer * timer;

@end

@implementation TimerRetainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(tick:) userInfo:nil repeats:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    });
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    _logImport();
}

- (void)tick:(NSTimer *)sender {
    _logImport();
}

@end
