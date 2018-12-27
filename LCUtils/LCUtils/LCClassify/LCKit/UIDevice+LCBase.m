//
//  UIDevice+LCBase.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "UIDevice+LCBase.h"

#import "sys/utsname.h"
#import <Security/Security.h>

@implementation UIDevice (LCBase)


/// app 名称
+ (NSString *)lc_appName {
    
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    return [infoDict objectForKey:@"CFBundleName"];
}


/// app 版本 例如: 1.0.1
+ (NSString *)lc_appVersion {
    
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    return [infoDict objectForKey:@"CFBundleShortVersionString"];
}


/// app build 号
+ (NSString *)lc_appBuild {
    
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    return [infoDict objectForKey:@"CFBundleVersion"];
}


/// app 唯一标识符
+ (NSString *)lc_appBundleId {
    
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    return [infoDict objectForKey:@"CFBundleIdentifier"];
}

/// 设备用户名称
+ (NSString *)lc_deviceUserName {
    
    UIDevice *device = [[UIDevice alloc] init];
    return device.name;
}

/// 设备类型
+ (NSString *)lc_deviceModel {
    
    UIDevice *device = [[UIDevice alloc] init];
    return device.model;
}

/// 设备系统版本
+ (NSString *)lc_systemVersion {
    
    UIDevice *device = [[UIDevice alloc] init];
    return device.systemVersion;
}

/// 系统名称
+ (NSString *)lc_systemName {
    
    UIDevice *device = [[UIDevice alloc] init];
    return device.systemName;
}

/// 设备唯一标示符
+ (NSString *)lc_UUID {
    
    NSString *strUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return strUUID;
}

/// 国家
+(NSString *)lc_country {
    
    NSLocale *locale = [NSLocale currentLocale];
    return [locale localeIdentifier];
}

/// 电量 -1:模拟器  0-1:真机
+(CGFloat)lc_batteryLevel {
    
    UIDevice *device = [UIDevice currentDevice];
    return [device batteryLevel];
}

/// 设备分辨率
+ (NSString *)lc_resolution {
    
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [UIScreen mainScreen].scale;
    
    CGFloat width = size.width * scale;
    CGFloat height = size.height * scale;
    
    return [NSString stringWithFormat:@"%.0f*%.0f", width, height];
}

/// 手机设备名称
+ (NSString *)lc_deviceName {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone5c";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone5c";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone5s";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone5s";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhoneSE";
    
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone7 Plus";
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone7";
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone7 Plus";
    
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad Mini 4";
    if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Mini 4";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    
    if ([deviceString isEqualToString:@"AppleTV2,1"])      return @"Apple TV 2";
    if ([deviceString isEqualToString:@"AppleTV3,1"])      return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV3,2"])      return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV5,3"])      return @"Apple TV 4";
    
    if ([deviceString isEqualToString:@"i386"])         return @"i386Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"x86_64Simulator";
    
    return deviceString;
}


@end
