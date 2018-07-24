//
//  LeftTableViewCell.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/24.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "LeftTableViewCell.h"

@interface LeftTableViewCell ()

@property (nonatomic, strong) UIView *leftView;

@end

@implementation LeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.leftView];
        
        [self addView];
    }
    return self;
}

- (void)addView
{
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(5);
    }];
    
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.equalTo(self.leftView.mas_right);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
    
}

- (UIView *)leftView
{
    if (!_leftView) {
        _leftView = [[UIView alloc]init];
        _leftView.backgroundColor = [UIColor blackColor];
    }
    return _leftView;
}

- (UILabel *)nameLab
{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc]init];
        _nameLab.numberOfLines = 0;
        _nameLab.textAlignment = NSTextAlignmentCenter;
        _nameLab.font = [UIFont systemFontOfSize:15];
        _nameLab.textColor = [UIColor darkGrayColor];
        _nameLab.highlightedTextColor = [UIColor redColor];
    }
    return _nameLab;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    
    self.contentView.backgroundColor = selected ? [UIColor whiteColor] : [UIColor colorWithWhite:0 alpha:0.1];
    self.highlighted = selected;
    self.nameLab.highlighted = selected;
    self.leftView.hidden = !selected;
}





@end
