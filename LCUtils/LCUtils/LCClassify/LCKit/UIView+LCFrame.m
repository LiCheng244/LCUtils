//
//  UIView+LCFrame.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "UIView+LCFrame.h"

@implementation UIView (LCFrame)

#pragma mark  ---- 位置 ----
- (void)setLc_x:(CGFloat)lc_x {
    
    CGRect frame   = self.frame;
    frame.origin.x = lc_x;
    self.frame     = frame;
}

- (CGFloat)lc_x {
    return self.frame.origin.x;
}


- (void)setLc_y:(CGFloat)lc_y {
    
    CGRect frame   = self.frame;
    frame.origin.y = lc_y;
    self.frame     = frame;
}

- (CGFloat)lc_y {
    return self.frame.origin.y;
}


- (void)setLc_origin:(CGPoint)lc_origin {
    
    CGRect frame = self.frame;
    frame.origin = lc_origin;
    self.frame   = frame;
}

- (CGPoint)lc_origin {
    return self.frame.origin;
}


#pragma mark ---- 大小 ----
- (void)setLc_width:(CGFloat)lc_width{
    
    CGRect frame     = self.frame;
    frame.size.width = lc_width;
    self.frame       = frame;
}

- (CGFloat)lc_width {
    return self.frame.size.width;
}


- (void)setLc_height:(CGFloat)lc_height {
    
    CGRect frame      = self.frame;
    frame.size.height = lc_height;
    self.frame        = frame;
}

- (CGFloat)lc_height{
    return self.frame.size.height;
}


- (void)setLc_size:(CGSize)lc_size {
    
    CGRect frame = self.frame;
    frame.size   = lc_size;
    self.frame   = frame;
}

- (CGSize)lc_size {
    return self.frame.size;
}


#pragma mark ---- 中心点 ----
- (void)setLc_centerX:(CGFloat)lc_centerX {
    
    CGPoint center = self.center;
    center.x       = lc_centerX;
    self.center    = center;
}

- (CGFloat)lc_centerX {
    return self.center.x;
}


- (void)setLc_centerY:(CGFloat)lc_centerY {
    
    CGPoint center = self.center;
    center.y       = lc_centerY;
    self.center    = center;
}

- (CGFloat)lc_centerY{
    return self.center.y;
}

@end
