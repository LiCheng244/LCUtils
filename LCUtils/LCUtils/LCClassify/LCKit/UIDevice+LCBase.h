//
//  UIDevice+LCBase.h
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (LCBase)



#pragma mark - ----- app 相关 -----

/**
 * app 名称
 */
+ (NSString *)lc_appName;


/**
 * app 版本 例如: 1.0.1
 */
+ (NSString *)lc_appVersion;


/**
 * app build 号
 */
+ (NSString *)lc_appBuild;


/**
 app 唯一标示符
 */
+ (NSString *)lc_appBundleId;



#pragma mark - ----- 设备相关 -----

/**
 * 手机设备名称
 */
+ (NSString *)lc_deviceName;


/**
 设备用户名称
 */
+ (NSString *)lc_deviceUserName;


/**
 设备类型
 */
+ (NSString *)lc_deviceModel;


/**
 系统版本
 */
+ (NSString *)lc_systemVersion;


/**
 系统名称
 */
+ (NSString *)lc_systemName;


/**
 设备唯一标示符
 */
+ (NSString *)lc_UUID;


/**
 国家
 */
+(NSString *)lc_country;


/**
 电量 -1:模拟器  0-1:真机
 */
+(CGFloat)lc_batteryLevel;


/**
 设备分辨率
 */
+ (NSString *)lc_resolution;


@end

NS_ASSUME_NONNULL_END
