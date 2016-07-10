//
//  XHSMessageViewController.m
//  小红书
//
//  Created by Aesthetic92 on 16/7/9.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "XHSMessageViewController.h"
#import "XHSItem.h"
#import "XHSNewFansViewController.h"
#import "XHSMessageCell.h"

static NSString * const XHSMessageCellId = @"MessageCell";

@interface XHSMessageViewController () <UITableViewDataSource, UITableViewDelegate>
{
    
    UITableView *_tableview;
    
}

@property(nonatomic, strong) NSArray *datas;

@end

@implementation XHSMessageViewController

- (NSArray *)datas {
    
    if (!_datas) {
        _datas = [NSArray array];
    }    
    return _datas;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self initDatas];
    
    [self initTableView];
    

}

- (void)setupNav {
    
    self.view.backgroundColor = JSGlobalBg;
    self.title = @"消息";
    
}

- (void)initDatas {
    
    _datas = @[
               [XHSItem itemWithIcon:@"message_new_fans~iphone" title:@"新的粉丝" object:[XHSNewFansViewController class]],
               [XHSItem itemWithIcon:@"message_new_comments~iphone" title:@"新的评论" object:[XHSNewFansViewController class]],
               [XHSItem itemWithIcon:@"message_new_likes~iphone" title:@"新的赞" object:[XHSNewFansViewController class]],
               [XHSItem itemWithIcon:@"message_new_collections~iphone" title:@"新的收藏" object:[XHSNewFansViewController class]],
               [XHSItem itemWithIcon:@"message_new_system~iphone" title:@"通知" object:[XHSNewFansViewController class]]
            ];
    
}

- (void)initTableView {
    
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.size.width, self.view.size.height) style:UITableViewStylePlain];
    [self.view addSubview:_tableview];
    
//    _tableview.contentSize = CGSizeMake(self.view.size.width, 44*5);
//    _tableview.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableview.backgroundColor = [UIColor clearColor];
    
    _tableview.showsVerticalScrollIndicator = false;
    
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _tableview.dataSource = self;
    _tableview.delegate = self;
    
    [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([XHSMessageCell class]) bundle:nil] forCellReuseIdentifier:XHSMessageCellId];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _datas.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XHSMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:XHSMessageCellId forIndexPath:indexPath];
    
    cell.item = self.datas[indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XHSItem *item = _datas[indexPath.row];
    
    XHSNewFansViewController *fans = [item.object new];
    
     XHSMessageCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.navigationController pushViewController:fans animated:YES];
    
}

@end
