//
//  NSString+LCBase.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LCBase)


/**
 判断字符串是否为空
 */
+ (BOOL)lc_isNull:(NSString *)str;


/**
 MD5 加密 - 32位小写
 */
- (NSString *)lc_md5;


/**
 版本比较
 @return    0 : 版本号相等    -1 : self < newV      1 : self > newV
 */
- (NSInteger)lc_versionComparison:(NSString *)newV;


/**
 计算 字符串 size

 @param font    字号
 @param lineS   行间距
 @param maxW    最大宽度
 */
- (CGSize)lc_sizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineS maxWith:(CGFloat)maxW;



@end

NS_ASSUME_NONNULL_END
