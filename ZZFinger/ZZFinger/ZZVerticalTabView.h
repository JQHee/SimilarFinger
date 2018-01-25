//
//  ZZVerticalTabView.h
//  ZZFinger
//
//  Created by zry on 2017/12/28.
//  Copyright © 2017年 zry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TabSelectedBlock)(NSInteger index);

@interface ZZVerticalTabView : UIView
@property (nonatomic, copy) TabSelectedBlock tabBlock;
-(instancetype)initWithFrame:(CGRect)frame tabArray:(NSArray *)array;
-(void)resetSelectIndex:(NSInteger)index;
@end
