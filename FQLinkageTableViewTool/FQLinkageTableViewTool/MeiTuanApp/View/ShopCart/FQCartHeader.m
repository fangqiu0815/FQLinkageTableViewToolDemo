//
//  FQCartHeader.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FQCartHeader.h"

@implementation FQCartHeader

- (void)drawRect:(CGRect)rect{
    self.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:0.8].CGColor;
    self.layer.borderWidth = 0.4;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.cleanBtn];
        [self addSubview:self.titleLab];

        [self addView];
    }
    return self;
}

- (void)addView
{
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3, 30));
    }];
    
    [self.cleanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(120, 30));
    }];
    
}

- (UIButton *)cleanBtn
{
    if (!_cleanBtn) {
        _cleanBtn = [[UIButton alloc]init];
        [_cleanBtn setTitle:@"清空" forState:0];
        [_cleanBtn setTitleColor:[UIColor lightGrayColor] forState:0];
        [_cleanBtn setImage:[UIImage imageNamed:@"shoplist_trash_icon"] forState:0];
        _cleanBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _cleanBtn;
}

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.text = @"购物车";
        _titleLab.textColor = [UIColor darkGrayColor];
        _titleLab.font = [UIFont systemFontOfSize:14];
    }
    return _titleLab;
}


@end
