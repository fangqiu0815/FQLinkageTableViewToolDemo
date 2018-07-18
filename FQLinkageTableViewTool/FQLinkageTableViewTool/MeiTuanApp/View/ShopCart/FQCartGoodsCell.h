//
//  FQCartGoodsCell.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTShopCartDefine.h"


@interface FQCartGoodsCell : UITableViewCell

@property (weak, nonatomic) id<FQGoodsNumberChangedDelegate>delegate;
@property (nonatomic, strong) UILabel *nameL;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIView *stepperSuperView;
@property (nonatomic, strong) MTShopCountStepper * stepper;

- (void)config:(FQGoodsModel *)goods;


@end
