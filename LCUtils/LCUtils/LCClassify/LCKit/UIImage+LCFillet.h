//
//  UIImage+LCFillet.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LCFillet)



/**
 根据图片名称，生成给定尺寸的圆角图像
 
 @param imgName     图像名称
 @param size        要生成的图像大小
 @param completion  完成回调返回新的图像
 */
+ (void )lc_filletImageWithNamed:(NSString *)imgName
                            size:(CGSize)size
                      completion:(void (^)(UIImage *circleImg))completion;


/**
 根图像名称， 生成给定尺寸的拉伸图像
 
 @param imgName     图像名称
 @param size        图像尺寸
 @param completion  完成回调返回新的图像
 */
+ (void )lc_drawImageWithNamed:(NSString *)imgName
                          size:(CGSize)size
                    completion:(void (^)(UIImage *drawImg))completion;



/**
 根据给定颜色， 生成给定尺寸的纯色图像
 
 @param color       背景颜色
 @param size        尺寸
 @param completion  完成回调返回新的图像
 */
+ (void)lc_pureColorImageWithColor:(UIColor *)color
                              size:(CGSize)size
                        completion:(void (^)(UIImage *pureColorImage))completion;


@end

NS_ASSUME_NONNULL_END
