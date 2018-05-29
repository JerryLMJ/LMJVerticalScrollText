//
//  AViewController.m
//  LMJScrollText
//
//  Created by Major on 2017/2/14.
//  Copyright © 2017年 iOS开发者工会. All rights reserved.
//

#import "DemoAddToCellViewController.h"

#import "LMJScrollTextView2.h"

@interface DemoAddToCellViewController () <UITableViewDelegate,UITableViewDataSource,LMJScrollTextView2Delegate>

@end

@implementation DemoAddToCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn setBackgroundColor:[UIColor lightGrayColor]];
    [backBtn setFrame:CGRectMake(20, 400, 90, 30)];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
        LMJScrollTextView2 * scrollview = [[LMJScrollTextView2 alloc] initWithFrame:CGRectMake(20, 10, 200, 20)];
        scrollview.delegate        = self;
        scrollview.backgroundColor = [UIColor blackColor];
        scrollview.textColor       = [UIColor whiteColor];
        scrollview.textFont        = [UIFont systemFontOfSize:12.f];
        scrollview.textDataArr     = @[@"这是一条数据：000000",@"这是一条数据：111111",@"这是一条数据：222222",@"这是一条数据：333333",@"这是一条数据：444444",@"这是一条数据：555555"];
        [cell addSubview:scrollview];
        if (indexPath.row %4 == 0) {
            [scrollview startScrollBottomToTopWithNoSpace];
        }else if (indexPath.row %4 == 1) {
            [scrollview startScrollTopToBottomWithNoSpace];
        }else if (indexPath.row %4 == 2) {
            [scrollview startScrollBottomToTopWithSpace];
        }else if (indexPath.row %4 == 3) {
            [scrollview startScrollTopToBottomWithSpace];
        }
    }
    return cell;
}

- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView currentTextIndex:(NSInteger)index{
    
}
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView clickIndex:(NSInteger)index content:(NSString *)content{
    
}

- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
