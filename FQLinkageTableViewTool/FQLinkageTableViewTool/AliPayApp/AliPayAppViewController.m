//
//  AliPayAppViewController.m
//  FQLinkageTableViewTool
//
//  Created by mac on 2018/6/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "AliPayAppViewController.h"
#import "AliPayTestViewController.h"
#import "AliPayFunctionCell.h"
#import "AliPayHeaderView.h"
#import "AliPayTopCell.h"

@interface AliPayAppViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>

/** <#name#> */
@property (nonatomic, strong) UICollectionView *collectionView;
/** <#name#> */
@property (nonatomic, strong) NSArray *dataSources;
/** <#name#> */
@property (nonatomic, strong) UICollectionView *topCollectionView;
/**
 滑到了第几组
 */
@property (nonatomic, strong) NSIndexPath * currentIndexPath;
//用来处理leftTableView的cell的点击事件引起的rightTableView的滑动和用户拖拽rightTableView的事件冲突
@property (nonatomic, assign) BOOL isSelected;


@end

@implementation AliPayAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付宝联动";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    //设置顶部标签栏
    [self setupTitlesView];
    //底部的scrollview
    [self setupContentView];
    // YJLog(@"自定义log");
    self.automaticallyAdjustsScrollViewInsets = NO;
} 

#pragma mark 底部的scrollview
-(void)setupContentView {
    _currentIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    self.collectionView.frame = CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT-40);
    [self.view addSubview:self.collectionView];
}


#pragma mark 设置顶部标签栏
-(void)setupTitlesView {
    //标签栏
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1];
    titlesView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    [self.view addSubview:titlesView];
    [titlesView addSubview:self.topCollectionView];
    [self.topCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    
}
//
//    //底部红色指示器
//    UIView *indicatorView = [[UIView alloc] init];
//    indicatorView.backgroundColor = CUSTOMCOLOR(15, 113, 226);
//    //45 130 211
//    indicatorView.yj_height = 2;
//    indicatorView.tag = -1;
//    indicatorView.yj_y = titlesView.yj_height - indicatorView.yj_height;
//    self.indicatorView = indicatorView;
//
//    //内部子标签
//    NSInteger count = self.dataSources.count;
//    CGFloat width = titlesView.yj_width / count;
//    CGFloat height = titlesView.yj_height;
//    for (int i = 0; i < count; i++) {
//        UIButton *button = [[UIButton alloc] init];
//        button.yj_height = height;
//        button.yj_width = width;
//        button.yj_x = i * width;
//        button.tag = i;
//        [button setTitle:self.dataSources[i] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setTitleColor:CUSTOMCOLOR(15, 113, 226) forState:UIControlStateDisabled];
//        // YJColor(45, 130, 211)
//        button.titleLabel.font = [UIFont systemFontOfSize:14];
//        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
//        [titlesView addSubview:button];
//
//        //默认点击了第一个按钮
//        if (i == 0) {
//            button.enabled = NO;
//            self.selectedButton = button;
//            //让按钮内部的Label根据文字来计算内容
//            [button.titleLabel sizeToFit];
//            self.indicatorView.yj_width = button.titleLabel.yj_width;
//            self.indicatorView.yj_centerX = button.yj_centerX;
//        }
//
//    }
//    [titlesView addSubview:indicatorView];
//}
//
//#pragma mark 便签栏按钮点击
//-(void)titleClick:(UIButton *)button {
//
//    self.selectedButton.enabled = YES;
//    button.enabled = NO;
//    self.selectedButton = button;
//    //让标签执行动画
//    [UIView animateWithDuration:0.25 animations:^{
//        self.indicatorView.yj_width = self.selectedButton.titleLabel.yj_width;
//        self.indicatorView.yj_centerX = self.selectedButton.yj_centerX;
//    }];
//    //滚动,切换子控制器
//    CGPoint offset = self.contentView.contentOffset;
//    offset.x = button.tag * self.contentView.yj_width;
//    [self.contentView setContentOffset:offset animated:YES];
//}


