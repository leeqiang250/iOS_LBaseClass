//
//  LDefine.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#ifndef LDefine_h
#define LDefine_h


#ifdef DEBUG

#define debugLog(...)    NSLog(__VA_ARGS__)
#define debugMethod()    NSLog(@"%s", __func__)
#define debugError()     NSLog(@"Error at %s Line:%d", __func__, __LINE__)

#else

#define debugLog(...)
#define debugMethod()
#define debugError()

#endif


#endif /* LDefine_h */
