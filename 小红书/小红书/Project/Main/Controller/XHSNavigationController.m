//
//  XHSNavigationController.m
//  小红书
//
//  Created by Aesthetic92 on 16/7/8.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "XHSNavigationController.h"

@implementation XHSNavigationController

+ (void)initialize
{

    UINavigationBar *bar = [UINavigationBar appearance];
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    itemAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
    [bar setTitleTextAttributes:itemAttrs];

}

@end
