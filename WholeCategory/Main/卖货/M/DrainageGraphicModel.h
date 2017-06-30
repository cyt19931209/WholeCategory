//
//  DrainageGraphicModel.h
//  WholeCategory
//
//  Created by CYT on 2017/3/9.
//  Copyright © 2017年 CYT. All rights reserved.
//

#import "BaseModel.h"

@interface DrainageGraphicModel : BaseModel



@property (nonatomic,copy) NSString *list_id;//条目id

@property (nonatomic,copy) NSString *content;//具体内容

@property (nonatomic,copy) NSString *title;//标题

@property (nonatomic,copy) NSString *goods_group_id;//商品组id

@property (nonatomic,copy) NSString *goods_id;//对应的货物id

@property (nonatomic,strong) NSDictionary *first_img;//头图


@end

