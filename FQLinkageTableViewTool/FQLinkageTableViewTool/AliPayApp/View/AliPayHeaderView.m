//
//  AliPayHeaderView.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AliPayHeaderView.h"

@interface AliPayHeaderView()

/** <#name#> */
@property (nonatomic, strong) UILabel *titleLab;


@end

@implementation AliPayHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLab];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3, 30));
        }];
        
    }
    return self;
}

- (void)updateDataWithStr:(NSString *)str
{
    self.titleLab.text = str;
}

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.text = @"";
        _titleLab.font = [UIFont systemFontOfSize:15 weight:10];
        _titleLab.textColor = [UIColor blackColor];
    }
    return _titleLab;
}


@end
