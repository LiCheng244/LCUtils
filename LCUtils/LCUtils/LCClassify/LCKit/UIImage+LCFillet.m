//
//  UIImage+LCFillet.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "UIImage+LCFillet.h"

@implementation UIImage (LCFillet)

/// 通过颜色创建纯色图片
+ (void)lc_pureColorImageWithColor:(UIColor *)color
                              size:(CGSize)size
                        completion:(void (^)(UIImage *))completion {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 1. 开启图像上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        // 2. 设置颜色填充
        [color setFill]; // 设置颜色
        UIRectFill(rect); // 填充
        
        // 4. 绘图
        UIImage *image = [UIImage imageNamed:@""];
        [image drawInRect:rect];
        
        // 5. 取到结果
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        
        // 6. 关闭上下文
        UIGraphicsEndImageContext();
        
        // 7. 回调
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(newImg);
        });
    });
}

/// 创建拉伸图片
+ (void)lc_drawImageWithNamed:(NSString *)imgName
                         size:(CGSize)size
                   completion:(void (^)(UIImage *))completion {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    // 异步操作 执行绘图
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 1. 开启图像上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        // 2. 绘图
        UIImage *image = [UIImage imageNamed:imgName];
        [image drawInRect:rect];
        
        // 3. 取到结果
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        
        // 4. 关闭上下文
        UIGraphicsEndImageContext();
        
        // 5.  主线程回调
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //执行回调
            completion(newImg);
        });
    });
}

/// 创建圆角图片
+ (void)lc_filletImageWithNamed:(NSString *)imgName
                           size:(CGSize)size
                     completion:(void (^)(UIImage *circleImg))completion {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    // 异步操作 执行绘图
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 1. 开启图像上下文
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        // 2. 设置颜色填充
        UIColor *fillColor = [UIColor clearColor];
        [fillColor setFill]; // 设置颜色
        UIRectFill(rect); // 填充
        
        // 3. 圆角裁切
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect]; // 圆角路径
        [path addClip]; // 裁切
        
        // 4. 绘图
        UIImage *image = [UIImage imageNamed:imgName];
        [image drawInRect:rect];
        
        // 5. 取到结果
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        
        // 6. 关闭上下文
        UIGraphicsEndImageContext();
        
        // 7.  主线程回调
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //执行回调
            completion(newImg);
        });
    });
}
@end
