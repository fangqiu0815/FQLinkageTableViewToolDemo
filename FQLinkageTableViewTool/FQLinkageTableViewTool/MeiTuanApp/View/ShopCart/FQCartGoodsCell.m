//
//  FQCartGoodsCell.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FQCartGoodsCell.h"

@interface FQCartGoodsCell()



@end

@implementation FQCartGoodsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.nameL];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.stepperSuperView];
        
        [self addView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //下分割线
    CGContextSetStrokeColorWithColor(context, ([UIColor colorWithWhite:0.8 alpha:0.8]).CGColor);
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width, 0.4));
}

- (MTShopCountStepper *)stepper{
    if (!_stepper) {
        _stepper = [[MTShopCountStepper alloc]initWithFrame:CGRectZero];
        _stepper.style = FQCountStepperStyleShoppingCart;
    }
    return _stepper;
}

- (void)config:(FQGoodsModel *)goods{
    [self.stepperSuperView addSubview:self.stepper];
    [self.stepper countChangedBlock:^(NSInteger count) {
        if (goods) {
            goods.number = @(count);
            _priceLabel.text = [NSString stringWithFormat:@"￥%.2f",goods.shouldPayMoney];
            if ([_delegate respondsToSelector:@selector(stepper:valueChangedForCount:goods:)]) {
                [_delegate stepper:_stepper valueChangedForCount:count goods:goods];
            }
        }
    }];
    self.stepper.count = goods.number.integerValue;
    self.nameL.text = goods.goodsName;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%.2f",goods.shouldPayMoney];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)layoutSubviews{
    self.stepper.center = CGPointMake(_stepperSuperView.bounds.size.width/2.0, _stepperSuperView.bounds.size.height/2.0);
}


- (void)addView
{
    [self.nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(SCREEN_WIDTH/3);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.nameL);
        make.height.mas_equalTo(self.nameL);
        make.left.mas_equalTo(self.nameL.mas_right);
        make.width.mas_equalTo(SCREEN_WIDTH/3);
    }];
    
    [self.stepperSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.nameL);
        make.height.mas_equalTo(self.nameL);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20);
        make.left.mas_equalTo(self.priceLabel.mas_right);
    }];
    
}

- (UIView *)stepperSuperView
{
    if (!_stepperSuperView) {
        _stepperSuperView = [[UIView alloc]init];
    }
    return _stepperSuperView;
}

- (UILabel *)nameL
{
    if (!_nameL) {
        _nameL = [[UILabel alloc]init];
        _nameL.text = @"麻辣香菇";
        _nameL.textColor = [UIColor blackColor];
        _nameL.font = [UIFont systemFontOfSize:14];
    }
    return _nameL;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.text = @"￥23.00";
        _priceLabel.textColor = [UIColor redColor];
        _priceLabel.font = [UIFont systemFontOfSize:14];
    }
    return _priceLabel;
}



@end
