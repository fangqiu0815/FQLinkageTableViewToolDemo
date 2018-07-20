//
//  FQGoodsListCell.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FQGoodsListCell.h"

@interface FQGoodsListCell()



@end

@implementation FQGoodsListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.nameL];
        [self.contentView addSubview:self.goodsImageV];
        [self.contentView addSubview:self.priceL];
        [self.contentView addSubview:self.stepperSuperView];

        [self addView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //下分割线
    CGContextSetStrokeColorWithColor(context, ([UIColor colorWithWhite:0.8 alpha:0.8]).CGColor);
    CGContextStrokeRect(context, CGRectMake(16, rect.size.height, rect.size.width, 0.4));
}

- (MTShopCountStepper *)stepper{
    if (!_stepper) {
        _stepper = [[MTShopCountStepper alloc]initWithFrame:CGRectZero];
    }
    return _stepper;
}

- (void)addView
{
    [self.goodsImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    [self.nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodsImageV.mas_right).offset(10);
        make.top.mas_equalTo(self.goodsImageV.mas_top);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.height.mas_equalTo(35);
    }];
    
    [self.priceL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameL);
        make.bottom.mas_equalTo(self.goodsImageV.mas_bottom);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    
    [self.stepperSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.priceL.mas_right);
        make.width.mas_equalTo(80);
        make.centerY.mas_equalTo(self.priceL);
        make.height.mas_equalTo(30);
    }];
    
    [self.stepperSuperView addSubview:self.stepper];
    [self.stepper countChangedBlock:^(NSInteger count) {
        if (_goods) {
            _goods.number = @(count);
            if ([_delegate respondsToSelector:@selector(stepper:valueChangedForCount:goods:)]) {
                [_delegate stepper:_stepper valueChangedForCount:count goods:_goods];
            }
        }
    }];
    __weak typeof(self) wself = self;
    [wself.stepper addActionBlock:^(UIButton * btn) {
        if ([wself.delegate respondsToSelector:@selector(stepper:addSender:cell:)]) {
            [wself.delegate stepper:wself.stepper addSender:btn cell:wself];
        }
    }];
    [wself.stepper subActionBlock:^(UIButton * btn) {
        if ([wself.delegate respondsToSelector:@selector(stepper:subSender:cell:)]) {
            [wself.delegate stepper:wself.stepper subSender:btn cell:wself];
        }
    }];
    
}

- (void)setGoods:(FQGoodsModel *)goods{
    _goods = goods;
    [self refreshUI];
}

- (void)layoutSubviews{
    self.stepper.center = CGPointMake(_stepperSuperView.bounds.size.width/2.0, _stepperSuperView.bounds.size.height/2.0);
}

- (void)refreshUI{
    if (!_goods) {
        return;
    }
    _nameL.text = _goods.goodsName;
    _priceL.text = [NSString stringWithFormat:@"￥%@",_goods.goodsPrice];
    _stepper.count = _goods.number.integerValue;
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
        _nameL.text = @"美团外卖美团外卖美团外卖";
        _nameL.textColor = [UIColor blackColor];
        _nameL.font = [UIFont systemFontOfSize:14];
    }
    return _nameL;
}

- (UILabel *)priceL
{
    if (!_priceL) {
        _priceL = [[UILabel alloc]init];
        _priceL.text = @"￥23.00";
        _priceL.textColor = [UIColor redColor];
        _priceL.font = [UIFont systemFontOfSize:14];
    }
    return _priceL;
}

- (UIImageView *)goodsImageV
{
    if (!_goodsImageV) {
        _goodsImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_meishi"]];
    }
    return _goodsImageV;
}



@end
