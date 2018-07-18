//
//  FQShopBagModel.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FQShopBagModel.h"

@implementation FQShopBagModel

- (NSInteger)goodsNumber{
    __block NSInteger number = 0;
    if (_goodsArr.count) {
        [_goodsArr enumerateObjectsUsingBlock:^(FQGoodsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            number += obj.number.integerValue;
        }];
    }
    return number;
}

- (float)totalPrice{
    __block float price = 0;
    [_goodsArr enumerateObjectsUsingBlock:^(FQGoodsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        price += obj.goodsPrice.floatValue * obj.number.integerValue;
    }];
    return price;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _goodsArr = [NSMutableArray array];
    }
    return self;
}

//更新购物袋中的商品
- (void)updateGoods:(FQGoodsModel *)goods{
    NSInteger number = goods.number.integerValue;//购物袋中商品的数量
    if (number>0) {
        if (![_goodsArr containsObject:goods]) {
            [_goodsArr addObject:goods];
        }
    }else{
        if ([_goodsArr containsObject:goods]) {
            [_goodsArr removeObject:goods];
        }
    }
}

//清空购物袋
- (void)clear{
    [_goodsArr enumerateObjectsUsingBlock:^(FQGoodsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.number = @0;
    }];
    [_goodsArr removeAllObjects];
}


@end
