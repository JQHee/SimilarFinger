//
//  ZZSameSetClassView.m
//  ZZFinger
//
//  Created by zry on 2017/12/28.
//  Copyright © 2017年 zry. All rights reserved.
//

#import "ZZSameSetClassView.h"

#define image_width     100

@interface ZZSameSetClassView()
@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) NSMutableArray *imgArray;
@end

@implementation ZZSameSetClassView

- (instancetype)initWithFrame:(CGRect)frame array:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureScroll:array];
    }
    
    return self;
}


-(void)configureScroll:(NSArray *)array
{
    if (!array.count) {
        return;
    }
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    CGFloat space = 20;
    scrollView.contentSize = CGSizeMake(array.count * (space+image_width) , self.frame.size.height);
    [self addSubview:scrollView];
    
    for (NSInteger i = 0; i < array.count; i++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(space/2.0 + (image_width + space)*i, 0, image_width, self.frame.size.height - 20)];
        image.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.00 green:(arc4random()%255)/255.00 blue:(arc4random()%255)/255.00 alpha:1];
        [scrollView addSubview:image];
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
