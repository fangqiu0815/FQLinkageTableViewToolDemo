//
//  FQCartFooter.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FQCartFooter.h"

@interface FQCartFooter()

/** <#name#> */
@property (nonatomic, strong) UILabel *titleLab;


@end

@implementation FQCartFooter


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLab];
        
        [self addView];
    }
    return self;
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
        _titleLab = [[UILabel alloc]init];
        _titleLab.text = @"数量有限，请尽快支付";
        _titleLab.textColor = [UIColor lightGrayColor];
        _titleLab.font = [UIFont systemFontOfSize:13];
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}



@end
