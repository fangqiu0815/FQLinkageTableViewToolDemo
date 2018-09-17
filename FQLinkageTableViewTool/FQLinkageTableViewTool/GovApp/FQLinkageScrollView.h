//
//  FQLinkageScrollView.h
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/9/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

//点击菜单的回调方法
typedef void(^SelectColumnBlock)(NSInteger index);

@interface FQLinkageScrollView : UIView <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView * menuView; // 菜单列表
@property (strong, nonatomic) UIView * showLineView; // 当前菜单指示条
@property (assign, nonatomic) BOOL showLineAnimate;
@property (assign, nonatomic) NSInteger currentPageNumber; // 当前页码
//分割线
@property (strong, nonatomic) UIView * segmentingLine;

@property (strong, nonatomic) NSMutableArray *menuArray;
@property (strong, nonatomic) NSMutableArray *columnLabelArray; // 存储栏目label

@property (nonatomic, copy) SelectColumnBlock  selectColumnBlock;

//菜单字体的颜色大小
@property (nonatomic, strong) UIColor * currentColor;
@property (nonatomic, strong) UIColor * normalColor;
@property (nonatomic, strong) UIFont * currentFont;
@property (nonatomic, strong) UIFont * normalFont;


//创建菜单
- (void)createColumnMenuView;

// 调整菜单条的contengOffset
- (void)adjustMenuViewContenOffsetWithPageNumber:(NSInteger)index animate:(BOOL)isAnimate;

////指示条动画 根据视图外ScrollView的偏移量来计算指示条的位置
//- (void)showLineViewAnimate:(CGFloat)contentOffsetX;
//指示条动画 根据视图外ScrollView的偏移量和方向来动画的显示指示条的位置
- (void)showLineViewAnimate:(CGFloat)contentOffsetX direction:(NSString *)direction;

@end
