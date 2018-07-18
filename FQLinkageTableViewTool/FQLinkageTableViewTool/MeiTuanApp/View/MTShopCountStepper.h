//
//  MTShopCountStepper.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTShopCartDefine.h"

@interface MTShopCountStepper : UIView

@property (nonatomic, strong) UIButton * subBtn;
@property (nonatomic, strong) UIButton * addBtn;
@property (nonatomic, strong) UILabel * numberL;

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) FQCountStepperStyle style;
- (void)countChangedBlock:(void(^)(NSInteger count))block;
- (void)addActionBlock:(void(^)(UIButton *))block;
- (void)subActionBlock:(void(^)(UIButton *))block;


@end
