//
//  FQGoodsListCell.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTShopCartDefine.h"

@interface FQGoodsListCell : UITableViewCell

@property (weak, nonatomic) id<FQGoodsNumberChangedDelegate>delegate;

@property (strong, nonatomic)  UIImageView *goodsImageV;

@property (strong, nonatomic)  UILabel *nameL;

@property (strong, nonatomic)  UILabel *priceL;

@property (strong, nonatomic)  UIView *stepperSuperView;

@property (strong, nonatomic) MTShopCountStepper * stepper;

@property (strong, nonatomic) FQGoodsModel * goods;


@end
