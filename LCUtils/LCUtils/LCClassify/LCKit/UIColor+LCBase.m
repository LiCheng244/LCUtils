//
//  UIColor+LCBase.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "UIColor+LCBase.h"

@implementation UIColor (LCBase)


/// 随机色
+ (UIColor *)lc_randomColor {
    
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    
    UIColor *color = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
    return color;
}

/// 16 进制色
+ (UIColor *)lc_hexCodeColor:(NSString *)hexString {
    
    NSString *strs = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    if([strs length] == 3) {
        strs = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                [strs substringWithRange:NSMakeRange(0, 1)],[strs substringWithRange:NSMakeRange(0, 1)],
                [strs substringWithRange:NSMakeRange(1, 1)],[strs substringWithRange:NSMakeRange(1, 1)],
                [strs substringWithRange:NSMakeRange(2, 1)],[strs substringWithRange:NSMakeRange(2, 1)]];
    }
    
    if([strs length] == 6) {
        strs = [strs stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:strs] scanHexInt:&baseValue];
    
    float red   = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue  = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


/// 根据 RGB 色值生成颜色 (无需 /255）
+ (UIColor *)lc_colorWithR:(CGFloat)red
                         G:(CGFloat)green
                         B:(CGFloat)blue {
    
    UIColor *color = [UIColor colorWithRed:red/255.0
                                     green:green/255.0
                                      blue:blue/255.0
                                     alpha:1.0];
    return color;
}

@end
