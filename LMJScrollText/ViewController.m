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

#import "DemoAddToCellViewController.h"
#import "DemoAddToXibViewController.h"

@interface ViewController () <LMJScrollTextView2Delegate>
{
    LMJScrollTextView2 * _scrollTextView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _scrollTextView = [[LMJScrollTextView2 alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
    _scrollTextView.delegate            = self;
    _scrollTextView.textStayTime        = 2;
    _scrollTextView.scrollAnimationTime = 1;
    _scrollTextView.backgroundColor     = [UIColor colorWithRed:64/255.f green:151/255.f blue:255/255.f alpha:0.5];
    _scrollTextView.textColor           = [UIColor whiteColor];
    _scrollTextView.textFont            = [UIFont boldSystemFontOfSize:15.f];
    _scrollTextView.textAlignment       = NSTextAlignmentCenter;
    _scrollTextView.touchEnable         = YES;
    _scrollTextView.layer.cornerRadius  = 3;
    [self.view addSubview:_scrollTextView];
    
    
    
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:@"这是最后一条数据："];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:@"icon"];
    textAttachment.bounds = CGRectMake(0, -4, 15, 15);
    NSAttributedString *attachmentAttrStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attrStr insertAttributedString:attachmentAttrStr atIndex:attrStr.length];

    _scrollTextView.textDataArr = @[@"这是一条数据：000000",@"这是一条数据：111111",@"这是一条数据：222222",@"这是一条数据：333333",@"这是一条数据：444444",@"这是一条数据：555555",attrStr];
    
    
    
    
    
    UIButton * stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [stopBtn setTitle:@"stop" forState:UIControlStateNormal];
    [stopBtn setBackgroundColor:[UIColor redColor]];
    [stopBtn setFrame:CGRectMake(_scrollTextView.frame.origin.x +_scrollTextView.frame.size.width +20, _scrollTextView.frame.origin.y, 90, 30)];
    [stopBtn setSelected:NO];
    [stopBtn addTarget:self action:@selector(stopAction:) forControlEvents:UIControlEventTouchUpInside];
    stopBtn.layer.cornerRadius = 3;
    [self.view addSubview:stopBtn];
    
    
    
    
    
    UIButton * actionBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn1 setTitle:@"Bottom to Top (NoSpace)--start" forState:UIControlStateNormal];
    [actionBtn1 setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn1 setFrame:CGRectMake(20, 200, 300, 30)];
    [actionBtn1 setTag:1001];
    [actionBtn1 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    actionBtn1.layer.cornerRadius = 3;
    [self.view addSubview:actionBtn1];
    
    
    UIButton * actionBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn2 setTitle:@"Top to Bottom (NoSpace)--start" forState:UIControlStateNormal];
    [actionBtn2 setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn2 setFrame:CGRectMake(20, 250, 300, 30)];
    [actionBtn2 setTag:1002];
    [actionBtn2 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    actionBtn2.layer.cornerRadius = 3;
    [self.view addSubview:actionBtn2];
    
    
    UIButton * actionBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn3 setTitle:@"Bottom to Top (Space)--start" forState:UIControlStateNormal];
    [actionBtn3 setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn3 setFrame:CGRectMake(20, 300, 300, 30)];
    [actionBtn3 setTag:1003];
    [actionBtn3 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    actionBtn3.layer.cornerRadius = 3;
    [self.view addSubview:actionBtn3];
    
    
    UIButton * actionBtn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn4 setTitle:@"Top to Bottom (Space)--start" forState:UIControlStateNormal];
    [actionBtn4 setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn4 setFrame:CGRectMake(20, 350, 300, 30)];
    [actionBtn4 setTag:1004];
    [actionBtn4 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    actionBtn4.layer.cornerRadius = 3;
    [self.view addSubview:actionBtn4];
    
    
    
    

    
    
    
    
    
    
    
    UIButton * demoAddToCellPageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [demoAddToCellPageBtn setTitle:@"DemoAddToCellPage >>>" forState:UIControlStateNormal];
    [demoAddToCellPageBtn setBackgroundColor:[UIColor grayColor]];
    [demoAddToCellPageBtn setFrame:CGRectMake(20, 500, 250, 30)];
    [demoAddToCellPageBtn addTarget:self action:@selector(clickDemoAddToCellPageBtn) forControlEvents:UIControlEventTouchUpInside];
    demoAddToCellPageBtn.layer.cornerRadius = 3;
    [self.view addSubview:demoAddToCellPageBtn];
    
    
    UIButton * demoAddToXibPageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [demoAddToXibPageBtn setTitle:@"DemoAddToXibPage >>>" forState:UIControlStateNormal];
    [demoAddToXibPageBtn setBackgroundColor:[UIColor grayColor]];
    [demoAddToXibPageBtn setFrame:CGRectMake(20, 550, 250, 30)];
    [demoAddToXibPageBtn addTarget:self action:@selector(clickDemoAddToXibPageBtn) forControlEvents:UIControlEventTouchUpInside];
    demoAddToXibPageBtn.layer.cornerRadius = 3;
    [self.view addSubview:demoAddToXibPageBtn];
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

- (void)clickDemoAddToCellPageBtn{
    DemoAddToCellViewController * viewController = [[DemoAddToCellViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}
- (void)clickDemoAddToXibPageBtn{
    DemoAddToXibViewController * viewController = [[UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"DemoAddToXibViewController"];
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
