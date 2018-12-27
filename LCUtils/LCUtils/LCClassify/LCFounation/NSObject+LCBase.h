//
//  NSObject+LCBase.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LCBase)


/**
 获取当前类的成员变量列表
 */
+ (NSArray *)lc_objIvars;


/**
 获取当前类的属性列表
 */
+ (NSArray *)lc_objProperties;


@end

NS_ASSUME_NONNULL_END
