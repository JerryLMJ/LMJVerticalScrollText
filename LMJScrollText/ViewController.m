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

@interface ViewController ()
{
    LMJScrollTextView2 * _scrollTextView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _scrollTextView = [[LMJScrollTextView2 alloc] initWithFrame:CGRectMake(20, 100, 200, 20)];
    _scrollTextView.backgroundColor = [UIColor blackColor];
    _scrollTextView.textColor       = [UIColor whiteColor];
    _scrollTextView.textFont        = [UIFont systemFontOfSize:12.f];
    _scrollTextView.textDataArr     = @[@"这是一条数据：一一一一一一",@"这是一条数据：二二二二二二",@"这是一条数据：三三三三三三",@"这是一条数据：四四四四四四",@"这是一条数据：五五五五五五",@"这是一条数据：六六六六六六"];
    [self.view addSubview:_scrollTextView];
    
    // [_scrollTextView startScrollBottomToTop];
    
    
    
    
    
    
    
    
    
    UIButton * startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    [startBtn setBackgroundColor:[UIColor lightGrayColor]];
    [startBtn setFrame:CGRectMake(20, 250, 90, 30)];
    [startBtn addTarget:self action:@selector(startAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    
    
    UIButton * stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [stopBtn setTitle:@"停止" forState:UIControlStateNormal];
    [stopBtn setBackgroundColor:[UIColor lightGrayColor]];
    [stopBtn setFrame:CGRectMake(20, 200, 90, 30)];
    [stopBtn addTarget:self action:@selector(stopAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
}



- (void)startAction{
    [_scrollTextView startScrollBottomToTop];
}
- (void)stopAction{
    [_scrollTextView stop];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
