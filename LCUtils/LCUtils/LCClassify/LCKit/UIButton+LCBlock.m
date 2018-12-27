//
//  UIButton+LCBase.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "UIButton+LCBlock.h"
#import "objc/runtime.h"

@interface UIButton ()

@property (nonatomic, copy) void(^lc_block)(UIButton *);

@end


@implementation UIButton(LCBlock)

- (void)setLc_block:(void (^)(UIButton *))lc_block {
    objc_setAssociatedObject(self, @selector(lc_block), lc_block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIButton *))lc_block {
    return objc_getAssociatedObject(self, @selector(lc_block));
}


- (void)onClick:(UIButton *)btn {
    
    if (self.lc_block) {
        self.lc_block(btn);
    }
}

- (void)lc_addTouchUpInsideBlock:(void (^)(UIButton *))block {
    
    self.lc_block = block;
    [self addTarget:self action:@selector(onClick:) forControlEvents:(UIControlEventTouchUpInside)];
}


@end
