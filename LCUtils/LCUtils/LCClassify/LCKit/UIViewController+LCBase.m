//
//  UIViewController+LCBase.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "UIViewController+LCBase.h"

@implementation UIViewController (LCBase)


/// 获取当前根视图控制器
+ (instancetype)lc_currentRootController {
    
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

/// 切换控制器
- (void)lc_presentViewController:(UIViewController *)viewVC {
    
    [self presentViewController:viewVC animated:YES completion:nil];
}

/// 弹出一个半透明的控制器
- (void)lc_presentViewController:(UIViewController *)viewVC alpha:(CGFloat)alpha {
    
    UIViewController *vc =[UIViewController lc_currentRootController];
    vc.definesPresentationContext = YES;
    
    viewVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    viewVC.view.autoresizesSubviews = YES;
    
    [vc presentViewController:viewVC animated:YES completion:nil];
}


@end
