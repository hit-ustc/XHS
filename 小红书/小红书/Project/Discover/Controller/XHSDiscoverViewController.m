//
//  XHSDiscoverViewController.m
//  小红书
//
//  Created by Aesthetic92 on 16/7/9.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "XHSDiscoverViewController.h"

@interface XHSDiscoverViewController ()

@end

@implementation XHSDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];

}

- (void)setupNav {
    
    self.view.backgroundColor = JSGlobalBg;
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
}

@end
