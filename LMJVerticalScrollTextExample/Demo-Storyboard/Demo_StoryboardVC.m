//
//  Demo_StoryboardVC.m
//  LMJVerticalScrollTextExample
//
//  Created by LiMingjie on 2019/5/22.
//  Copyright © 2019 LMJ. All rights reserved.
//

#import "Demo_StoryboardVC.h"

#import "LMJVerticalScrollText.h"

@interface Demo_StoryboardVC () <LMJVerticalScrollTextDelegate>
@property (weak, nonatomic) IBOutlet LMJVerticalScrollText *verticalScrollText;

@end

@implementation Demo_StoryboardVC

- (void)viewDidLoad{
    [super viewDidLoad];
    
    
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn setBackgroundColor:[UIColor lightGrayColor]];
    [backBtn setFrame:CGRectMake(20, 400, 90, 30)];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    
    
    
    
    
    _verticalScrollText.delegate            = self;
    _verticalScrollText.textStayTime        = 2;
    _verticalScrollText.scrollAnimationTime = 1;
    _verticalScrollText.textColor           = [UIColor greenColor];
    _verticalScrollText.textFont            = [UIFont boldSystemFontOfSize:15.f];
    _verticalScrollText.textAlignment       = NSTextAlignmentCenter;
    _verticalScrollText.touchEnable         = YES;
    
    
    
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:@"这是最后一条数据："];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:@"icon"];
    textAttachment.bounds = CGRectMake(0, -4, 15, 15);
    NSAttributedString *attachmentAttrStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attrStr insertAttributedString:attachmentAttrStr atIndex:attrStr.length];
    
    _verticalScrollText.textDataArr = @[@"这是一条数据：000000",@"这是一条数据：111111",@"这是一条数据：222222",@"这是一条数据：333333",@"这是一条数据：444444",@"这是一条数据：555555",attrStr];
    
    
    [_verticalScrollText startScrollBottomToTopWithNoSpace];
}



#pragma mark - LMJScrollTextView2 Delegate
- (void)verticalScrollText:(LMJVerticalScrollText *)scrollText currentTextIndex:(NSInteger)index{
    NSLog(@"当前是信息%ld",index);
}
- (void)verticalScrollText:(LMJVerticalScrollText *)scrollText clickIndex:(NSInteger)index content:(NSString *)content{
    NSLog(@"#####点击的是：第%ld条信息 内容：%@",index,content);
}






- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
