//
//  GoodsDetailsViewController.m
//  WholeCategory
//
//  Created by CYT on 2017/3/8.
//  Copyright © 2017年 CYT. All rights reserved.
//

#import "GoodsDetailsViewController.h"
#import "ListingCell.h"
#import "GoodsModel.h"
#import "MJRefresh.h"
#import "DrainageGraphicModel.h"

#import "DrainageGraphicCell.h"


@interface GoodsDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSInteger page;

    NSInteger page1;

}

@property (nonatomic,strong) UIView *selectV;

@property (nonatomic,strong) UIButton *selectButton;

@property (nonatomic,strong) UIWebView *productIntroductionView;//商品简介

@property (nonatomic,strong) UITableView *drainageGraphicTableView;//引流图文

@property (nonatomic,strong) NSMutableArray *drainageGraphicArr;

@property (nonatomic,strong) UITableView *listingTableView;  //清单

@property (nonatomic,strong) NSMutableArray *dataArr;//清单数据

@property (nonatomic,assign) BOOL isList;

@end

@implementation GoodsDetailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    page = 1;
    
    page1 = 1;
    
    _drainageGraphicArr = [NSMutableArray array];
    
    _dataArr = [NSMutableArray array];
    
    self.navigationItem.title = @"商品详情";
    
    NSArray *titleArr = @[@"商品简介",@"引流软文",@"转发图文"];
    
    _selectV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 2)];
    
    _selectV.backgroundColor = [RGBColor colorWithHexString:@"F5554A"];
    
    
    for (int i = 0; i < 3; i++) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(i * kScreenWidth/3, 64, kScreenWidth/3, 39);
        
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        
        button.tag = 100 + i;
        
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [button setTitleColor:[RGBColor colorWithHexString:@"#cccccc"] forState:UIControlStateNormal];
        
        [button setTitleColor:[RGBColor colorWithHexString:@"#ffffff"] forState:UIControlStateSelected];
        
        button.backgroundColor = [RGBColor colorWithHexString:@"4A4C57"];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            
            button.selected = YES;
            
            _selectButton = button;
            
            [button addSubview:_selectV];
            
            _selectV.center = button.center;
            
            _selectV.top = 37;
            
        }
        
        [self.view addSubview:button];
        
    }
    
    [self creatProductIntroductionView];
    

}
//商品简介
- (void)creatProductIntroductionView{

 
    _productIntroductionView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 103, kScreenWidth, kScreenHeight - 103)];
    
    [_productIntroductionView setUserInteractionEnabled:YES];//是否支持交互
    
    
    [_productIntroductionView setScalesPageToFit:YES];//自动缩放以适应屏幕
    
    [_productIntroductionView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_model.detail_url]]];
    
    [self.view addSubview:_productIntroductionView];
    
    

}
//引流图文
- (void)creatDrainageGraphicTableView{

    _drainageGraphicTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 103, kScreenWidth, kScreenHeight - 103) style:UITableViewStyleGrouped];
    
    _drainageGraphicTableView.delegate = self;
    
    _drainageGraphicTableView.dataSource = self;
    
    [self.view addSubview:_drainageGraphicTableView];
    
//    [_listingTableView registerNib:[UINib nibWithNibName:@"DrainageGraphicCell" bundle:nil] forCellReuseIdentifier:@"DrainageGraphicCell"];
    
    
    //下拉刷新
    
    
    _drainageGraphicTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        page1 = 1;
        
        [self loadData];
        
    }];
    
    //上拉加载
    
    _listingTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        page1 ++;
        
        [self loadData];
        
    }];



}


//清单
- (void)creatlistingTableView{
    
    _listingTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 103, kScreenWidth, kScreenHeight - 103) style:UITableViewStyleGrouped];
    
    _listingTableView.delegate = self;
    
    _listingTableView.dataSource = self;
    
    [self.view addSubview:_listingTableView];
    
    [_listingTableView registerNib:[UINib nibWithNibName:@"ListingCell" bundle:nil] forCellReuseIdentifier:@"ListingCell"];
    
    
    //下拉刷新
    
    
    _listingTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        page = 1;
        
        [self loadData];
        
        
    }];
    
    
    //上拉加载
    
    _listingTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        page ++;
        
        [self loadData];
        
    }];
    
    
    
}

