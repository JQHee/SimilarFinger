//
//  ViewController.m
//  ZZFinger
//
//  Created by zry on 2017/12/28.
//  Copyright © 2017年 zry. All rights reserved.
//

#import "ViewController.h"
#import "ZZSameSetClassView.h"
#import "ZZVerticalTabView.h"
#import "ZZCollectionView.h"
#import "ZZTabTableView.h"
#import "UIView+Addition.h"

#define first_height    300
#define second_height       500
#define third_height            270
#define fourth_height           600

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) ZZSameSetClassView *sameSetClassView;
@property (nonatomic, strong) ZZTabTableView *tabView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZZCollectionView *collectView;
@property (nonatomic, strong) NSArray *tabs;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabs = @[@"课程目标",@"讲师经历",@"讲师问答",@"平台服务"];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [self configureSimilarClass];
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self configureClassDetail];
}


-(void)configureSameSetClass:(UIView *)superView
{
    if (![superView.subviews containsObject:self.sameSetClassView]) {
        ZZSameSetClassView *view = [[ZZSameSetClassView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.width, 100) array:@[@"1",@"2",@"3",@"4",@"5",@"6"]];
        self.sameSetClassView = view;
         [superView addSubview:self.sameSetClassView];
    }
   
}

-(void)configureClassDetail
{
        ZZTabTableView *tabView = [[ZZTabTableView alloc] initWithFrame:CGRectMake(0, 150, 85, self.tabs.count * 80) tabArray:self.tabs];
        __weak __typeof(self) weakSelf = self;
        tabView.tabBlock = ^(NSInteger index) {
            __strong __typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:(index + 1) inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        };
        [self.tableView addSubview:tabView];
        self.tabView = tabView;
    
 
}

//collection view
-(void)configureSimilarClass
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, (CGRectGetWidth(self.view.frame) - 20*3) / 2.0 * 3 + 20 * 2)];
    footerView.backgroundColor = [UIColor whiteColor];
    ZZCollectionView *view = [[ZZCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, (CGRectGetWidth(self.view.frame) - 20*3) / 2.0 * 3 + 20 * 2)];
    view.backgroundColor = [UIColor whiteColor];
    self.collectView = view;
    [footerView addSubview:self.collectView];
    self.tableView.tableFooterView = footerView;
  
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *heights = @[@150,@(first_height),@(second_height),@(third_height),@(fourth_height)];
    return [heights[indexPath.row] floatValue];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        [self configureSameSetClass:cell.contentView];
         return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell2"];
        }
        
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.00 green:(arc4random()%255)/255.00 blue:(arc4random()%255)/255.00 alpha:1];
        cell.backgroundView = view;
        
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        cell.detailTextLabel.text = @"和海关哈理工哈哈哈VB阿荣发货人；阿富汗发合肥啊；好";
        return cell;
        
    }
    return nil;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    return;
    CGFloat offsetY = self.tableView.contentOffset.y;
    CGFloat maxOffsetY = 150 + first_height +second_height + third_height + fourth_height - self.tabView.frame.size.height;
    CGFloat y = 0;
    CGFloat originalY = 150;
    if (offsetY <= 150) {
        self.tabView.top = 150;
    }else if (offsetY <= maxOffsetY){
        y = offsetY;
        self.tabView.top = y;
    }else{
        y = offsetY - originalY;
        self.tabView.bottom = maxOffsetY + self.tabView.frame.size.height;
    }
    
//    切换tab
    CGFloat first = 150;
    CGFloat second = first + first_height;
    CGFloat third = second + second_height;
    CGFloat fourth = third + third_height;
    CGFloat outHeight = fourth + fourth_height;
    
    NSInteger selectIndex = 0;
    if (offsetY + 100 < second) {
        selectIndex = 0;
    }else if (offsetY + 100 < third){
        selectIndex = 1;
    }else if (offsetY + 100 < fourth){
        selectIndex = 2;
    }else if (offsetY + 100 < outHeight){
        selectIndex = 3;
    }
    [self.tabView selectCellWithIndex:selectIndex];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
