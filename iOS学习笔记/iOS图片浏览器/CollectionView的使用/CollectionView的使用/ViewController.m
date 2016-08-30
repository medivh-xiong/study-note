//
//  ViewController.m
//  CollectionView的使用
//
//  Created by 熊欣 on 16/8/26.
//  Copyright © 2016年 熊欣. All rights reserved.
//

#import "ViewController.h"
#import "PhotoViewCell.h"
#import "FlowLayout.h"

@interface ViewController ()<UICollectionViewDataSource>

#define Screen_Width  [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height


@property (nonatomic, readwrite, weak) UICollectionView *photoView;

@end

@implementation ViewController

static NSString * const cellID = @"cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // ----设置collectionView
    [self setCollectionView];
    
}


- (void)setCollectionView
{
    // ----设置流水布局
    FlowLayout *flowLayout = ({
    
        FlowLayout *flowLayout = [[FlowLayout alloc] init];

        flowLayout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
        
        flowLayout.itemSize                    = CGSizeMake(225, 225);
        
        flowLayout.minimumLineSpacing          = 20;
        
        CGFloat margin                         = (Screen_Width - 250) / 2;
        
        flowLayout.sectionInset                = UIEdgeInsetsMake(0, margin, 0, margin);
        
        flowLayout;
    });

    // ----设置collectionView
    UICollectionView *collectionView = ({

        CGRect photoFrame                             = CGRectMake(0, Screen_Height / 3, Screen_Width, 400);

        UICollectionView *collectionView              = [[UICollectionView alloc] initWithFrame:photoFrame
                                                              collectionViewLayout:flowLayout];
        collectionView.dataSource                     = self;

        collectionView.showsHorizontalScrollIndicator = NO;
        
        [self.view addSubview:collectionView];
        
        collectionView;
    });
    
    self.photoView = collectionView;
    
    // ----提前注册cell
    [self.photoView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoViewCell class]) bundle:nil] forCellWithReuseIdentifier:cellID];
}

#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoViewCell *cell = ({
        
        PhotoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
        
        NSString *imageName = [NSString stringWithFormat:@"%li", indexPath.row + 1];
        
        cell.photoImage.image = [UIImage imageNamed:imageName];
        
        cell;
    });
    
    return cell;
}

@end
