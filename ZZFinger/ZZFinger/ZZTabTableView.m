//
//  ZZTabTableView.m
//  ZZFinger
//
//  Created by zry on 2018/1/2.
//  Copyright © 2018年 zry. All rights reserved.
//

#import "ZZTabTableView.h"

@interface ZZTabTableView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tabTable;//tableView
@property (nonatomic, strong) UIView *sliderLine;//红线
@property (nonatomic, strong) NSArray *tabs;
@end


@implementation ZZTabTableView
-(instancetype)initWithFrame:(CGRect)frame tabArray:(NSArray *)tabs
{
    self = [super initWithFrame:frame];
    self.tabs = tabs;
    [self configureTab];
    return self;
}

-(void)configureTab
{
    UIView *red = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 80)];
    red.backgroundColor = [UIColor redColor];
    [self addSubview:red];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(5, 0, CGRectGetWidth(self.frame) - CGRectGetWidth(red.frame), CGRectGetHeight(self.frame)) style:UITableViewStylePlain];
    table.backgroundColor = [UIColor lightGrayColor];
    table.delegate = self;
    table.dataSource = self;
    table.rowHeight = 80;
    [self addSubview:table];
    
    self.sliderLine = red;
    self.tabTable = table;
}

-(void)resetSelectIndex:(NSInteger)index
{
    if (index >= self.tabs.count) {
        return;
    }
    [UIView animateWithDuration:.3 animations:^{
        self.sliderLine.frame = CGRectMake(0, index *80, 5, 80);
        UITableViewCell *cell = [self.tabTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
        cell.backgroundColor = [UIColor whiteColor];
    }];
 
    if (self.tabBlock) {
        self.tabBlock(index);
    }

}

-(void)selectCellWithIndex:(NSInteger)index
{
    [self.tabTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    [UIView animateWithDuration:.3 animations:^{
        self.sliderLine.frame = CGRectMake(0, index *80, 5, 80);
        UITableViewCell *cell = [self.tabTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
        cell.backgroundColor = [UIColor whiteColor];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tabs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tabCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tabCell"];
    }
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor lightGrayColor];
    cell.backgroundView =bgView;
    cell.textLabel.text = self.tabs[indexPath.row];
    [tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:(UITableViewScrollPositionNone)];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self resetSelectIndex:indexPath.row];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
