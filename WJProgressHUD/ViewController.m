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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [WJProgressHUD showIndicatorHudInView:self.view];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
