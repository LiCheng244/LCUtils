//
//  UIImage+LCBase.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LCBase)


/**
 导航栏渐变图片
 */
+ (UIImage*)lc_gradientImage;


/**
 *  获取矩形的渐变色的UIImage
 *
 *  @param bounds           UIImage的bounds
 *  @param colors           渐变色数组，可以设置两种颜色
 *  @param gradientType     渐变的方式：0--->从上到下   1--->从左到右
 */
+ (UIImage *)lc_gradientImageWithBounds:(CGRect)bounds andColors:(NSArray*)colors andGradientType:(int)gradientType;


/**
 通过 URL 和给定的宽度 获取网络图片大小
 
 @param URL         url
 @param mwidth      宽度
 */
+ (CGSize)lc_getImageSizeWithURL:(id)URL width:(CGFloat)mwidth;


@end

NS_ASSUME_NONNULL_END
