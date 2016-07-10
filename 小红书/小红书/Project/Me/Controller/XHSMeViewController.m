//
//  XHSMeViewController.m
//  小红书
//
//  Created by Aesthetic92 on 16/7/9.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "XHSMeViewController.h"

@interface XHSMeViewController ()

@end

@implementation XHSMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];

}

- (void)setupNav {
    
    self.view.backgroundColor = JSGlobalBg;
    
    UIBarButtonItem *adduser = [UIBarButtonItem js_itemWithImage:@"xy_btn_invite~iphone" highImage:nil target:self action:@selector(addUserClick)];
    UIBarButtonItem *setting = [UIBarButtonItem js_itemWithImage:@"xy_btn_setting~iphone" highImage:nil target:self action:@selector(setting)];
    
    self.navigationItem.leftBarButtonItem = adduser;
    self.navigationItem.rightBarButtonItem = setting;
    
}

- (void)addUserClick {
    
    NSLog(@"addUser...");
    
}

- (void)setting {
    
    NSLog(@"setting...");
    
}

@end
