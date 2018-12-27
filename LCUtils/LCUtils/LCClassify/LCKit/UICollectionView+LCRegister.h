//
//  UICollectionView+LCRegister.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (LCRegister)


/**
 注册 xib cell
 
 @param cellClass       cell 类
 */
- (void)lc_registerNibName:(Class)cellClass;


/**
 注册 xib cell
 
 @param cellClass       cell 类
 @param identifier      标示
 */
- (void)lc_registerNibName:(Class)cellClass reuseIdentifier:(NSString *)identifier;


/**
 注册 header
 */
- (void)lc_registerHeaderViewWithNibName:(Class)cellClass;


@end

NS_ASSUME_NONNULL_END
