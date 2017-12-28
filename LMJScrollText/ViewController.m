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
    _scrollTextView.textAlignment   = NSTextAlignmentCenter;
    _scrollTextView.touchEnable     = NO;
    _scrollTextView.textDataArr     = @[@"这是一条数据：000000",@"这是一条数据：111111",@"这是一条数据：222222",@"这是一条数据：333333",@"这是一条数据：444444",@"这是一条数据：555555"];
    [self.view addSubview:_scrollTextView];
    
    
    
    UIButton * actionBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn1 setTitle:@"Bottom to Top (NoSpace)" forState:UIControlStateNormal];
    [actionBtn1 setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn1 setFrame:CGRectMake(20, 200, 300, 30)];
    [actionBtn1 setTag:1001];
    [actionBtn1 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actionBtn1];
    
    
    UIButton * actionBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn2 setTitle:@"Top to Botton (NoSpace)" forState:UIControlStateNormal];
    [actionBtn2 setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn2 setFrame:CGRectMake(20, 250, 300, 30)];
    [actionBtn2 setTag:1002];
    [actionBtn2 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actionBtn2];
    
    
    UIButton * actionBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn3 setTitle:@"Bottom to Top (Space)" forState:UIControlStateNormal];
    [actionBtn3 setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn3 setFrame:CGRectMake(20, 300, 300, 30)];
    [actionBtn3 setTag:1003];
    [actionBtn3 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actionBtn3];
    
    
    UIButton * actionBtn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn4 setTitle:@"Top to Botton (Space)" forState:UIControlStateNormal];
    [actionBtn4 setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn4 setFrame:CGRectMake(20, 350, 300, 30)];
    [actionBtn4 setTag:1004];
    [actionBtn4 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actionBtn4];
    
    
    
    UIButton * stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [stopBtn setTitle:@"stop" forState:UIControlStateNormal];
    [stopBtn setBackgroundColor:[UIColor lightGrayColor]];
    [stopBtn setFrame:CGRectMake(20, 450, 90, 30)];
    [stopBtn setSelected:NO];
    [stopBtn addTarget:self action:@selector(stopAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBtn];
    
    
    
    
    
    UIButton * pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [pushBtn setTitle:@"NextPage" forState:UIControlStateNormal];
    [pushBtn setBackgroundColor:[UIColor lightGrayColor]];
    [pushBtn setFrame:CGRectMake(20, 600, 100, 30)];
    [pushBtn addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
}



- (void)startAction:(UIButton *)button{
    if (button.tag == 1001) {
        [_scrollTextView startScrollBottomToTopWithNoSpace];
    }else if (button.tag == 1002) {
        [_scrollTextView startScrollTopToBottomWithNoSpace];
    }else if (button.tag == 1003) {
        [_scrollTextView startScrollBottomToTopWithSpace];
    }else if (button.tag == 1004) {
        [_scrollTextView startScrollTopToBottomWithSpace];
    }
    
}

- (void)stopAction:(UIButton *)button{
    [_scrollTextView stop];
}

- (void)nextAction{
    AViewController * viewController = [[AViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

#pragma mark - LMJScrollTextView2 Delegate
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView currentTextIndex:(NSInteger)index{
    NSLog(@"当前是信息%ld",index);
}
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView clickIndex:(NSInteger)index content:(NSString *)content{
    NSLog(@"#####点击的是：第%ld条信息 内容：%@",index,content);
}


@end
