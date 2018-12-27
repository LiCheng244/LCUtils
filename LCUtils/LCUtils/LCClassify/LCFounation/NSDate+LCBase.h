//
//  NSDate+LCBase.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (LCBase)


/**
 根据给定的日期格式生成当前时间格式化字符串
 
 @param format      时间格式 例如：'YY-MM-DD HH:MM:SS'
 */
+ (NSString *)lc_currentDateWithFormat:(NSString *)format;


/**
 传给后台的时间字符串
 */
+ (NSString *)lc_currentDateStr;


/**
 将时间戳转换成时间格式
 
 @param timestamp 时间戳
 */
+ (NSString *)lc_timeWithTimestamp:(NSString *)timestamp ;

/**
 判断是否是今天
 */
- (BOOL)lc_isToday;


/**
 获取当前时间的时间戳
 */
+ (NSInteger)lc_getTimestamp;

/**
 获取当前小时
 */
+ (NSInteger)lc_hour;


/**
 获取当前分
 */
+ (NSInteger)lc_minute;

/**
 获取当前天
 */
+ (NSInteger)lc_day;

/**
 获取当前秒
 */
+ (NSInteger)lc_second;

@end

NS_ASSUME_NONNULL_END
