//
//  FQLinkageTableView.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQGoodsListCell.h"


@protocol FQLinkageTableViewDelegate <NSObject>

- (void)scrollViewDidScrollForPositionY:(CGFloat)y;

@end

@interface FQLinkageTableView : UIView


@property (nonatomic, weak) id target;
@property (nonatomic, weak) id <FQLinkageTableViewDelegate>delegate;
@property (nonatomic, strong) UITableView * leftTbView;
@property (nonatomic, strong) UITableView * rightTbView;
@property (nonatomic, strong) FQGoodsListModel * goodsList;
- (void)reloadData;


@end
