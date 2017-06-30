//
//  BaseNaViewController.m
//  Weibo55
//
//  Created by phc on 15/12/1.
//  Copyright (c) 2015年 phc. All rights reserved.
//

#import "BaseNaViewController.h"

@interface BaseNaViewController ()

@end

@implementation BaseNaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[RGBColor colorWithHexString:@"#ffffff"]}];
    self.navigationBar.barTintColor = [RGBColor colorWithHexString:@"#cc203c"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
