//
//  Demo-TableViewCellVC.m
//  LMJVerticalScrollTextExample
//
//  Created by LiMingjie on 2019/5/22.
//  Copyright © 2019 LMJ. All rights reserved.
//

#import "Demo_TableViewCellVC.h"

#import "LMJVerticalScrollText.h"

@interface Demo_TableViewCellVC () <UITableViewDelegate,UITableViewDataSource,LMJVerticalScrollTextDelegate>

@end

@implementation Demo_TableViewCellVC

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
        LMJVerticalScrollText * verticalScrollText = [[LMJVerticalScrollText alloc] initWithFrame:CGRectMake(20, 10, 200, 20)];
        verticalScrollText.delegate        = self;
        verticalScrollText.backgroundColor = [UIColor blackColor];
        verticalScrollText.textColor       = [UIColor whiteColor];
        verticalScrollText.textFont        = [UIFont systemFontOfSize:12.f];
        verticalScrollText.textDataArr     = @[@"这是一条数据：000000",@"这是一条数据：111111",@"这是一条数据：222222",@"这是一条数据：333333",@"这是一条数据：444444",@"这是一条数据：555555"];
        [cell addSubview:verticalScrollText];
        if (indexPath.row %4 == 0) {
            [verticalScrollText startScrollBottomToTopWithNoSpace];
        }else if (indexPath.row %4 == 1) {
            [verticalScrollText startScrollTopToBottomWithNoSpace];
        }else if (indexPath.row %4 == 2) {
            [verticalScrollText startScrollBottomToTopWithSpace];
        }else if (indexPath.row %4 == 3) {
            [verticalScrollText startScrollTopToBottomWithSpace];
        }
    }
    return cell;
}

- (void)verticalScrollText:(LMJVerticalScrollText *)scrollText currentTextIndex:(NSInteger)index{
    
}
- (void)verticalScrollText:(LMJVerticalScrollText *)scrollText clickIndex:(NSInteger)index content:(NSString *)content{
    
}

- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
