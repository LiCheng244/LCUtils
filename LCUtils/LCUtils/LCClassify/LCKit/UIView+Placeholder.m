//
//  UIView+Placeholder.m
//  LCUtils
//
//  Created by LiCheng on 2018/12/27.
//  Copyright © 2018 LiCheng. All rights reserved.
//

#import "UIView+Placeholder.h"
#import "objc/runtime.h"


@interface UIView ()

@property (nonatomic, strong) UIView *lc_placeholderV;

@end

@implementation UIView (Placeholder)

static void *strKey = &strKey;

- (void)setLc_placeholderV:(UIView *)lc_placeholderV {
    objc_setAssociatedObject(self, &strKey, lc_placeholderV, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)lc_placeholderV {
    return objc_getAssociatedObject(self, &strKey);
}

/// 显示占位图
- (void)lc_showPlaceholderViewWithMessage:(NSString *)message
                                  iconImg:(NSString *)iconImg
                              reloadBlock:(void (^)(void))reloadBlick {
    
    // 如果是UIScrollView及其子类，占位图展示期间禁止scroll
    BOOL originalScrollEnabled = NO; // 原本的scrollEnabled
    if ([self isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scrollView = (UIScrollView *)self;
        originalScrollEnabled = scrollView.scrollEnabled;   // 先记录原本的scrollEnabled
        scrollView.scrollEnabled = NO;          // 再将scrollEnabled设为NO
    }
    
    // 占位图
    if (self.lc_placeholderV) {
        [self.lc_placeholderV removeFromSuperview];
        self.lc_placeholderV = nil;
    }
    self.lc_placeholderV = [[UIView alloc] init];
    self.lc_placeholderV.backgroundColor = [UIColor lc_hexCodeColor:@"f4f5f7"];
    [self addSubview:self.lc_placeholderV];
    [self.lc_placeholderV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(self);
    }];
    
    // 图片
    UIImageView *iconImgV = [[UIImageView alloc] init];
    iconImgV.image = [UIImage imageNamed:iconImg];
    [self.lc_placeholderV addSubview:iconImgV];
    [iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(iconImgV.superview);
        make.centerY.mas_equalTo(iconImgV.superview).mas_offset(-80);
        make.size.mas_equalTo(CGSizeMake(325/2, 368/2));
    }];
    
    // 文字
    UILabel *mesgL = [[UILabel alloc] init];
    mesgL.font = [UIFont systemFontOfSize:16];
    mesgL.textColor = [UIColor lc_hexCodeColor:@"9090b0"];
    [self.lc_placeholderV addSubview:mesgL];
    mesgL.text = message;
    [mesgL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(mesgL.superview);
        make.top.mas_equalTo(iconImgV.mas_bottom).offset(30);
        make.height.mas_equalTo(30);
    }];
    
    // 加载按钮
    UIButton *reloadBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    reloadBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [reloadBtn setTitle:@"重新加载" forState:UIControlStateNormal];
    [reloadBtn setBackgroundImage:[UIImage imageNamed:@"remind_reload"] forState:(UIControlStateNormal)];
    [self.lc_placeholderV addSubview:reloadBtn];
    [reloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(reloadBtn.superview);
        make.top.mas_equalTo(mesgL.mas_bottom).mas_offset(30);
        make.size.mas_equalTo(CGSizeMake(250/2, 44));
    }];
    
    // 点击事件
    [reloadBtn lc_addTouchUpInsideBlock:^(UIButton *btn) {
        
        // 执行block回调
        if (reloadBlick) {
            reloadBlick();
        }
        
        // 移除
        [self.lc_placeholderV removeFromSuperview];
        self.lc_placeholderV = nil;
        
        // 复原UIScrollView的scrollEnabled
        if ([self isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.scrollEnabled = originalScrollEnabled;
        }
    }];
    reloadBtn.hidden = reloadBlick == nil ? YES : NO;
}


/// 显示网络错误占位图
- (void)lc_showNetworkErrorPlaceholderViewWithReloadBlock:(void(^)(void))reloadBlock {
    
    [self lc_showPlaceholderViewWithMessage:@"网络出问题了，稍后再试！" iconImg:@"remind_neterr" reloadBlock:^{
        if (reloadBlock) {
            reloadBlock();
        }
    }];
}


/// 显示无数据占位图
- (void)lc_showNoDataPlaceholderViewWithDataCount:(NSInteger)count {
    
    if (count > 0) {
        
        if (self.lc_placeholderV) {
            [self.lc_placeholderV removeFromSuperview];
            self.lc_placeholderV = nil;
        }
        // 复原UIScrollView的scrollEnabled
        if ([self isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)self;
            scrollView.scrollEnabled = YES;
        }
    } else {
        [self lc_showPlaceholderViewWithMessage:@"暂无相关数据！" iconImg:@"remind_nodata" reloadBlock:nil];
    }
}

@end

