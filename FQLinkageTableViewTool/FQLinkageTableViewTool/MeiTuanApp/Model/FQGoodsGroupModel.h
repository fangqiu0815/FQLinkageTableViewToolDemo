//
//  FQGoodsGroupModel.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FQGoodsModel.h"

@interface FQGoodsGroupModel : NSObject

@property (nonatomic, copy) NSString *classesName;//分类
@property (nonatomic, strong) NSMutableArray <FQGoodsModel *> *goodsList;


@end
