//
//  ZZTabTableView.h
//  ZZFinger
//
//  Created by zry on 2018/1/2.
//  Copyright © 2018年 zry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TabSelectedBlock)(NSInteger index);

@interface ZZTabTableView : UIView
@property (nonatomic, copy) TabSelectedBlock tabBlock;
-(instancetype)initWithFrame:(CGRect)frame tabArray:(NSArray *)tabs;
-(void)resetSelectIndex:(NSInteger)index;
-(void)selectCellWithIndex:(NSInteger)index;
@end
