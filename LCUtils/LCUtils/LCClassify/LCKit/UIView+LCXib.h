//
//  UIView+LCXib.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LCXib)


/// 在 xib 中设置 圆角相关属性
@property (assign,nonatomic) IBInspectable NSInteger cornerRadius;
@property (assign,nonatomic) IBInspectable BOOL      masksToBounds;
@property (assign,nonatomic) IBInspectable NSInteger borderWidth;
@property (strong,nonatomic) IBInspectable UIColor   *borderColor;


/**
 快速加载 view 对应的 xib

 */
+ (instancetype)lc_viewFromNib;


@end

NS_ASSUME_NONNULL_END
