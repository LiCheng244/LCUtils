//
//  NSString+LCSandBox.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "NSString+LCSandBox.h"

@implementation NSString (LCSandBox)



/// 获取Documents目录
+ (NSString *)lc_documentPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

/// 获取拼接后的Documents目录
- (NSString *)lc_appendDocumentsPath {
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [self lastPathComponent];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    
    return filePath;
}



/// 获取Cache目录
+ (NSString *)lc_cachePath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

/// 获取拼接后的Cache目录
- (NSString *)lc_appendCachePath {
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [self lastPathComponent];
    NSString *filePath = [cachePath stringByAppendingPathComponent:fileName];
    
    return filePath;
}



/// 获取Tmp目录
+ (NSString *)lc_tempPath {
    return NSTemporaryDirectory();
}

/// 获取拼接后的Tmp目录
- (NSString *)lc_appendTmpPath {
    
    NSString *tmpPath = NSTemporaryDirectory();
    NSString *fileName = [self lastPathComponent];
    NSString *filePath = [tmpPath stringByAppendingPathComponent:fileName];
    
    return filePath;
}

@end
