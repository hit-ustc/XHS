//
//  XHSMessageCell.m
//  小红书
//
//  Created by Aesthetic92 on 16/7/10.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "XHSMessageCell.h"
#import "XHSItem.h"

@interface XHSMessageCell()

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *behavior;

@end

@implementation XHSMessageCell

- (void)setItem:(XHSItem *)item {
    
    _item = item;
    
    self.icon.image = [UIImage imageNamed:item.icon];
    
    self.behavior.text = item.title;

}

@end
