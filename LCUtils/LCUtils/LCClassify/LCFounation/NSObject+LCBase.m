//
//  NSObject+LCBase.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "NSObject+LCBase.h"
#import <objc/runtime.h>

@implementation NSObject (LCBase)

const char * kIvarsKey = "kIvarsKey";
const char * kPropertiesKey = "Properties";


/// 获取当前类成员变量
+ (NSArray *)lc_objIvars {
    
    // 0. 关联对象
    NSArray *associatedObj = objc_getAssociatedObject(self, kIvarsKey);
    if (associatedObj != nil) {
        return associatedObj;
    }
    
    // 1. 调用运行时， 获取成员变量
    unsigned int count = 0;
    Ivar *ivarsList = class_copyIvarList([self class], &count);
    
    // 2. 遍历成员变量， 获得成员变量名称
    NSMutableArray *ivars = [NSMutableArray array];
    for (unsigned int i = 0; i < count; i++) {
        
        Ivar ivar = ivarsList[i];
        const char *cName = ivar_getName(ivar);
        NSString *name = [NSString stringWithUTF8String:cName];
        
        [ivars addObject:name];
    }
    
    // 3. 释放运行时数组
    free(ivarsList);
    
    // 4. 关联对象
    objc_setAssociatedObject(self, kIvarsKey, ivars, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 5. 从关联对象中取结果
    return objc_getAssociatedObject(self, kIvarsKey);
}



/// 获取当前类属性列表
+ (NSArray *)lc_objProperties {
    
    
    // 0. 从‘关联对象’中获取对象属性，如果有值，直接返回
    
    /*
     方法: objc_getAssociatedObject  -  获取关联对象 动态添加的属性
     参数:
     1. 对象
     2. 动态属性的 key
     返回值:
     - 动态添加的属性列表
     */
    NSArray *associatedObj = objc_getAssociatedObject(self, kPropertiesKey);
    if (associatedObj != nil) {
        return associatedObj;
    }
    
    
    // 1. 调用运行时方法，获取类的属性
    
    /*
     方法:  class_copyXXXXList
     - Ivar : 成员变量
     - Method : 方法
     - Property : 属性
     - Protocol : 协议
     参数:
     - 要获取的类
     - 类属性的个数指针，用来保存 属性个数
     返回值:
     - 返回所有属性组成的数组, C语言中，数组的名称就是指向数组第一个元素的地址
     */
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    
    
    // 2. 变量数组，获取属性名
    NSMutableArray *properties = [NSMutableArray array];
    for (unsigned int i = 0; i < count; i++) {
        
        // 1> 从数组中取出属性
        objc_property_t property = propertyList[i];
        
        // 2> 从属性中取出属性名称 c语言字符串
        const char *cName = property_getName(property);
        
        // 3> C字符串 转 OC 字符串
        NSString *name = [NSString stringWithCString:cName encoding:(NSUTF8StringEncoding)];
        
        // 4> 添加到数组中
        [properties addObject:name];
    }
    
    
    // 3. 释放数组
    free(propertyList);
    
    
    // 4. 利用关联对象 动态添加属性
    
    /*
     方法: objc_setAssociatedObject  -  利用关联对象 动态添加属性
     参数
     1. 对象 self
     2. 动态添加属性的 key, 获取值的时候使用
     3. 动态添加的属性值
     4. 对象的引用关系
     */
    objc_setAssociatedObject(self, kPropertiesKey, properties, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
    // 4. 返回数组
    return objc_getAssociatedObject(self, kPropertiesKey);
}
@end
