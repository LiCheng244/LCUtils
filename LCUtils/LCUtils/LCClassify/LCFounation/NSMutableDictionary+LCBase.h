//
//  NSMutableDictionary+LCBase.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (LCBase)


/**
 字典转 json 字符串
 */
- (NSString *)lc_toJsonString;
    
@end

NS_ASSUME_NONNULL_END
