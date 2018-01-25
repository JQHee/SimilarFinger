//
//  ZZVerticalTabView.m
//  ZZFinger
//
//  Created by zry on 2017/12/28.
//  Copyright © 2017年 zry. All rights reserved.
//

#import "ZZVerticalTabView.h"

@interface ZZVerticalTabView ()
@property (nonatomic, assign) NSInteger tabIndex;
@property (nonatomic, strong) NSMutableArray *tabArray;
@property (nonatomic, strong) UIView *indicatorLine;//红色滑块
@end

@implementation ZZVerticalTabView

-(instancetype)initWithFrame:(CGRect)frame tabArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.tabArray = [NSMutableArray arrayWithCapacity:array.count];
        self.tabIndex = -1;
        [self configureTabButtons:array];
    }
    return self;
}

-(void)configureTabButtons:(NSArray *)array
{
    if (!array.count) {
        return;
    }
    if (self.tabArray.count) {
        [self.tabArray removeAllObjects];
    }
    UIView *red = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 80)];
    red.backgroundColor = [UIColor redColor];
    [self addSubview:red];
    self.indicatorLine = red;
    
    for (NSInteger i = 0; i < array.count; i++) {
        UIButton *tab = [UIButton buttonWithType:UIButtonTypeCustom];
        tab.frame = CGRectMake(5, 80*i, 80, 80);
//        根据array setTitle
        tab.backgroundColor = [UIColor lightGrayColor];
        [tab setTitle:array[i] forState:UIControlStateNormal];
        tab.tag = 1000 + i;
        [tab addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tab];
        [self.tabArray addObject:tab];
        [self resetSelectIndex:0];
    }
    
    
}

-(void)buttonClick:(UIButton *)button
{
    NSInteger index = button.tag - 1000;
    [self resetSelectIndex:index];
    if (self.tabBlock) {
        self.tabBlock(index);
    }
}

-(void)resetSelectIndex:(NSInteger)index
{
    if (index >= self.tabArray.count) {
        return;
    }
    if (self.tabIndex != index) {
        UIButton *tab = self.tabArray[index];
        [UIView animateWithDuration:.3 animations:^{
            self.indicatorLine.frame = CGRectMake(0, index *80, 5, 80);
            tab.backgroundColor = [UIColor whiteColor];
            [tab setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            for (UIButton *button in self.tabArray) {
                if (![button isEqual:tab]) {
                    button.backgroundColor = [UIColor lightGrayColor];
                    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                }
            }
        }];
        self.tabIndex = index;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
