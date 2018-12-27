//
//  UIColor+LCBase.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LCBase)

/**
 随机色
 */
+ (UIColor *)lc_randomColor;


/**
 16进制颜色  例：778899

 @param hexString 例：778899
 */
+ (UIColor *)lc_hexCodeColor:(NSString *)hexString;


/**
 根据 RGB 色值生成颜色 (无需 /255）
 
 @param red     红色色值
 @param green   绿色色值
 @param blue    蓝色色值
 @return 生成好的颜色
 */
+ (UIColor *)lc_colorWithR:(CGFloat)red
                         G:(CGFloat)green
                         B:(CGFloat)blue;


@end

NS_ASSUME_NONNULL_END
