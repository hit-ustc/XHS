//
//  XHSWaterLayout.h
//  小红书
//
//  Created by Aesthetic92 on 16/7/9.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XHSWaterLayout;

@protocol XHSWaterLayoutDalegate <NSObject>

- (CGFloat)XHSWaterLayout:(XHSWaterLayout *)XHSWaterLayout itemHeightForIndexPath:(NSIndexPath *)indexPath;

@end


@interface XHSWaterLayout : UICollectionViewLayout

@property(nonatomic, weak) id <XHSWaterLayoutDalegate> delegate;

/**
 *  每行之间的间距
 */
@property (nonatomic, assign) CGFloat rowMargin;

/**
 *  每列之间的间距
 */
@property (nonatomic, assign) CGFloat colMargin;

/**
 *  列数
 */
@property (nonatomic, assign) NSInteger columns;

/**
 *  contentSize
 */
@property (nonatomic, assign) CGSize contentSize;

/**
 *  自动配置 contentSize
 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;


-(void)autuContentSize;

@end
