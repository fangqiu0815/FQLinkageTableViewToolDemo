//
//  FQShopCartModel.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FQShopBagModel.h"

@interface FQShopCartModel : NSObject

@property (nonatomic, assign) NSInteger goodsTotalNumber;//购物车商品总数
@property (nonatomic, assign) float totalPrice;
@property (nonatomic, strong) NSMutableArray <FQShopBagModel *>* bags;//购物袋
- (void)clear;


@end
