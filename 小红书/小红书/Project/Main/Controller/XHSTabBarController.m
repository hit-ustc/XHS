//
//  XHSTabBarController.m
//  小红书
//
//  Created by Aesthetic92 on 16/7/8.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "XHSTabBarController.h"
#import "XHSNavigationController.h"
#import "XHSHomeViewController.h"
#import "XHSDiscoverViewController.h"
#import "XHSBuyViewController.h"
#import "XHSMessageViewController.h"
#import "XHSMeViewController.h"

@implementation XHSTabBarController

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = JSTabBarItemTitleColor;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVc:[[XHSHomeViewController alloc] init] title:@"首页" image:@"tab_home~iphone" selectedImage:@"tab_home_h~iphone"];
    
    [self setupChildVc:[[XHSDiscoverViewController alloc] init] title:@"发现" image:@"tab_search~iphone" selectedImage:@"tab_search_h~iphone"];
    
    [self setupChildVc:[[XHSBuyViewController alloc] init] title:@"购买" image:@"tab_store~iphone" selectedImage:@"tab_store_h~iphone"];
    
    [self setupChildVc:[[XHSMessageViewController alloc] init] title:@"消息" image:@"tab_msn~iphone" selectedImage:@"tab_msn_h~iphone"];
    
    [self setupChildVc:[[XHSMeViewController alloc] init] title:@"我的" image:@"tab_me~iphone" selectedImage:@"tab_me_h~iphone"];
    
//    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBarBackground"]];
    
}

- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarController的子控制器
    XHSNavigationController *nav = [[XHSNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
