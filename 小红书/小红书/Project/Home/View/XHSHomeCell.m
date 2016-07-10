//
//  XHSHomeCell.m
//  小红书
//
//  Created by Aesthetic92 on 16/7/9.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "XHSHomeCell.h"
#import "XHSHomeModel.h"
#import "UIImageView+WebCache.h"

@interface XHSHomeCell()

@property (weak, nonatomic) IBOutlet UIImageView *iv;

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;

@property (weak, nonatomic) IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UILabel *desc;

@property (weak, nonatomic) IBOutlet UILabel *likes;

@end

@implementation XHSHomeCell

- (void)awakeFromNib {
    
    [self.desc layoutIfNeeded];
    
}

- (void)setModel:(XHSHomeModel *)model {
    
    _model = model;
    
    [self.iv sd_setImageWithURL:[NSURL URLWithString:_model.url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
    UIImage *placeholder = [UIImage imageNamed:@"tag_select~iphone"];    
    [self.userIcon sd_setImageWithURL:[NSURL URLWithString:_model.images] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.userIcon.image = (image ? [image js_circleImage] : placeholder);
    }];
    
    self.username.text = model.nickname;
    
    self.likes.text = model.likes;
    
    self.desc.text = model.title;
    
}

@end
