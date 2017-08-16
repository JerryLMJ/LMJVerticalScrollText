//
//  ViewController.m
//  LMJScrollText
//
//  Created by MajorLi on 15/5/4.
//  Copyright (c) 2015年 iOS开发者公会. All rights reserved.
//
//  iOS开发者公会-技术1群 QQ群号：87440292
//  iOS开发者公会-技术2群 QQ群号：232702419
//  iOS开发者公会-议事区  QQ群号：413102158
//

#import "ViewController.h"

#import "LMJScrollTextView2.h"

#import "AViewController.h"

@interface ViewController () <LMJScrollTextView2Delegate>
{
    LMJScrollTextView2 * _scrollTextView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _scrollTextView = [[LMJScrollTextView2 alloc] initWithFrame:CGRectMake(20, 100, 200, 20)];
    _scrollTextView.delegate        = self;
    _scrollTextView.backgroundColor = [UIColor blackColor];
    _scrollTextView.textColor       = [UIColor whiteColor];
    _scrollTextView.textFont        = [UIFont systemFontOfSize:12.f];
    _scrollTextView.textDataArr     = @[@"这是一条数据：000000",@"这是一条数据：111111",@"这是一条数据：222222",@"这是一条数据：333333",@"这是一条数据：444444",@"这是一条数据：555555"];
    [self.view addSubview:_scrollTextView];
    
    // [_scrollTextView startScrollBottomToTop];
    
    

    
    
    UIButton * actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn setTitle:@"开始" forState:UIControlStateNormal];
    [actionBtn setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn setFrame:CGRectMake(20, 200, 90, 30)];
    [actionBtn setSelected:NO];
    [actionBtn addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actionBtn];
    
    
    UIButton * pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [pushBtn setTitle:@"next" forState:UIControlStateNormal];
    [pushBtn setBackgroundColor:[UIColor lightGrayColor]];
    [pushBtn setFrame:CGRectMake(20, 400, 90, 30)];
    [pushBtn addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}



- (void)startAction:(UIButton *)button{
    if (button.selected) {
        button.selected = NO;
        [button setTitle:@"开始" forState:UIControlStateNormal];
        [_scrollTextView stop];
        
    }else{
        button.selected = YES;
        [button setTitle:@"停止" forState:UIControlStateNormal];
        [_scrollTextView startScrollBottomToTop];
    }
    
}

- (void)nextAction{
    AViewController * viewController = [[AViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView currentTextIndex:(NSInteger)index{
    NSLog(@"当前是信息%ld",index);
}



@end
