//
//  ZZCollectionView.m
//  ZZFinger
//
//  Created by zry on 2017/12/29.
//  Copyright © 2017年 zry. All rights reserved.
//

#import "ZZCollectionView.h"

@interface ZZCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectView;
@end

@implementation ZZCollectionView

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self configureCollectView];
    return self;
}

-(void)configureCollectView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 20;
    layout.itemSize = CGSizeMake((CGRectGetWidth(self.frame) - 20*3) / 2.0, (CGRectGetWidth(self.frame) - 20*3) / 2.0);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:collectionView];
    self.collectView = collectionView;
    collectionView.scrollEnabled = NO;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectCell"];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectCell" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor greenColor];
    UIView *view = [UIView new];
    view.backgroundColor =  [UIColor greenColor];
    cell.backgroundView = view;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"点击collectionView");
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundView.backgroundColor = [UIColor redColor];

}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSLog(@"bu点击collectionView");
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundView.backgroundColor = [UIColor greenColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
