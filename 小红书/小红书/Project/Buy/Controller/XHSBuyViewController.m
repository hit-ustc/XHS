//
//  XHSBuyViewController.m
//  小红书
//
//  Created by Aesthetic92 on 16/7/9.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "XHSBuyViewController.h"

@interface XHSBuyViewController ()

@end

@implementation XHSBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
}

- (void)setupNav {
    
    self.view.backgroundColor = JSGlobalBg;
    self.title = @"福利社";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                                    NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
        
    UIBarButtonItem *cart = [UIBarButtonItem js_itemWithImage:nil highImage:nil target:self action:@selector(cartClick)];
    self.navigationItem.rightBarButtonItem = cart;
    
}

- (void)cartClick {
    
    NSLog(@"cart click...");
    
}

@end
