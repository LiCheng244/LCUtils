//
//  UIViewController+LCBase.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (LCBase)


/**
 获取当前根视图控制器
 
 @return 根视图控制器
 */
+ (instancetype)lc_currentRootController;



/**
 切换控制器
 
 @param viewVC  控制器
 */
- (void)lc_presentViewController:(UIViewController *)viewVC;


/**
 弹出一个半透明的控制器
 
 @param viewVC  控制器
 @param alpha   透明度 0-1
 */
- (void)lc_presentViewController:(UIViewController *)viewVC alpha:(CGFloat)alpha;


@end

NS_ASSUME_NONNULL_END
