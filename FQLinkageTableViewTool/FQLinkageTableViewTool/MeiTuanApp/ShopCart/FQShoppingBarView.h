//
//  FQShoppingBarView.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/7/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FQShoppingBarView : UIView

@property (weak, nonatomic) IBOutlet UILabel *badgeLabel;
@property (weak, nonatomic) IBOutlet UIView *shoppingCartSuperView;
@property (weak, nonatomic) IBOutlet UIImageView *shoppingCartIcon;
@property (weak, nonatomic) IBOutlet UILabel *priceL;
@property (weak, nonatomic) IBOutlet UIButton *payBtn;
@property (weak, nonatomic) IBOutlet UIButton *cartBtn;

+ (FQShoppingBarView *)view;

- (void)updateBadgeValue:(NSInteger)value price:(float)price;




@end
