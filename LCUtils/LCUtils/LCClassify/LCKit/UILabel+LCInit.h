//
//  UILabel+LCInit.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (LCInit)

/**
 快速实例化 UILabel
 
 @param text        文字
 @return UILabel 默认字体 16，默认颜色 [UIColor darkTextColor]，默认对齐方式 Left
 */
+ (nonnull UILabel *)lc_labelWithText:(nullable NSString *)text;

/**
 快速实例化 UILabel
 
 @param text        文字
 @param fontSize    字体大小
 @return UILabel 默认颜色 [UIColor darkTextColor]，默认对齐方式 Left
 */
+ (nonnull UILabel *)lc_labelWithText:(nullable NSString *)text
                             fontSize:(CGFloat)fontSize;


/**
 快速实例化 UILabel
 
 @param text        文字
 @param fontSize    字体大小
 @param textColor   字体颜色
 @return UILabel 默认对齐方式 Left
 */
+ (nonnull UILabel *)lc_labelWithText:(nullable NSString *)text
                             fontSize:(CGFloat)fontSize
                            textColor:(nonnull UIColor *)textColor;


/**
 快速实例化 UILabel
 
 @param text        文字
 @param fontSize    字体大小
 @param textColor   字体颜色
 @param alignment   对齐方式
 @return  UILabel
 */
+ (nonnull UILabel *)lc_labelWithText:(NSString *)text
                             fontSize:(CGFloat)fontSize
                            textColor:(UIColor *)textColor
                            alignment:(NSTextAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
