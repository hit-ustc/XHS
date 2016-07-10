//
//  XHSWaterLayout.m
//  小红书
//
//  Created by Aesthetic92 on 16/7/9.
//  Copyright © 2016年 Aesthetic92. All rights reserved.
//

#import "XHSWaterLayout.h"

static CGFloat colMargin =  10;
static CGFloat rowMargin = 10;
static NSInteger columns = 3;
static UIEdgeInsets sectionInset;


@interface XHSWaterLayout()

@property (nonatomic, strong) NSMutableArray* attrArray;

@property (nonatomic, strong) NSMutableArray* lastHeightForColArray;

@property (nonatomic, assign) BOOL isAutuContentSize;

@end

@implementation XHSWaterLayout

- (NSMutableArray *)attrArray {
    
    if (!_attrArray) {
        _attrArray = [NSMutableArray array];
    }
    return _attrArray;
}

- (NSMutableArray *)lastHeightForColArray {
    
    if (!_lastHeightForColArray) {
        _lastHeightForColArray = [NSMutableArray array];
    }
    return _lastHeightForColArray;
}

- (void)prepareLayout {
    
    [super prepareLayout];
    
    colMargin = (self.colMargin == 0 ? colMargin : self.colMargin);
    rowMargin = (self.rowMargin == 0 ? rowMargin : self.rowMargin);
    columns = (self.columns == 0 ? columns : self.columns);
    sectionInset = self.sectionInset;
    
    [self.lastHeightForColArray removeAllObjects];
    
    for (NSInteger i = 0; i < columns; i++) {
        [self.lastHeightForColArray addObject:@(sectionInset.top)];
    }
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (NSInteger i = 0 ; i < count; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes* attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrArray addObject:attr];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    return self.attrArray;
    
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat width = (self.collectionView.frame.size.width - sectionInset.left - sectionInset.right - (columns - 1) * colMargin) / columns;
    CGFloat height = 0;
    
    if ([self.delegate respondsToSelector:@selector(XHSWaterLayout:itemHeightForIndexPath:)]) {
        height = [self.delegate XHSWaterLayout:self itemHeightForIndexPath:indexPath];
    }
    
    CGFloat minY = (self.lastHeightForColArray.count ? [[self.lastHeightForColArray firstObject] floatValue] : sectionInset.top);
    NSInteger currentCol = 0;
    for (NSInteger i = 1; i < self.lastHeightForColArray.count; i++) {
        if (minY > [self.lastHeightForColArray[i] floatValue]) {
            minY = [self.lastHeightForColArray[i] floatValue];
            currentCol = i;
        }
    }
    
    CGFloat x = sectionInset.left + (width + colMargin) * currentCol;
    CGFloat y = minY + rowMargin;
    
    attr.frame = CGRectMake(x, y, width, height);
    self.lastHeightForColArray[currentCol] = @(CGRectGetMaxY(attr.frame));
    if (self.isAutuContentSize) {
        
        CGFloat max = [[self.lastHeightForColArray firstObject] floatValue];
        
        for (NSInteger i = 1 ; i < self.lastHeightForColArray.count; i++) {
            if (max < [self.lastHeightForColArray[i] floatValue]) {
                max = [self.lastHeightForColArray[i] floatValue];
            }
        }
        
        self.contentSize = CGSizeMake(self.collectionView.bounds.size.width, max + sectionInset.bottom);
    }
    
    return attr;
    
}

- (void)autuContentSize {
    
    _isAutuContentSize = YES;
    
}

- (CGSize)collectionViewContentSize {
    
    return self.contentSize;
    
}

@end
