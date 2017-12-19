//
//  UIColor+Category.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/15.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor(Category)

+ (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random_uniform(256) / 255.0f green:arc4random_uniform(256) / 255.0f blue:arc4random_uniform(256) / 255.0f alpha:arc4random_uniform(101) / 100.0f];
}

- (CGFloat)getR {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        return components[0];
    }
    
    return 0.0f;
}

- (CGFloat)getG {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        return components[1];
    }
    
    return 0.0f;
}

- (CGFloat)getB {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        return components[2];
    }
    
    return 0.0f;
}

- (CGFloat)getA {
    size_t numComponents = CGColorGetNumberOfComponents(self.CGColor);
    if (numComponents == 4) {
        const CGFloat * components = CGColorGetComponents(self.CGColor);
        return components[3];
    }
    
    return 0.0f;
}




@end
