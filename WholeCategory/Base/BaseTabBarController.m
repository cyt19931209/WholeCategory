//
//  BaseTabViewController.m
//  Weibo55
//
//  Created by phc on 15/12/1.
//  Copyright (c) 2015年 phc. All rights reserved.
//

#import "BaseTabBarController.h"
@interface BaseTabViewController ()


@property (nonatomic,strong) UIImageView *selectImageV;

@end

@implementation BaseTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
     *  1.加载子控制器
     */
    
    [self creactSubC];
    
    [self creactTabBar];
}

- (void)creactSubC{
    
    UIStoryboard *ShowS =  [UIStoryboard storyboardWithName:@"Show" bundle:nil];
    UIStoryboard *CommunityS =  [UIStoryboard storyboardWithName:@"Community" bundle:nil];
    UIStoryboard *FindS =  [UIStoryboard storyboardWithName:@"Find" bundle:nil];
    UIStoryboard *MyS =  [UIStoryboard storyboardWithName:@"My" bundle:nil];
    
    NSArray *viewC = @[
                     [ShowS instantiateInitialViewController],
                     [CommunityS instantiateInitialViewController],
                     [FindS instantiateInitialViewController],
                     [MyS instantiateInitialViewController],
                       ];
    
   
    self.viewControllers = viewC;
    
    
}

- (void)creactTabBar{
    
    
    
    //设置背景
    UIImageView * tabaImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, -6, kScreenWidth, 55)];
    tabaImg.backgroundColor = [RGBColor colorWithHexString:@"#f6f6f6"];
    [self.tabBar addSubview:tabaImg];
    tabaImg.layer.borderColor = [RGBColor colorWithHexString:@"#dddddd"].CGColor;
    tabaImg.layer.borderWidth = 1;
    NSArray *imgArr = @[
                        @"show_grey_icon.png",
                        @"community_icon.png",
                        @"find_icon.png",
                        @"my_icon.png",
                        ];
    float itemWidth = kScreenWidth/4;
    
    for (int i = 0; i< imgArr.count; i ++) {
        
        NSString *imgName = imgArr[i];
//        NSString *selectImgName = selectImgArr[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*itemWidth, 2, itemWidth, 45);
//        [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:selectImgName] forState:UIControlStateSelected];
        button.tag = 1000 + i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:button];
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        imageV.image = [UIImage imageNamed:imgName];
        imageV.tag = 1100+i;
        imageV.center = button.center;
        [self.tabBar addSubview:imageV];
        if (i == 0) {
            _selectImageV = imageV;
            imageV.image = [UIImage imageNamed:@"show_red_icon.png"];
        }
    }
    
    
    
}

- (void)buttonAction:(UIButton*)bt{
    
    self.selectedIndex = bt.tag-1000;

    NSArray *imgArr = @[
                        @"show_grey_icon.png",
                        @"community_icon.png",
                        @"find_icon.png",
                        @"my_icon.png",
                        ];
    NSArray *selectImgArr = @[
                              @"show_red_icon.png",
                              @"community_red_icon.png",
                              @"find_red_icon.png",
                              @"my_red_icon.png"
                              ];
    UIImageView *imageV = [self.tabBar viewWithTag:bt.tag+100];
    if (imageV != _selectImageV) {
        
    imageV.image = [UIImage imageNamed:selectImgArr[bt.tag-1000]];
    _selectImageV.image = [UIImage imageNamed:imgArr[_selectImageV.tag-1100]];
    _selectImageV = imageV;
    }
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self removeTaBarButton];
    
}

- (void)removeTaBarButton{
    
    for (UIView *view in self.tabBar.subviews) {
        if([view isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            
            [view removeFromSuperview];
        }
    }
    
}
@end
