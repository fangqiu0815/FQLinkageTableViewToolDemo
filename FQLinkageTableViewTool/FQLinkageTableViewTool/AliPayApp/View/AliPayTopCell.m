//
//  AliPayTopCell.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AliPayTopCell.h"

@interface AliPayTopCell()


@end

@implementation AliPayTopCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = CUSTOMCOLOR(15, 113, 226);
        [self addSubview:_bottomView];
        
        _titleLab = [[UILabel alloc]init];
        _titleLab.text = @"";
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.highlightedTextColor = CUSTOMCOLOR(15, 113, 226);
        _titleLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:_titleLab];
        
    }
    return self;
}

- (void)updateTitleData:(NSString *)data
{
    self.titleLab.text = data;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    self.bottomView.backgroundColor = selected ? CUSTOMCOLOR(15, 113, 226) : [UIColor whiteColor];
    self.titleLab.highlighted = selected;
}


- (void)layoutSubviews
{
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(3);
        make.bottom.mas_equalTo(-3);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(3);
        make.bottom.mas_equalTo(self.bottomView.mas_top);
    }];
    
}




@end
