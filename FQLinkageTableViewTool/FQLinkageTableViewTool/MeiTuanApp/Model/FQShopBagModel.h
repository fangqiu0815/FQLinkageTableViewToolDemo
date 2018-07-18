//
//  FQShopBagModel.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FQGoodsModel.h"

@interface FQShopBagModel : NSObject

@property (nonatomic, copy) NSString * identifer;//购物袋编号
@property (nonatomic, assign) NSInteger goodsNumber;//购物袋商品数
@property (nonatomic, assign) float totalPrice;
@property (nonatomic, strong) NSMutableArray <FQGoodsModel *>* goodsArr;//商品

//更新购物袋中的商品
- (void)updateGoods:(FQGoodsModel *)goods;

- (void)clear;



@end



