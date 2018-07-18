//
//  MTSectionHeader.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "MTSectionHeader.h"

@interface MTSectionHeader()

/** <#name#> */
@property (nonatomic, strong) UILabel *nameLab;


@end

@implementation MTSectionHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.nameLab];
        self.backgroundColor = CUSTOMCOLOR(233, 233, 233);
        [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/2, 30));
        }];
    }
    return self;
}

- (UILabel *)nameLab
{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc]init];
        _nameLab.text = @"精品推荐";
        _nameLab.textColor = [UIColor darkGrayColor];
        _nameLab.font = [UIFont systemFontOfSize:13];
    }
    return _nameLab;
}

@end
