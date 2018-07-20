//
//  FQShoppingBar.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTShopCartDefine.h"
#import "FQShoppingBarView.h"

@class FQGoodsListModel;
@interface FQShoppingBar : UIView

@property (nonatomic, assign) FQShoppingBarStyle style;
@property (nonatomic, strong) FQGoodsListModel * goodsList;
@property (nonatomic, strong) FQShoppingCartView * cartView;
@property (nonatomic, strong) FQShoppingBarView * shoppingBarView;

+ (CGFloat)defaultHeight;

+ (instancetype)barWithStyle:(FQShoppingBarStyle)style showInView:(UIView *)view;

- (void)refreshCartBar;
- (void)reloadData;

@end
