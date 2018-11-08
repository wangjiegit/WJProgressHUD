//
//  WJProgressHUD.h
//  TeBaoBao
//
//  Created by 王杰 on 2018/11/2.
//  Copyright © 2018年 tebaobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJProgressHUD : UIView

+ (void)showTextHud:(NSString *)text inView:(UIView *)view;

+ (void)showProhibitIndicatorHudInView:(UIView *)view;//禁止交互

+ (void)showIndicatorHudInView:(UIView *)view;//可以交互

+ (void)removeHUDForView:(UIView *)view;

@end
