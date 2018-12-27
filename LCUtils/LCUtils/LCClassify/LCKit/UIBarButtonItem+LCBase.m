//
//  UIBarButtonItem+LCBase.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "UIBarButtonItem+LCBase.h"

@implementation UIBarButtonItem (LCBase)




// 添加导航栏按钮
+ (UIBarButtonItem *)lc_barButtonWithImgName:(NSString *)imgName
                                      target:(id)target
                                      action:(SEL)action {
    
    UIImage *img = [[UIImage imageNamed:imgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return [[UIBarButtonItem alloc] initWithImage:img
                                            style:(UIBarButtonItemStylePlain)
                                           target:target
                                           action:action];
}


// 添加导航栏按钮
+ (UIBarButtonItem *)lc_barButtonWithTitle:(NSString *)title
                                             target:(id)target
                                             action:(SEL)action {
    
    return [[UIBarButtonItem alloc] initWithTitle:title
                                            style:UIBarButtonItemStyleDone
                                           target:target
                                           action:action];
}
@end
