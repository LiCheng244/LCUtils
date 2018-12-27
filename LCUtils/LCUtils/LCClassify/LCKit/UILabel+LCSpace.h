//
//  UILabel+LCSpace.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (LCSpace)

/**
 改变 label 行间距
 
 @param space 间距离
 */
- (void)lc_changeLineSpace:(float)space;


/**
 修改 label 字间距
 
 @param space 间距离
 */
- (void)lc_changeWordSpace:(float)space;


/**
 改变字间距 行间距
 
 @param lineSpace 行间距
 @param wordSpace 字间距
 */
- (void)lc_changeLineSpace:(float)lineSpace wordSpace:(float)wordSpace;


@end

NS_ASSUME_NONNULL_END
