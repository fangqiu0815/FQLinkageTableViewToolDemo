//
//  FQShopCartModel.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FQShopCartModel.h"

@implementation FQShopCartModel

- (NSInteger)goodsTotalNumber{
    __block NSInteger number = 0;
    if (_bags.count) {
        [_bags enumerateObjectsUsingBlock:^(FQShopBagModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            number += obj.goodsNumber;
        }];
    }
    return number;
}

- (float)totalPrice{
    __block float price = 0;
    if (_bags.count) {
        [_bags enumerateObjectsUsingBlock:^(FQShopBagModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            price += obj.totalPrice;
        }];
    }
    return price;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        //暂时只生成一个购物袋
        FQShopBagModel * bag = [FQShopBagModel new];
        bag.identifer = @"1";
        _bags = [NSMutableArray arrayWithObjects:bag, nil];
    }
    return self;
}

- (void)clear{
    [self.bags enumerateObjectsUsingBlock:^(FQShopBagModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj clear];
    }];
}


@end
