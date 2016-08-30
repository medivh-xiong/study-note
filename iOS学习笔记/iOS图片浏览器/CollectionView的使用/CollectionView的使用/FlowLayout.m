//
//  FlowLayout.m
//  CollectionView的使用
//
//  Created by 熊欣 on 16/8/29.
//  Copyright © 2016年 熊欣. All rights reserved.
//

#import "FlowLayout.h"

@implementation FlowLayout

/** 这个方法意思是给定一段rect，在这段rect中cell的布局*/
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // ----1.先获取当前collectionView所在区域的cell
    NSArray *attrs = [super layoutAttributesForElementsInRect:self.collectionView.bounds];
    
    for (UICollectionViewLayoutAttributes *cellAttr in attrs) {
        
        // ----获取偏移量（取绝对值）
        CGFloat cellOffset = fabs(cellAttr.center.x - self.collectionView.contentOffset.x - self.collectionView.frame.size.width * 0.5);
        
        // ----计算百分比
        CGFloat perCent = 1 - cellOffset / (self.collectionView.frame.size.width * 0.5);
        
        cellAttr.transform = CGAffineTransformMakeScale(perCent, perCent);
    }
    
    return attrs;
}


/** 这个方法意思是在collectionView滚动的时候是否需要布局，默认是No*/
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/** 当滚动完成后的返回一个最终位置的信息，因为手指滚动有速度，因此不是单纯的collectionView的偏移量不等于最终的偏移量*/
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGPoint targetOffset    = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];

    // ----获得当前所在区域的cell
    CGFloat collectionViewW = self.collectionView.bounds.size.width;
    
    CGRect frame            = CGRectMake(targetOffset.x, 0, collectionViewW, MAXFLOAT);

    NSArray *attrs          = [super layoutAttributesForElementsInRect:frame];

    CGFloat minOffset       = MAXFLOAT;
    
    for (UICollectionViewLayoutAttributes *cellAttr in attrs) {
        
        // ----获取偏移量（取绝对值）
        CGFloat cellOffset = cellAttr.center.x - targetOffset.x - self.collectionView.frame.size.width * 0.5;
        
        if (fabs(cellOffset) < fabs(minOffset)) {
            minOffset = cellOffset;
        }
        
    }
    
    
    targetOffset.x += minOffset;
    
    if (targetOffset.x < 0) {
        targetOffset.x = 0;
    }
    
    
    return targetOffset;
}

@end
