//
//  UIButton+LCBase.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (LCBlock)

/**
 为按钮添加 block 方式点击回调

 @param block 点击执行的代码
 */
- (void)lc_addTouchUpInsideBlock:(void(^)(UIButton *btn))block;

@end

NS_ASSUME_NONNULL_END
