//
//  FQGoodsListModel.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FQGoodsListModel.h"

@implementation FQGoodsListModel

- (instancetype)init{
    self = [super init];
    if (self) {
        _goodsGroups = [NSMutableArray array];
        _shoppingCart = [FQShopCartModel new];
    }
    return self;
}

- (NSInteger)sectionNumber{
    return self.goodsGroups.count;
}

- (void)setGoodsGroups:(NSMutableArray<FQGoodsGroupModel *> *)goodsGroups{
    _goodsGroups = goodsGroups;
    //初始化
    [_goodsGroups enumerateObjectsUsingBlock:^(FQGoodsGroupModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj.goodsList enumerateObjectsUsingBlock:^(FQGoodsModel * _Nonnull goods, NSUInteger goodsIdx, BOOL * _Nonnull stop) {
            if (goods.number.integerValue) {//数量>0则加入购物袋
                [_shoppingCart.bags.firstObject updateGoods:goods];
            }
        }];
    }];
}


@end
