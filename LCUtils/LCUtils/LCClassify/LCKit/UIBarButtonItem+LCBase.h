//
//  UIBarButtonItem+LCBase.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (LCBase)

/**
 添加图片导航栏按钮
 
 @param imgName     图片名称
 @param target      响应
 @param action      事件
 */
+ (UIBarButtonItem *)lc_barButtonWithImgName:(NSString *)imgName
                                      target:(id)target
                                      action:(SEL)action;


/**
 添加文字导航栏按钮
 
 @param title       文字
 @param target      响应
 @param action      事件
 */
+ (UIBarButtonItem *)lc_barButtonWithTitle:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action;


@end

NS_ASSUME_NONNULL_END
