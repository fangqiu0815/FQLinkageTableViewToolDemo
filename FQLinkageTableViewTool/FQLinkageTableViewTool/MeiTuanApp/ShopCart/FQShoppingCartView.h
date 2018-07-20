//
//  FQShoppingCartView.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQCartHeader.h"
#import "FQCartFooter.h"
@class  FQGoodsListModel;

@interface FQShoppingCartView : UIView

@property (nonatomic, assign)BOOL shown;
@property (nonatomic, weak)id target;
@property (nonatomic, strong) FQGoodsListModel * goodsList;
@property (nonatomic, strong) FQCartHeader * header;
@property (nonatomic, strong) FQCartFooter * footer;
@property (nonatomic, strong) UITableView * tableView;

- (void)show;
- (void)dismiss;
- (void)reloadData;


@end
