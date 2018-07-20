//
//  AliPayTopCell.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AliPayTopCell : UICollectionViewCell

/** <#name#> */
@property (nonatomic, strong) UILabel *titleLab;
/** <#name#> */
@property (nonatomic, strong) UIView *bottomView;

- (void)updateTitleData:(NSString *)data;


@end
