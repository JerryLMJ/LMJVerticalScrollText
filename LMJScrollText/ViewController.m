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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    LMJScrollTextView2 * scrollTextView = [[LMJScrollTextView2 alloc] initWithFrame:CGRectMake(20, 100, 200, 20)];
    scrollTextView.backgroundColor = [UIColor blackColor];
    scrollTextView.textColor       = [UIColor whiteColor];
    scrollTextView.textFont        = [UIFont systemFontOfSize:12.f];
    scrollTextView.textDataArr     = @[@"这是一条数据：一一一一一一",@"这是一条数据：二二二二二二二",@"这是一条数据：三三三三三三",@"这是一条数据：四四四四四四",@"这是一条数据：五五五五五五",@"这是一条数据：六六六六六六"];
    [self.view addSubview:scrollTextView];
    
    [scrollTextView startScrollBottomToTop];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
