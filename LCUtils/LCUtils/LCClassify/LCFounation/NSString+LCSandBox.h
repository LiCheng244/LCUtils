//
//  NSString+LCSandBox.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface NSString (LCSandBox)


/**
 获取Documents目录
 */
+ (NSString *)lc_documentPath;

/**
 获取拼接后的Documents目录
 */
- (NSString *)lc_appendDocumentsPath;



/**
 获取Cache目录
 */
+ (NSString *)lc_cachePath;

/**
 获取拼接后的Cache目录
 */
- (NSString *)lc_appendCachePath;



/**
 获取Tmp目录
 */
+ (NSString *)lc_tempPath;

/**
 获取拼接后的Tmp目录
 */
- (NSString *)lc_appendTmpPath;




@end

NS_ASSUME_NONNULL_END
