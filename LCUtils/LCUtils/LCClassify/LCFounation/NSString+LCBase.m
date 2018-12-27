//
//  NSString+LCBase.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "NSString+LCBase.h"

#import <CommonCrypto/CommonDigest.h>


@implementation NSString (LCBase)


#pragma mark - ------ Public Methods ------

/// MD5加密
- (NSString *)lc_md5 {
    
    const char* input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}

/// 判断字符串是否为空
+ (BOOL)lc_isNull:(NSString *)str {
 
    if (str == nil || str == NULL || str.length == 0 ||
        [str isKindOfClass:[NSNull class]] ||
        [str isEqualToString:@"<null>"] ||
        [str isEqualToString:@"(null)"] ||
        [str isEqualToString:@"null"]) {
        return YES;
    } else {
        return NO;
    }
}

/// 版本比较
- (NSInteger)lc_versionComparison:(NSString *)newV {
    
    // 都为空  --  相等
    if (!self && !newV) {
        return 0;
    }
    
    // v1为空 v2不会空  --  v1 < v2
    if(!self && newV) {
        return -1;
    }
    
    // v2为空 v1 不为空  -- v1 > v2
    if (self && !newV) {
        return 1;
    }
    
    NSArray *v1Arr = [self componentsSeparatedByString:@"."];
    NSArray *v2Arr = [newV componentsSeparatedByString:@"."];
    
    NSInteger smallCount = (v1Arr.count > v2Arr.count) ? v2Arr.count : v1Arr.count;
    
    for (int i = 0; i < smallCount; i++) {
        
        NSInteger value1 = [v1Arr[i] integerValue];
        NSInteger value2 = [v2Arr[i] integerValue];
        
        if (value1 > value2) { // v1版本字段大于v2版本字段，返回1
            return 1;
            
        } else if (value1 < value2) {  // v2版本字段大于v1版本字段，返回-1
            return -1;
        }
        // 版本相等，继续循环。
    }
    
    // 版本可比较字段相等，则字段多的版本高于字段少的版本。
    if (v1Arr.count > v2Arr.count) {
        return 1;
    } else if (v1Arr.count < v2Arr.count) {
        return -1;
    } else {
        return 0;
    }
    
    return 0;
}


/// 字符串计算 size
- (CGSize)lc_sizeWithFont:(UIFont *)font lineSpacing:(CGFloat)lineS maxWith:(CGFloat)maxW {
    
    if (font == nil) {
        font = [UIFont systemFontOfSize:15];
    }
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment     = NSTextAlignmentLeft;
    paraStyle.lineSpacing   = lineS;
    paraStyle.headIndent    = 0;
    paraStyle.tailIndent    = 0;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    attrs[NSParagraphStyleAttributeName] = paraStyle;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    
    CGSize size = [self boundingRectWithSize:maxSize
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attrs
                                     context:nil].size;
    return size;
}

#pragma mark - ------ Private Methods ------


@end
