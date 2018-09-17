//
//  FQLinkageScrollView.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/9/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FQLinkageScrollView.h"

@interface FQLinkageScrollView ()

@property (nonatomic, strong) NSMutableArray *columnLabelWidthArray;
@property (nonatomic, strong) NSMutableArray *columnLabelXArray;
@property (nonatomic, assign) CGFloat lastContentOffsetX;

@end

@implementation FQLinkageScrollView

- (void)drawRect:(CGRect)rect{
    [self createColumnMenuView];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        _currentPageNumber = 0;
        _columnLabelArray = [NSMutableArray array];
        _columnLabelWidthArray = [NSMutableArray array];
        _columnLabelXArray = [NSMutableArray array];
    }
    return self;
}

#pragma mark -- Help Methods
/*
 菜单contentSize最前最后有10px距离屏幕边
 每个项之间间隔10px
 */
- (void)createColumnMenuView {
    if (_currentPageNumber < 0) {
        _currentPageNumber = 0;
    }
    
    [_columnLabelArray removeAllObjects];
    for (UIView *subview in self.menuView.subviews) {
        [subview removeFromSuperview];
    }
    [self.columnLabelWidthArray removeAllObjects];
    [self.columnLabelXArray removeAllObjects];
    
    // 菜单条
    self.menuView = [[UIScrollView alloc] init];
    self.menuView.delegate = self;
    self.menuView.showsHorizontalScrollIndicator = NO;
    self.menuView.showsVerticalScrollIndicator = NO;
    [self addSubview:self.menuView];
    self.menuView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    self.showLineView = [[UIView alloc] init];
    self.showLineView.backgroundColor = [UIColor colorWithRed:0/255.0 green:85/255.0 blue:142/255.0 alpha:1.0];
    [self.menuView bringSubviewToFront:self.showLineView];
    [self.menuView addSubview:self.showLineView];
    
    self.segmentingLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 1)];
    self.segmentingLine.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
    [self addSubview:self.segmentingLine];
    
    NSInteger leftX = 10;
    NSInteger key = 0;
    
    for(NSString * menuStr in self.menuArray) {
        CGFloat labelWidth = [self contentLabelWidthWithText:menuStr labelHeight:self.frame.size.height font:self.currentFont paragraphStyle:nil];
        UILabel *columnLabel = [[UILabel alloc] init];
        columnLabel.textAlignment = NSTextAlignmentCenter;
        columnLabel.text = menuStr;
        columnLabel.tag = key;
        columnLabel.userInteractionEnabled = YES;
        [self.menuView addSubview:columnLabel];
        columnLabel.frame = CGRectMake(leftX, 0, labelWidth, self.frame.size.height);
        
        [_columnLabelArray addObject:columnLabel];
        
        [self.columnLabelWidthArray addObject:@(labelWidth)];
        [_columnLabelXArray addObject:@(leftX)];
        
        if (_currentPageNumber == key) {
            columnLabel.font = self.currentFont;
            columnLabel.textColor = self.currentColor;
            self.showLineView.frame = CGRectMake(columnLabel.frame.origin.x - 10, 0, labelWidth + 2 * 10, self.menuView.frame.size.height);
        }else{
            columnLabel.font = self.normalFont;
            columnLabel.textColor = self.normalColor;
        }
        
        leftX = leftX + labelWidth + 10 * 2;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(columnMenuAction:)];
        [columnLabel addGestureRecognizer:tapGestureRecognizer];
        
        key++;
    }
    
    self.menuView.contentSize = CGSizeMake(leftX - 10 * 2 + 10, self.frame.size.height);
    //    [self adjustMenuViewContenOffsetWithPageNumber:_currentPageNumber];
}

// 调整菜单条的contengOffset
- (void)adjustMenuViewContenOffsetWithPageNumber:(NSInteger)index animate:(BOOL)isAnimate{
    index = index >= self.menuArray.count ? self.menuArray.count - 1 : index ;
    
    CGFloat scrollMenuX = 0;
    CGFloat scrollMenuWidth = 0;
    for (UIView *subview in self.menuView.subviews) {
        if ([subview isKindOfClass:[UILabel class]]) {
            UILabel *titleLabel = (UILabel *)subview;
            if (index == titleLabel.tag) {
                scrollMenuX = titleLabel.frame.origin.x - 10.0;
                scrollMenuWidth = titleLabel.frame.size.width;
                titleLabel.font = self.currentFont;
                titleLabel.textColor = self.currentColor;
                if(!self.showLineAnimate){
                    self.showLineView.frame = CGRectMake(titleLabel.frame.origin.x - 10, self.showLineView.frame.origin.y, scrollMenuWidth + 2 * 10, self.showLineView.frame.size.height);
                }
            }else{
                titleLabel.font = self.normalFont;
                titleLabel.textColor = self.normalColor;
            }
        }
    }
    scrollMenuWidth = 10 * 2 + scrollMenuWidth;
    
    // 当前栏目名称在屏幕中间显示
    scrollMenuX = scrollMenuX - (self.frame.size.width - scrollMenuWidth)/2.0;
    
    // 排在前面的栏目
    if (scrollMenuX < 0) {
        scrollMenuX = 0;
    } else if (scrollMenuX + self.menuView.frame.size.width > self.menuView.contentSize.width) {
        scrollMenuX = self.menuView.contentSize.width - self.menuView.frame.size.width;
    }
    if (scrollMenuX < 0) {
        scrollMenuX = 0;
    }
    scrollMenuX = floorf(scrollMenuX);
    
    if (isAnimate) {
        [self.menuView setContentOffset:CGPointMake(scrollMenuX,0) animated:NO];
    }
}


