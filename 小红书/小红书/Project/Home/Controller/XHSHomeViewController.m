//
//  XHSHomeViewController.m
//  小红书
//
//  Created by Aesthetic92 on 16/7/8.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "XHSHomeViewController.h"
#import "XHSWaterLayout.h"
#import "XHSHomeCell.h"
#import "XHSHomeModel.h"
#import <AFNetworking.h>
#import <MJExtension.h>

@interface XHSHomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate, XHSWaterLayoutDalegate, UIScrollViewDelegate>

@property(nonatomic, weak) UICollectionView *collectionView;

@property(nonatomic, strong) NSArray *modelArr;

@property(nonatomic, strong) XHSWaterLayout *layout;

@end

static NSString * const XHSHomeCellId = @"HomeCell";

@implementation XHSHomeViewController

- (NSArray *)modelArr {
    
    if (!_modelArr) {
        _modelArr = [NSArray array];
    }
    
    return _modelArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupCollectionView];
    
    [self loadData];

}

- (void)setupNav {
    
    self.view.backgroundColor = JSGlobalBg;
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    [self createTitleView];
    
    UIBarButtonItem *camera = [UIBarButtonItem js_itemWithImage:@"btn_cam~iphone" highImage:nil target:self action:@selector(cameraClick)];
    self.navigationItem.rightBarButtonItem = camera;
    
}

- (void)createTitleView
{
    
    UIControl *titleControl = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, 80, 25)];
    [titleControl addTarget:self action:@selector(titleViewClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleControl;
    
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 1, 60, 22)];
    logoView.image = [UIImage imageNamed:@"xyph_home_xiaohongshu~iphone"];
    [titleControl addSubview:logoView];
    
    UIImageView *arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(63, 7, 11, 11)];
    arrowView.image = [UIImage imageNamed:@"xy_camera_icon_unfold~iphone"];
    [titleControl addSubview:arrowView];
    
}

- (void)titleViewClick {
    
    NSLog(@"titleViewClick click...");
    
}

- (void)cameraClick {
    
    NSLog(@"camera opening...");
    
}

- (void)loadData {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = @"http://www.xiaohongshu.com/api/sns/v2/homefeed?deviceId=E598E960-024B-44BA-9F60-E1297C36FC35&lang=zh-Hans&num=20&platform=iOS&sid=session.1148128034373166113&sign=a20b3aecf2efe34d01d0dcefc24cec2a&t=1463632659&value=simple";
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *tempArr = [NSArray array];
        tempArr = responseObject[@"data"];
        self.modelArr = [XHSHomeModel mj_objectArrayWithKeyValuesArray:tempArr];
        
        XHSHomeModel *test = self.modelArr[0];
        NSLog(@"%@", test.desc);
        [self.collectionView reloadData];
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@", error);
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
    }];
    
}

- (void)setupCollectionView {
    
    XHSWaterLayout *layout = [[XHSWaterLayout alloc] init];
    self.layout = layout;
    
    layout.columns = 2;
    layout.rowMargin = 10;
    layout.colMargin = 10;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 10, 10);
    layout.delegate = self;
    [layout autuContentSize];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView = collectionView;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = JSGlobalBg;
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XHSHomeCell class]) bundle:nil] forCellWithReuseIdentifier:XHSHomeCellId];
    
    [self.view addSubview:collectionView];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.modelArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XHSHomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XHSHomeCellId forIndexPath:indexPath];
    cell.model = self.modelArr[indexPath.item];
        
    return cell;
}

- (CGFloat)XHSWaterLayout:(XHSWaterLayout *)XHSWaterLayout itemHeightForIndexPath:(NSIndexPath *)indexPath {
    
    XHSHomeModel *model = self.modelArr[indexPath.item];
    
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - self.layout.sectionInset.left - self.layout.sectionInset.right - (self.layout.colMargin * (self.layout.columns - 1))) / self.layout.columns;
    
    CGFloat scale = [model.width floatValue] / width;
    CGFloat height = [model.height floatValue] / scale;
    
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    CGFloat descHeight = [model.title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]} context:nil].size.height;
    
    return  height + descHeight + 64;
    
}

@end
