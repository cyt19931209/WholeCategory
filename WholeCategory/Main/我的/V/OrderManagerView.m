//
//  OrderManagerView.m
//  WholeCategory
//
//  Created by CYT on 2017/3/13.
//  Copyright © 2017年 CYT. All rights reserved.
//

#import "OrderManagerView.h"

@implementation OrderManagerView


- (void)setModel:(GoodModel *)model{

    _model = model;

    [_headImageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",imgUrl_API,_model.first_img_name]]];
    
    _titleLabel.text = _model.goods_name;

    _priceLabel.text = _model.total_price;
    
    _numLabel.text = [NSString stringWithFormat:@"x%@",_model.total_integral];
    
    
}



@end
