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
    
    
    
    
    
    
    
    
    
    UIButton * startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    [startBtn setBackgroundColor:[UIColor lightGrayColor]];
    [startBtn setFrame:CGRectMake(20, 200, 90, 30)];
    [startBtn addTarget:self action:@selector(startAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    
    
    UIButton * stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [stopBtn setTitle:@"停止" forState:UIControlStateNormal];
    [stopBtn setBackgroundColor:[UIColor lightGrayColor]];
    [stopBtn setFrame:CGRectMake(20, 250, 90, 30)];
    [stopBtn addTarget:self action:@selector(stopAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
}



- (void)startAction{
    [_scrollTextView startScrollBottomToTop];
}
- (void)stopAction{
    [_scrollTextView stop];
}




- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView currentTextIndex:(NSInteger)index{
    NSLog(@"当前是信息%ld",index);
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
