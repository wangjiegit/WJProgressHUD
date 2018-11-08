//
//  WJProgressHUD.m
//  TeBaoBao
//
//  Created by 王杰 on 2018/11/2.
//  Copyright © 2018年 tebaobao. All rights reserved.
//

#import "WJProgressHUD.h"
#import <objc/runtime.h>

@interface UIView (WJHUD)

@property (nonatomic, strong) WJProgressHUD *hud_wj;

@end

@implementation UIView (WJHUD)

- (void)setHud_wj:(WJProgressHUD *)hud_wj {
    objc_setAssociatedObject(self, @selector(hud_wj), hud_wj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (WJProgressHUD *)hud_wj {
    return objc_getAssociatedObject(self, _cmd);
}

@end

/////////////////////////////////////////////////////////////////////////////

@implementation WJProgressHUD

+ (void)showTextHud:(NSString *)text inView:(UIView *)view {
    [self removeHUDForView:view];
    WJProgressHUD *hud = [[[self class] alloc] initWithFrame:view.bounds];
    hud.userInteractionEnabled = NO;
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    bgView.layer.cornerRadius = 5;
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.text = text;
    messageLabel.font = [UIFont boldSystemFontOfSize:14];
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.numberOfLines = 0;
    messageLabel.clipsToBounds = YES;
    CGSize size = [messageLabel sizeThatFits:CGSizeMake(hud.frame.size.width - 70, CGFLOAT_MAX)];
    CGRect rect = [[UIApplication sharedApplication].keyWindow convertRect:CGRectMake(([UIScreen mainScreen].bounds.size.width - size.width - 30) / 2, ([UIScreen mainScreen].bounds.size.height - size.height - 20) / 2, size.width + 30, size.height + 20) toView:view];
    bgView.frame = rect;
    messageLabel.frame = CGRectMake(15, 10, rect.size.width - 30, rect.size.height - 20);
    [bgView addSubview:messageLabel];
    [hud addSubview:bgView];
    view.hud_wj = hud;
    [view addSubview:hud];
    [self performSelector:@selector(removeHUDForView:) withObject:view afterDelay:1.5];
}

+ (void)showProhibitIndicatorHudInView:(UIView *)view {
    [self showIndicatorInView:view userInteractionEnabled:YES];
}

+ (void)showIndicatorHudInView:(UIView *)view {
    [self showIndicatorInView:view userInteractionEnabled:NO];
}

+ (void)showIndicatorInView:(UIView *)view userInteractionEnabled:(BOOL)userInteractionEnabled {
    if (!view) return;
    [self removeHUDForView:view];
    [self performSelector:@selector(showIndicator:) withObject:@{@"view":view, @"userInteractionEnabled":@(userInteractionEnabled)} afterDelay:0.1];
}

+ (void)showIndicator:(NSDictionary *)dict {
    UIView *view = dict[@"view"];
    BOOL userInteractionEnabled = [[dict objectForKey:@"userInteractionEnabled"] boolValue];
    WJProgressHUD *hud = [[[self class] alloc] initWithFrame:view.bounds];
    hud.userInteractionEnabled = userInteractionEnabled;
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"loading_icon"];
    CGSize size = imageView.image.size;
    CGRect rect = [[UIApplication sharedApplication].keyWindow convertRect:CGRectMake(([UIScreen mainScreen].bounds.size.width - size.width) / 2, ([UIScreen mainScreen].bounds.size.height - size.height) / 2, size.width, size.height) toView:view];
    imageView.frame = rect;
    [hud addSubview:imageView];
    [view addSubview:hud];
    view.hud_wj = hud;
    //开启动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.duration = 0.8;
    animation.byValue = [NSNumber numberWithFloat:2 * M_PI];
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    [imageView.layer addAnimation:animation forKey:nil];
    
}

+ (void)removeHUDForView:(UIView *)view {
    [self cancelPreviousPerformRequestsWithTarget:self];
    if (view.hud_wj) {
        [view.hud_wj removeFromSuperview];
        view.hud_wj = nil;
    }
}

@end
