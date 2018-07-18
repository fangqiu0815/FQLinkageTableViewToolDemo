//
//  MTShopListCell.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "MTShopListCell.h"

@interface MTShopListCell()

/** <#name#> */
@property (nonatomic, strong) UILabel *titleLab;
/** <#name#> */
@property (nonatomic, strong) UIImageView *iconImageView;
/** <#name#> */
@property (nonatomic, strong) UILabel *addressLab;
/** <#name#> */
@property (nonatomic, strong) UILabel *phoneLab;

@end

@implementation MTShopListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.addressLab];
        [self.contentView addSubview:self.phoneLab];

        [self addView];
    }
    return self;
}

- (void)addView
{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(5);
        make.width.mas_equalTo(130);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(10);
        make.top.mas_equalTo(self.iconImageView.mas_top);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.height.mas_equalTo(35);
    }];
    
    [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(10);
        make.bottom.mas_equalTo(self.iconImageView.mas_bottom);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.height.mas_equalTo(25);
    }];
    
    [self.phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(10);
        make.bottom.mas_equalTo(self.addressLab.mas_top);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.height.mas_equalTo(25);
    }];
    
    
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_meishi"]];
    }
    return _iconImageView;
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