- (void)showLineViewAnimate:(CGFloat)contentOffsetX direction:(NSString *)direction {
    if (self.menuView.frame.size.width == 0) {
        return;
    }
    CGFloat nextWitdth = 0.0;
    CGFloat nextOriginX = 0.0 ;
    
    NSInteger index = contentOffsetX / self.menuView.frame.size.width;
    if ([direction isEqualToString:@"left"]) {
        if (index >= self.columnLabelWidthArray.count || index < 0) {
            return;
        }
        CGFloat currentWidth = [self.columnLabelWidthArray[index] floatValue];
        CGFloat currentOriginX = [self.columnLabelXArray[index] integerValue];
        if (index + 1 == self.columnLabelWidthArray.count) {
            return;
        }
        
        nextWitdth = [self.columnLabelWidthArray[index + 1] floatValue];
        nextOriginX = [self.columnLabelXArray[index + 1] integerValue];
        //改变x
        CGFloat originDistance = nextOriginX - currentOriginX;
        CGFloat distance = contentOffsetX - index*self.menuView.frame.size.width;
        
        CGFloat x = originDistance * (distance/self.menuView.frame.size.width);
        CGFloat w = (nextWitdth - currentWidth)*(distance/self.menuView.frame.size.width);
        self.showLineView.frame = CGRectMake(currentOriginX + x, self.showLineView.frame.origin.y,
                                             currentWidth+w, self.showLineView.frame.size.height);
        
    }
    if ([direction isEqualToString:@"right"]) {
        index = index + 1;
        if (index >= self.columnLabelWidthArray.count || index < 0) {
            return;
        }
        CGFloat currentWidth = [self.columnLabelWidthArray[index] floatValue];
        CGFloat currentOriginX = [self.columnLabelXArray[index] integerValue];
        if (index-1 < 0) {
            return;
        }
        nextWitdth = [self.columnLabelWidthArray[index - 1] floatValue];
        nextOriginX = [self.columnLabelXArray[index - 1] integerValue];
        //改变x
        CGFloat originDistance = nextOriginX - currentOriginX;
        CGFloat distance = index*self.menuView.frame.size.width - contentOffsetX;
        
        CGFloat x = originDistance * (distance/self.menuView.frame.size.width);
        CGFloat w = (nextWitdth - currentWidth)*(distance/self.menuView.frame.size.width);
        self.showLineView.frame = CGRectMake(currentOriginX + x, self.showLineView.frame.origin.y,
                                             currentWidth+w, self.showLineView.frame.size.height);
    }
}

#pragma mark -- Event Handel
- (void)columnMenuAction:(UITapGestureRecognizer *)tap{
    UILabel * label = (UILabel *)tap.view;
    self.currentPageNumber = label.tag;
    
    //    self.showLineView.frame = CGRectMake(label.frame.origin.x, self.menuView.frame.size.height - 2, label.frame.size.width, 2);
    
    if (_selectColumnBlock) {
        _selectColumnBlock(self.currentPageNumber);
    }
}

#pragma mark -- Setter

- (void)setMenuArray:(NSMutableArray *)menuArray{
    _menuArray = menuArray;
}

- (void)setCurrentPageNumber:(NSInteger)currentPageNumber{
    _currentPageNumber = currentPageNumber;
    if (currentPageNumber < 0) {
        _currentPageNumber = 0;
    }
    //    [self adjustMenuViewContenOffsetWithPageNumber:_currentPageNumber];
}

// 高度固定 根据显示内容计算宽度
- (CGFloat)contentLabelWidthWithText:(NSString*)text labelHeight:(CGFloat)labelHeight font:(UIFont *)font paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle {
    CGSize size = CGSizeMake(MAXFLOAT, labelHeight);
    NSDictionary * attributes;
    if (paragraphStyle != nil) {
        attributes = @{ NSFontAttributeName : font , NSParagraphStyleAttributeName : paragraphStyle};
    } else {
        attributes = @{ NSFontAttributeName : font };
    }
    size =[text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:attributes context:nil].size;
    return  ceilf(size.width);
}


@end
