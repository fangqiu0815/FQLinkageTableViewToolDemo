//
//  MTShopHeaderView.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "MTShopHeaderView.h"

@interface MTShopHeaderView()

/** <#name#> */
@property (nonatomic, strong) UIImageView *iconBgView;
/** <#name#> */
@property (nonatomic, strong) UIImageView *iconView;
/** <#name#> */
@property (nonatomic, strong) UILabel *titleLab;
/** <#name#> */
@property (nonatomic, strong) UILabel *addressLab;
/** <#name#> */
@property (nonatomic, strong) UILabel *phoneLab;


@end

@implementation MTShopHeaderView

- (void)layoutSubviews{
    _iconView.layer.cornerRadius = _iconView.bounds.size.height/2.0;
    _iconView.layer.borderColor = [UIColor whiteColor].CGColor;
    _iconView.layer.borderWidth = 1;
    _iconView.layer.masksToBounds = YES;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.iconBgView];
        self.iconBgView.userInteractionEnabled = YES;
        [self.iconBgView addSubview:self.titleLab];
        [self.iconBgView addSubview:self.iconView];
        [self.iconBgView addSubview:self.addressLab];
        [self.iconBgView addSubview:self.phoneLab];
        
        [self addView];
    }
    return self;
}

- (void)addView
{
    [self.iconBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(0);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconBgView.mas_left).offset(10);
        make.bottom.mas_equalTo(self.iconBgView.mas_bottom).offset(-10);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(80);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(10);
        make.top.mas_equalTo(self.iconView.mas_top);
        make.right.mas_equalTo(self.iconBgView.mas_right).offset(-10);
        make.height.mas_equalTo(35);
    }];
    
    [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(10);
        make.bottom.mas_equalTo(self.iconView.mas_bottom);
        make.right.mas_equalTo(self.iconBgView.mas_right).offset(-10);
        make.height.mas_equalTo(25);
    }];
    
    [self.phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(10);
        make.bottom.mas_equalTo(self.addressLab.mas_top);
        make.right.mas_equalTo(self.iconBgView.mas_right).offset(-10);
        make.height.mas_equalTo(25);
    }];
    
}

- (UIImageView *)iconBgView
{
    if (!_iconBgView) {
        _iconBgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shop_goodslist_banner_bg"]];
    }
    return _iconBgView;
}

- (UIImageView *)iconView
{
    if (!_iconView) {
        _iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_meishi"]];
    }
    return _iconView;
}

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.text = @"美团外卖美团外卖美团外卖";
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.font = [UIFont systemFontOfSize:15];
    }
    return _titleLab;
}

- (UILabel *)addressLab
{
    if (!_addressLab) {
        _addressLab = [[UILabel alloc]init];
        _addressLab.text = @"地址：环岛路会展中心";
        _addressLab.textColor = [UIColor lightGrayColor];
        _addressLab.font = [UIFont systemFontOfSize:13];
    }
    return _addressLab;
}

- (UILabel *)phoneLab
{
    if (!_phoneLab) {
        _phoneLab = [[UILabel alloc]init];
        _phoneLab.text = @"电话：0592-88888888";
        _phoneLab.textColor = [UIColor lightGrayColor];
        _phoneLab.font = [UIFont systemFontOfSize:13];
    }
    return _phoneLab;
}




@end
