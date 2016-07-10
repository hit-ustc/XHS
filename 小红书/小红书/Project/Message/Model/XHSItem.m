//
//  XHSItem.m
//  小红书
//
//  Created by Aesthetic92 on 16/7/10.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "XHSItem.h"

@implementation XHSItem

+ (XHSItem *)itemWithIcon:(NSString *)icon title:(NSString *)title object:(id)object {
    
    XHSItem *item = [[[self class] alloc] init];
    item.icon = icon;
    item.title = title;
    item.object = object;
    
    return item;
    
}

@end
