//
//  ViewController.m
//  WJProgressHUD
//
//  Created by 王杰 on 2018/11/7.
//  Copyright © 2018年 wangjie. All rights reserved.
//

#import "ViewController.h"
#import "WJProgressHUD.h"

@interface ViewController ()

@property (nonatomic) NSInteger i;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [WJProgressHUD showIndicatorHudInView:self.view];
//    [WJProgressHUD showIndicatorHudInView:self.view];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.i == 0) {
        [WJProgressHUD showTextHud:@"上传成功" inView:self.view];
    } else if (self.i == 1) {
        [WJProgressHUD showTextHud:@"上传成功上传成功上传成功上传成功上传成功上传成功上传成功上传成功" inView:self.view];
    } else {
        [WJProgressHUD showTextHud:@"上传成功" inView:self.view];
    }
    self.i++;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
