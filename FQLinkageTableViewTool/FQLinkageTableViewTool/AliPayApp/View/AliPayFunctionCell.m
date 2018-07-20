//
//  AliPayFunctionCell.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AliPayFunctionCell.h"

@interface AliPayFunctionCell()

/** <#name#> */
@property (nonatomic, strong) UIImageView *iconImageView;
/** <#name#> */
@property (nonatomic, strong) UILabel *titleLab;



@end

@implementation AliPayFunctionCell

- (int)getRandomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to - from + 1)));
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        NSArray *array = @[@"icon_basketball",@"icon_clothes",@"icon_football",@"icon_mouth",@"icon_shoes"];
        int i = [self getRandomNumber:0 to:(int)array.count-1];
        NSString *str = array[i];
        _iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:str]];
        [self addSubview:_iconImageView];
        
        _titleLab = [[UILabel alloc]init];
        NSArray *array1 = @[@"充值中心",@"转账",@"蚂蚁森林",@"共享单车",@"生活缴费"];
        int y = [self getRandomNumber:0 to:(int)array1.count-1];
        NSString *textStr = array1[y];
        _titleLab.text = textStr;
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:_titleLab];

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(5);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.iconImageView);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-5);
        make.top.mas_equalTo(self.iconImageView.mas_bottom).offset(10);
        make.left.mas_equalTo(self.mas_left);
    }];
    
}




@end
