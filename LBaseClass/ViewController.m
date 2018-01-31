//
//  ViewController.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "ViewController.h"
#import "LBaseClass.h"
#import "TimerRetainVC.h"

@interface ViewController ()

@property (nonatomic, strong) NSString * v0;

@property (nonatomic, copy) NSString * v1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    {//测试字体大小
        LFontTableView * tb = [[LFontTableView alloc] initWithFrame:self.view.bounds];
        [tb reloadData];
        [self.view addSubview:tb];
    }
    {//测试Timer循环引用
        //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //    [self presentViewController:[[TimerRetainVC alloc] init] animated:YES completion:nil];
        //});
    }
    {//测试引用
        //NSMutableString * text = [NSMutableString stringWithFormat:@"abc"];
        //
        //NSLog(@"%@", text);
        //NSLog(@"%@", _v0);
        //NSLog(@"%@", _v1);
        //
        //self.v0 = text;
        //self.v1 = text;
        //
        //NSLog(@"%p,%p", text, &text);
        //NSLog(@"%p,%p", _v0, &_v0);
        //NSLog(@"%p,%p", _v1, &_v1);
        //
        //[text appendString:@"de"];
        //
        //NSLog(@"%p,%p", text, &text);
        //NSLog(@"%p,%p", _v0, &_v0);
        //NSLog(@"%p,%p", _v1, &_v1);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
