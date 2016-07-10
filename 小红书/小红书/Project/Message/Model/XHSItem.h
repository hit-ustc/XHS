//
//  XHSItem.h
//  小红书
//
//  Created by Aesthetic92 on 16/7/10.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHSItem : NSObject

@property(nonatomic, weak) NSString *icon;

@property(nonatomic, copy) NSString *title;

@property(nonatomic, strong) id object;

+ (XHSItem *)itemWithIcon:(NSString *)icon title:(NSString *)title object:(id)object;

@end
