//
//  FQGoodsIndexCell.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FQGoodsIndexCell.h"
#import "FQGoodsGroupModel.h"

@interface FQGoodsIndexCell()

/** <#name#> */
@property (nonatomic, strong) UIView *selectView;


@end

@implementation FQGoodsIndexCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLab];

        _selectView = [[UIView alloc]initWithFrame:self.bounds];
        _selectView.backgroundColor = [UIColor whiteColor];
        self.selectedBackgroundView = _selectView;
        
        UIView *liner = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 4, 13)];
        liner.backgroundColor = self.titleLab.textColor;
        [_selectView addSubview:liner];
        liner.center = CGPointMake(2, self.titleLab.center.y);
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.titleLab.font = selected?[UIFont boldSystemFontOfSize:15]:[UIFont systemFontOfSize:13];
}

- (void)setGoodsGroup:(FQGoodsGroupModel *)goodsGroup
{
    _goodsGroup = goodsGroup;
    [self refreshUI];
}

- (void)refreshUI{
    if (_goodsGroup) {
        self.titleLab.text = _goodsGroup.classesName;
    }
}

- (void)addView
{
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.centerY.mas_equalTo(self.contentView);
        make.top.left.mas_equalTo(0);
    }];
    
}

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 70, 40)];
        _titleLab.text = @"美团外卖美团外卖美团外卖";
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.numberOfLines = 2;
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.font = [UIFont systemFontOfSize:15];
    }
    return _titleLab;
}




@end