//选择顶部视图
- (void)buttonAction:(UIButton*)bt{
    
    if (bt.selected == NO) {
        
        bt.selected = YES;
        
        [bt addSubview:_selectV];
        
        _selectButton.selected = NO;
        
        _selectButton = bt;
        
        if (bt.tag == 100) {
            
            _productIntroductionView.hidden = NO;
            
            _drainageGraphicTableView.hidden = YES;
            
            _listingTableView.hidden = YES;
            
        }else if(bt.tag == 101){
            
            _isList = NO;
            
            _productIntroductionView.hidden = YES;
            
            _drainageGraphicTableView.hidden = NO;
            
            _listingTableView.hidden = YES;
            
            if (_drainageGraphicTableView == nil) {
                
                [self creatDrainageGraphicTableView];
                
            }
            
            if (_drainageGraphicArr.count == 0) {
                
                [self loadData];
            }
            
            
        }else if (bt.tag == 102){
            
            _isList = YES;

            
            if (_listingTableView == nil) {
                
                [self creatlistingTableView];
                
            }
            
            if (_dataArr.count == 0) {
                
                [self loadData];
            }
            
            _productIntroductionView.hidden = YES;
            
            _drainageGraphicTableView.hidden = YES;
            
            _listingTableView.hidden = NO;
            
            
        }
        
    }
    
}


//加载数据
- (void)loadData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    
    NSString *url = @"";
    
    if (_isList) {
        
        url = get_goods_news_list;
        
        [params setObject:[NSString stringWithFormat:@"%ld",page] forKey:@"page"];
        
    }else{
    
        url = get_advertorial_list;
        
        [params setObject:[NSString stringWithFormat:@"%ld",page1] forKey:@"page"];
    
    }
    
    [params setObject:_model.good_id forKey:@"goods_id"];
    
    [DataSeviece requestUrl:url params:params HidHUD:NO success:^(id result) {
        
        NSLog(@"%@",result);
        
        if (_isList) {
            
            if (page == 1) {
                
                [_dataArr removeAllObjects];
                
            }
            
            for (NSDictionary *dic in result[@"item"]) {
                
                GoodsModel *model = [[GoodsModel alloc]initWithContentsOfDic:dic];
                
                model.list_id = dic[@"id"];
                
                CalculateHeightModel *calculateHeightModel = [[CalculateHeightModel alloc]init];
                
                calculateHeightModel.model = model;
                
                [_dataArr addObject:calculateHeightModel];
            }
            
            [_listingTableView.mj_header endRefreshing];
            
            [_listingTableView.mj_footer endRefreshing];
            
            [_listingTableView reloadData];
     
        
        }else{
            
            if (page1 == 1) {
                
                [_drainageGraphicArr removeAllObjects];
                
            }
            
            for (NSDictionary *dic in result[@"item"]) {
                
                DrainageGraphicModel *model = [[DrainageGraphicModel alloc]initWithContentsOfDic:dic];
                
                model.list_id = dic[@"id"];
                
                CalculateHeightModel *calculateHeightModel = [[CalculateHeightModel alloc]init];
                
                calculateHeightModel.model1 = model;
                
                [_drainageGraphicArr addObject:calculateHeightModel];
            }
            
            [_drainageGraphicTableView.mj_header endRefreshing];
            
            [_drainageGraphicTableView.mj_footer endRefreshing];
            
            [_drainageGraphicTableView reloadData];
            
        }
        
    }];
    
}



#pragma mark --UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (_isList) {
        
        return _dataArr.count;

    }else{
    
        return _drainageGraphicArr.count;
    }
    
    return 0;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (_isList) {
        
        ListingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListingCell" forIndexPath:indexPath];
        
        
        cell.model = _dataArr[indexPath.section];
        
        cell.backBlock = ^(){
            
            page = 1;
            
            [self loadData];
            
        };

        return cell;
        
    }else{
        
//        DrainageGraphicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DrainageGraphicCell" forIndexPath:indexPath];
//        
//        
//        cell.model = _drainageGraphicArr[indexPath.section];
//        
//        return cell;
        
        
        
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DrainageGraphicCell" forIndexPath:indexPath];
//        UIImageView *imgV = [[UIImageView alloc] init];
//        
//        imgV.frame = CGRectMake(12, 0, kScreenWidth - 81, 180);
//        
//        imgV.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1/1.0];
//        
//        [cell.contentView addSubview:imgV];
//        
//        UILabel *label = [[UILabel alloc] init];
//        
//        label.frame = CGRectMake(12, kScreenWidth - 81, 0, 70);
//        
//        label.numberOfLines = 0;
//
//        label.font = [UIFont systemFontOfSize:14];
//        
//        label.textColor = [UIColor colorWithRed:99/255.0 green:101/255.0 blue:112/255.0 alpha:1/1.0];
//        
//        [cell.contentView addSubview:label];

    
    }
    
    
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (_isList) {
       
        CalculateHeightModel *calculateHeightModel = _dataArr[indexPath.section];
        
        return calculateHeightModel.cellHeight;
        
    }else{
    
        return 300;
    }
    
    return 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    
    return 8;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 0.00001f;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}



@end
