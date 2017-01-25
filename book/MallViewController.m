//
//  MallViewController.m
//  book
//
//  Created by chenxb on 17/1/18.
//  Copyright © 2017年 grace. All rights reserved.
//

#import "MallViewController.h"
#import "Commons.h"
#import "ColorLabel.h"
#import "ColorUtil.h"
#import "GridListCollectionViewCell.h"
#import "GridListModel.h"
#import "NSObject+Property.m"

@interface MallViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, retain) UIButton *swithBtn;

@end

@implementation MallViewController
{
    BOOL _isGrid;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
        //设置滚动方向
        [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        //左右间距
        flowlayout.minimumInteritemSpacing = 2;
        //上下间距
        flowlayout.minimumLineSpacing = 2;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(2 , 2 , self.view.bounds.size.width - 4, self.view.bounds.size.height - 4) collectionViewLayout:flowlayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        //注册cell
        [_collectionView registerClass:[GridListCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier_CollectionViewCell];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 默认列表视图
    _isGrid = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"product" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    [self.view addSubview:self.collectionView];
    
    _swithBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _swithBtn.frame =CGRectMake(0,0, 30, 44);
    _swithBtn.tintColor = [UIColor whiteColor];
    UIImage *image = [[UIImage imageNamed:@"product_list_list_btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [_swithBtn setImage:image forState:0];
    [_swithBtn addTarget:self action:@selector(onClickRight) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:_swithBtn];
    [self.navigationItem setRightBarButtonItem:item];
    
    
    NSArray *products = dict[@"wareInfo"];
    for (id obj in products) {
        [self.dataSource addObject:[GridListModel objectWithDictionary:obj]];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GridListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier_CollectionViewCell forIndexPath:indexPath];
    cell.isGrid = _isGrid;
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_isGrid) {
        return CGSizeMake((ScreenWidth - 6) / 2, (ScreenWidth - 6) / 2 + 40);
    } else {
        return CGSizeMake(ScreenWidth - 4, (ScreenWidth - 6) / 4 + 20);
    }
}

#pragma mark - Action

- (void) onClickRight
{
    _isGrid = !_isGrid;
    [self.collectionView reloadData];
    
    if (_isGrid) {
        [self.swithBtn setImage:[[UIImage imageNamed:@"product_list_grid_btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:0];
    } else {
        [self.swithBtn setImage:[[UIImage imageNamed:@"product_list_list_btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:0];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
