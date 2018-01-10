//
//  AppDelegate.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "AppDelegate.h"
#import "LBaseClass/LBaseClass.h"


#import "LSettingVM.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)authenticateUser
{
    //初始化上下文对象
    LAContext* context = [[LAContext alloc] init];
    //错误对象
    NSError* error = nil;
    NSString* result = @"Authentication is needed to access your notes.";
    
    //首先使用canEvaluatePolicy 判断设备支持状态
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        //支持指纹验证
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:result reply:^(BOOL success, NSError *error) {
            if (success) {
                //验证成功，主线程处理UI
            }
            else
            {
                NSInteger aaa0 = LAErrorAuthenticationFailed;
                NSInteger aaa1 = LAErrorUserCancel;
                NSInteger aaa2 = LAErrorUserFallback;
                NSInteger aaa3 = LAErrorSystemCancel;
                NSInteger aaa4 = LAErrorPasscodeNotSet;
                NSInteger aaa5 = LAErrorTouchIDNotAvailable;
                NSInteger aaa6 = LAErrorTouchIDNotEnrolled;
                NSInteger aaa7 = LAErrorTouchIDLockout;
                NSInteger aaa8 = LAErrorAppCancel;
                NSInteger aaa9 = LAErrorInvalidContext;
                NSInteger aaa13 = LAErrorNotInteractive;
                
                //指纹验证错误//LAErrorAuthenticationFailed
                //用户取消//LAErrorUserCancel
                //输入密码//LAErrorUserFallback
                
                NSLog(@"%@",error.localizedDescription);
                switch (error.code) {
                    case LAErrorSystemCancel:
                    {
                        NSLog(@"Authentication was cancelled by the system");
                        //切换到其他APP，系统取消验证Touch ID
                        break;
                    }
                    case LAErrorUserCancel:
                    {
                        NSLog(@"Authentication was cancelled by the user");
                        //用户取消验证Touch ID
                        break;
                    }
                    case LAErrorUserFallback:
                    {
                        NSLog(@"User selected to enter custom password");
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            //用户选择其他验证方式，切换主线程处理
                        }];
                        break;
                    }
                    default:
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            //其他情况，切换主线程处理
                        }];
                        break;
                    }
                }
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    //[self authenticateUser];
                });
            }
        }];
    }
    else
    {
        //不支持指纹识别，LOG出错误详情
        
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
            {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorPasscodeNotSet:
            {
                NSLog(@"A passcode has not been set");
                break;
            }
            default:
            {
                NSLog(@"TouchID not available");
                break;
            }
        }
        
        NSLog(@"%@",error.localizedDescription);
        //[self showPasswordAlert];
    }  }


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self authenticateUser];
    
//    //创建LAContext
//    LAContext *context = [LAContext new];
//
//    //这个属性是设置指纹输入失败之后的弹出框的选项
//    context.localizedFallbackTitle = @"没有忘记密码";
//
//    NSError *error = nil;
//    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
//        NSLog(@"支持指纹识别");
//        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹解锁" reply:^(BOOL success, NSError * _Nullable error) {
//            if (success) {
//                NSLog(@"验证成功 刷新主界面");
//            }else{
//                NSLog(@"%@",error.localizedDescription);
//                switch (error.code) {
//                    case LAErrorSystemCancel:
//                    {
//                        NSLog(@"系统取消授权，如其他APP切入");
//                        break;
//                    }
//                    case LAErrorUserCancel:
//                    {
//                        NSLog(@"用户取消验证Touch ID");
//                        break;
//                    }
//                    case LAErrorAuthenticationFailed:
//                    {
//                        NSLog(@"授权失败");
//                        break;
//                    }
//                    case LAErrorPasscodeNotSet:
//                    {
//                        NSLog(@"系统未设置密码");
//                        break;
//                    }
//                    case LAErrorTouchIDNotAvailable:
//                    {
//                        NSLog(@"设备Touch ID不可用，例如未打开");
//                        break;
//                    }
//                    case LAErrorTouchIDNotEnrolled:
//                    {
//                        NSLog(@"设备Touch ID不可用，用户未录入");
//                        break;
//                    }
//                    case LAErrorUserFallback:
//                    {
//                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                            NSLog(@"用户选择输入密码，切换主线程处理");
//                        }];
//                        break;
//                    }
//                    default:
//                    {
//                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                            NSLog(@"其他情况，切换主线程处理");
//                        }];
//                        break;
//                    }
//                }
//            }
//        }];
//    }else{
//        NSLog(@"不支持指纹识别");
//        switch (error.code) {
//            case LAErrorTouchIDNotEnrolled:
//            {
//                NSLog(@"TouchID is not enrolled");
//                break;
//            }
//            case LAErrorPasscodeNotSet:
//            {
//                NSLog(@"A passcode has not been set");
//                break;
//            }
//            default:
//            {
//                NSLog(@"TouchID not available");
//                break;
//            }
//        }
//
//        NSLog(@"%@",error.localizedDescription);
//    }
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
