//
//  FQGoodsIndexCell.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FQGoodsGroupModel;

@interface FQGoodsIndexCell : UITableViewCell

/** <#name#> */
@property (nonatomic, strong) UILabel *titleLab;

@property (strong, nonatomic) FQGoodsGroupModel *goodsGroup;


@end