//#pragma mark -UIScrollViewDelegate
//-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//    //添加子控制器的view
//    //当前索引
//    NSInteger index = scrollView.contentOffset.x / scrollView.yj_width;
//    //取出子控制器
//    UIViewController *vc = self.dataSources[index];
//    vc.view.yj_x = scrollView.contentOffset.x;
//    vc.view.yj_y = 0;//设置控制器的y值为0(默认为20)
//    vc.view.yj_height = scrollView.yj_height;//设置控制器的view的height值为整个屏幕的高度（默认是比屏幕少20）
//    [scrollView addSubview:vc.view];
//
//}
//
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//
//    [self scrollViewDidEndScrollingAnimation:scrollView];
//    //当前索引
//    NSInteger index = scrollView.contentOffset.x / scrollView.yj_width;
//    //点击button
//    [self titleClick:self.titlesView.subviews[index]];
//
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    //计算拖拽比例
//    CGFloat ratio = scrollView.contentOffset.x/scrollView.yj_width;
//    //将整数部分减掉，保留小数部分的比例
//    ratio = ratio - self.selectedButton.tag;
//    //设置下划线的centerX
//    self.indicatorView.yj_centerX = self.selectedButton.yj_centerX + ratio*self.selectedButton.yj_width;
//
    
    if (scrollView == self.collectionView && _isSelected == NO) {
        //系统方法返回处于tableView某坐标处的cell的indexPath
        NSIndexPath * indexPath = [self.collectionView indexPathForItemAtPoint:scrollView.contentOffset];
        NSLog(@"滑到了第 %ld 组 %ld个",indexPath.section, indexPath.row);
        _currentIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section];

        [self.topCollectionView reloadData];
        [self.topCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
    
    //获取处于UITableView中心的cell
    //系统方法返回处于tableView某坐标处的cell的indexPath
    NSIndexPath * middleIndexPath = [self.collectionView indexPathForItemAtPoint:CGPointMake(0, scrollView.contentOffset.y + self.collectionView.frame.size.height/2)];
    NSLog(@"中间的cell：第 %ld 组 %ld个",middleIndexPath.section, middleIndexPath.row);
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _isSelected = NO;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (collectionView == self.topCollectionView) {
        return 1;
    } else {
        return self.dataSources.count;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.topCollectionView) {
        return self.dataSources.count;
    } else {
        return 12;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.topCollectionView) {
        AliPayTopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AliPayTopCell" forIndexPath:indexPath];
        [cell updateTitleData: self.dataSources[indexPath.row]];
        if (indexPath == _currentIndexPath) {
            cell.titleLab.textColor = CUSTOMCOLOR(15, 113, 226);
            cell.bottomView.backgroundColor = CUSTOMCOLOR(15, 113, 226);
        }else{
            cell.titleLab.textColor = [UIColor blackColor];
            cell.bottomView.backgroundColor = [UIColor whiteColor];
        }
        
        return cell;
    } else {
        AliPayFunctionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AliPayFunctionCell" forIndexPath:indexPath];
        
        return cell;
    }
    
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    if (collectionView == self.collectionView) {
        if (kind == UICollectionElementKindSectionHeader){
            AliPayHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"AliPayHeaderView" forIndexPath:indexPath];
            [headerView updateDataWithStr:self.dataSources[indexPath.section]];
            reusableview = headerView;
        }
    }
    
    return reusableview;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (collectionView == self.collectionView) {
        return CGSizeMake(SCREEN_WIDTH, 50);
    }else{
        return CGSizeZero;
    }
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.topCollectionView) {
        _currentIndexPath = indexPath;

        [collectionView deselectItemAtIndexPath:indexPath animated:NO];
        [collectionView reloadData];
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
        _isSelected = YES;
    } else {
        [self.navigationController pushViewController:[AliPayTestViewController new] animated:YES];
    }
    
}

- (NSArray *)dataSources
{
    if (!_dataSources) {
        _dataSources = @[@"便民生活",@"财富管理",@"资金往来",@"购物娱乐",@"教育公益",@"第三方服务"];
    }
    return _dataSources;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        layout.itemSize = CGSizeMake(SCREEN_WIDTH/4 - 5, 70);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, SCREEN_HEIGHT-60) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[AliPayFunctionCell class] forCellWithReuseIdentifier:@"AliPayFunctionCell"];
        [_collectionView registerClass:[AliPayHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"AliPayHeaderView"];

    }
    return _collectionView;
}

- (UICollectionView *)topCollectionView
{
    if (!_topCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        layout.itemSize = CGSizeMake(SCREEN_WIDTH/4 - 10, 60);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _topCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60) collectionViewLayout:layout];
        _topCollectionView.delegate = self;
        _topCollectionView.dataSource = self;
        _topCollectionView.backgroundColor = [UIColor whiteColor];
        [_topCollectionView registerClass:[AliPayTopCell class] forCellWithReuseIdentifier:@"AliPayTopCell"];
        
    }
    return _topCollectionView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
