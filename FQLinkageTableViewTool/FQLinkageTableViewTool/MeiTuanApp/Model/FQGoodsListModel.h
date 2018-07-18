//
//  FQGoodsListModel.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FQGoodsGroupModel.h"
#import "FQShopCartModel.h"

@interface FQGoodsListModel : NSObject

@property (nonatomic, assign) NSInteger sectionNumber;

@property (nonatomic, strong) NSMutableArray <FQGoodsGroupModel *>* goodsGroups;

@property (nonatomic, strong) FQShopCartModel * shoppingCart;//购物车


@end
