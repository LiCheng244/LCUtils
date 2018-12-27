//
//  UIView+LCXib.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "UIView+LCXib.h"

@implementation UIView (LCXib)


/// 在 xib 中设置 圆角相关属性
- (void)setCornerRadius:(NSInteger)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (NSInteger)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setBorderWidth:(NSInteger)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (NSInteger)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setMasksToBounds:(BOOL)bounds {
    self.layer.masksToBounds = bounds;
}

- (BOOL)masksToBounds {
    return self.layer.masksToBounds;
}


/// 快速加载 view 对应的 xib
+ (instancetype)lc_viewFromNib {
    
    NSArray *lists = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                                   owner:nil
                                                 options:nil];
    
    return lists.firstObject;
}

@end
