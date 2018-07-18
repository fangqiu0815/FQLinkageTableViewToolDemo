//
//  FQGoodsModel.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FQGoodsModel.h"

@implementation FQGoodsModel

- (float)shouldPayMoney{
    return self.goodsPrice.floatValue * self.number.integerValue;
}

@end
