//
//  BaseBackViewController.m
//  RMXJY
//
//  Created by MacBooK on 16/3/7.
//  Copyright © 2016年 MacBooK. All rights reserved.
//

#import "BaseBackViewController.h"

@interface BaseBackViewController ()

@end

@implementation BaseBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [RGBColor colorWithHexString:@"#f6f6f6"];
    //返回按钮
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 25, 25);
    [leftButton setImage:[UIImage imageNamed:@"return_icon.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
}
//返回
- (void)backAction{
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
