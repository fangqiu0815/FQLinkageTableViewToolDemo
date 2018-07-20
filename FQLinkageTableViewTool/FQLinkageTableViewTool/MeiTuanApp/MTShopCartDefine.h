//
//  MTShopCartDefine.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#ifndef MTShopCartDefine_h
#define MTShopCartDefine_h

#import "FQGoodsListModel.h"
@class MTShopCountStepper;

//stepper风格
typedef NS_ENUM(NSInteger,FQCountStepperStyle) {
    FQCountStepperStyleGoodsList,//商品列表中的
    FQCountStepperStyleShoppingCart,//购物车中的
};

//购物栏风格
typedef NS_ENUM(NSInteger, FQShoppingBarStyle) {
    FQShoppingBarStyleDefault,
};

@protocol FQGoodsNumberChangedDelegate <NSObject>

- (void)stepper:(MTShopCountStepper *)stepper valueChangedForCount:(NSInteger)count goods:(FQGoodsModel *)goods;

- (void)stepper:(MTShopCountStepper *)stepper addSender:(UIButton *)sender cell:(UITableViewCell *)cell;

- (void)stepper:(MTShopCountStepper *)stepper subSender:(UIButton *)sender cell:(UITableViewCell *)cell;

@end

#import "MTShopCountStepper.h"
#import "FQShoppingCartView.h"


#endif /* MTShopCartDefine_h */
