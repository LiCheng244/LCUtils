//
//  UIImage+LCBase.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "UIImage+LCBase.h"

@implementation UIImage (LCBase)


#pragma mark - ------ Public Methods ------
///  指定渐变图片
+ (UIImage*)lc_gradientImage {
    
    UIColor *color1 = [UIColor lc_hexCodeColor:@"fea26e"];
    UIColor *color2 = [UIColor lc_hexCodeColor:@"ff6668"];
    UIImage *img = [self lc_gradientImageWithBounds:CGRectMake(0, 0, SCREEN_WIDTH, 2) andColors:@[color1, color2] andGradientType:1];
    
    return img;
}


/// 通用渐变图片
+ (UIImage*)lc_gradientImageWithBounds:(CGRect)bounds andColors:(NSArray*)colors andGradientType:(int)gradientType{
    
    NSMutableArray *ar = [NSMutableArray array];
    
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(bounds.size, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    
    switch (gradientType) {
        case 0:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, bounds.size.height);
            break;
        case 1:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(bounds.size.width, 0.0);
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}


/// 获取网络图片尺寸
+ (CGSize)lc_getImageSizeWithURL:(id)imageURL width:(CGFloat)mwidth {
    
    if (imageURL == nil) {
        return CGSizeMake(mwidth, 0);
    }
    NSNumber *imgH = [[NSUserDefaults standardUserDefaults] objectForKey:imageURL];
    
    if (!imgH) {
        CGSize imageSize = [self getImageSizeWithURL:imageURL];
        CGFloat imgH = 0;
        if (imageSize.height > 0) {
            imgH = mwidth * imageSize.height / imageSize.width;
        }
        [[NSUserDefaults standardUserDefaults] setObject:@(imgH) forKey:imageURL];
        
        return CGSizeMake(mwidth, imgH);
        
    } else {
        return CGSizeMake(mwidth, [imgH floatValue]);
    }
}


#pragma mark - ------ Private Methods ------

+ (CGSize)getImageSizeWithURL:(id)URL {
    
    NSURL * url = nil;
    if ([URL isKindOfClass:[NSURL class]]) {
        url = URL;
    }
    if ([URL isKindOfClass:[NSString class]]) {
        url = [NSURL URLWithString:URL];
    }
    if (!URL) {
        return CGSizeZero;
    }
    CGImageSourceRef imageSourceRef = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    CGFloat width = 0, height = 0;
    if (imageSourceRef) {
        CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSourceRef, 0, NULL);
        //以下是对手机32位、64位的处理
        if (imageProperties != NULL) {
            CFNumberRef widthNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
#if defined(__LP64__) && __LP64__
            if (widthNumberRef != NULL) {
                CFNumberGetValue(widthNumberRef, kCFNumberFloat64Type, &width);
            }
            CFNumberRef heightNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            if (heightNumberRef != NULL) {
                CFNumberGetValue(heightNumberRef, kCFNumberFloat64Type, &height);
            }
#else
            if (widthNumberRef != NULL) {
                CFNumberGetValue(widthNumberRef, kCFNumberFloat32Type, &width);
            }
            CFNumberRef heightNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            if (heightNumberRef != NULL) {
                CFNumberGetValue(heightNumberRef, kCFNumberFloat32Type, &height);
            }
#endif
            CFRelease(imageProperties);
        }
        
        CFRelease(imageSourceRef);
    }
    return CGSizeMake(width, height);
}


@end
