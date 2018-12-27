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


@end

NS_ASSUME_NONNULL_END
