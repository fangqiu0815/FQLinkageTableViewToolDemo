//
//  FQGoodsModel.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FQGoodsModel : NSObject

/** 名字 */
@property (nonatomic, strong) NSString *goodsName;
/** 图片 */
@property (nonatomic, strong) NSString *goodsImage;
/** 价格 */
@property (nonatomic, strong) NSString *goodsPrice;
/** 应付款 */
@property (nonatomic, assign) float shouldPayMoney;
/** 购买个数 */
@property (nonatomic, strong) NSNumber *number;

@end
