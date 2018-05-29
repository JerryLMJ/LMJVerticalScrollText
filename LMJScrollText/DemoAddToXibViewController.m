//
//  DemoAddToXibViewController.m
//  LMJScrollText
//
//  Created by LiMingjie on 2018/5/29.
//  Copyright © 2018年 iOS开发者工会. All rights reserved.
//

#import "DemoAddToXibViewController.h"

#import "LMJScrollTextView2.h"

@interface DemoAddToXibViewController () <LMJScrollTextView2Delegate>

@property (weak, nonatomic) IBOutlet LMJScrollTextView2 *scrollTextView;

@end

@implementation DemoAddToXibViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn setBackgroundColor:[UIColor lightGrayColor]];
    [backBtn setFrame:CGRectMake(20, 400, 90, 30)];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    
    
    
    
    
    _scrollTextView.delegate            = self;
    _scrollTextView.textStayTime        = 2;
    _scrollTextView.scrollAnimationTime = 1;
    _scrollTextView.textColor           = [UIColor greenColor];
    _scrollTextView.textFont            = [UIFont boldSystemFontOfSize:15.f];
    _scrollTextView.textAlignment       = NSTextAlignmentCenter;
    _scrollTextView.touchEnable         = YES;
    
    
    
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:@"这是最后一条数据："];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:@"icon"];
    textAttachment.bounds = CGRectMake(0, -4, 15, 15);
    NSAttributedString *attachmentAttrStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attrStr insertAttributedString:attachmentAttrStr atIndex:attrStr.length];
    
    _scrollTextView.textDataArr = @[@"这是一条数据：000000",@"这是一条数据：111111",@"这是一条数据：222222",@"这是一条数据：333333",@"这是一条数据：444444",@"这是一条数据：555555",attrStr];
    
    
    [_scrollTextView startScrollBottomToTopWithNoSpace];
}



#pragma mark - LMJScrollTextView2 Delegate
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView currentTextIndex:(NSInteger)index{
    NSLog(@"当前是信息%ld",index);
}
- (void)scrollTextView2:(LMJScrollTextView2 *)scrollTextView clickIndex:(NSInteger)index content:(NSString *)content{
    NSLog(@"#####点击的是：第%ld条信息 内容：%@",index,content);
}






- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
