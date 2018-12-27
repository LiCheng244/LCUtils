//
//  NSString+LCRegExp.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LCRegExp)


/// 是否是手机号
- (BOOL)lc_isMobile;

/// 是否是邮箱
- (BOOL)lc_isMail;

/// 是否只有中文
- (BOOL)lc_isOnlyChinese;

/// 是否只有数字
- (BOOL)lc_isOnlyNumber;

/// 是否是身份证
- (BOOL)lc_isIDCard;

/// 是否是银行卡号
- (BOOL)lc_isBankCard;

@end

NS_ASSUME_NONNULL_END
