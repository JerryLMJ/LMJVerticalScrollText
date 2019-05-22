//
//  Demo_BaseVC.m
//  LMJVerticalScrollTextExample
//
//  Created by LiMingjie on 2019/5/22.
//  Copyright © 2019 LMJ. All rights reserved.
//

#import "Demo_BaseVC.h"
#import "Demo_TableViewCellVC.h"
#import "Demo_StoryboardVC.h"

#import "LMJVerticalScrollText.h"

@interface Demo_BaseVC ()
{
    LMJVerticalScrollText * _verticalScrollText;
}
@end

@implementation Demo_BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView * bgView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview: bgView];
    
    
    
    
    _verticalScrollText = [[LMJVerticalScrollText alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
    _verticalScrollText.delegate            = self;
    _verticalScrollText.textStayTime        = 2;
    _verticalScrollText.scrollAnimationTime = 1;
    _verticalScrollText.backgroundColor     = [UIColor colorWithRed:64/255.f green:151/255.f blue:255/255.f alpha:0.5];
    _verticalScrollText.textColor           = [UIColor whiteColor];
    _verticalScrollText.textFont            = [UIFont boldSystemFontOfSize:15.f];
    _verticalScrollText.textAlignment       = NSTextAlignmentCenter;
    _verticalScrollText.touchEnable         = YES;
    _verticalScrollText.textDataArr         = [self getScrollTextData];
    _verticalScrollText.layer.cornerRadius  = 3;
    [bgView addSubview:_verticalScrollText];
    
    
    
    
    
 
    
    // stop button
    UIButton * stopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [stopBtn setTitle:@"stop" forState:UIControlStateNormal];
    [stopBtn setBackgroundColor:[UIColor redColor]];
    [stopBtn setFrame:CGRectMake(_verticalScrollText.frame.origin.x +_verticalScrollText.frame.size.width +20, _verticalScrollText.frame.origin.y, 90, 30)];
    [stopBtn setSelected:NO];
    [stopBtn addTarget:self action:@selector(stopAction:) forControlEvents:UIControlEventTouchUpInside];
    stopBtn.layer.cornerRadius = 3;
    [bgView addSubview:stopBtn];
    
    
    // menu button 1
    UIButton * actionBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn1 setTitle:@"Bottom to Top (NoSpace)--start" forState:UIControlStateNormal];
    [actionBtn1 setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn1 setFrame:CGRectMake(20, 200, 300, 30)];
    [actionBtn1 setTag:1001];
    [actionBtn1 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    actionBtn1.layer.cornerRadius = 3;
    [bgView addSubview:actionBtn1];
    
    // menu button 2
    UIButton * actionBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn2 setTitle:@"Top to Bottom (NoSpace)--start" forState:UIControlStateNormal];
    [actionBtn2 setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn2 setFrame:CGRectMake(20, 250, 300, 30)];
    [actionBtn2 setTag:1002];
    [actionBtn2 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    actionBtn2.layer.cornerRadius = 3;
    [bgView addSubview:actionBtn2];
    
    // menu button 3
    UIButton * actionBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn3 setTitle:@"Bottom to Top (Space)--start" forState:UIControlStateNormal];
    [actionBtn3 setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn3 setFrame:CGRectMake(20, 300, 300, 30)];
    [actionBtn3 setTag:1003];
    [actionBtn3 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    actionBtn3.layer.cornerRadius = 3;
    [bgView addSubview:actionBtn3];
    
    // menu button 4
    UIButton * actionBtn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionBtn4 setTitle:@"Top to Bottom (Space)--start" forState:UIControlStateNormal];
    [actionBtn4 setBackgroundColor:[UIColor lightGrayColor]];
    [actionBtn4 setFrame:CGRectMake(20, 350, 300, 30)];
    [actionBtn4 setTag:1004];
    [actionBtn4 addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    actionBtn4.layer.cornerRadius = 3;
    [bgView addSubview:actionBtn4];
    
    
    
    // go to next page button 1
    UIButton * demoAddToCellPageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [demoAddToCellPageBtn setTitle:@"DemoAddToCellPage >>>" forState:UIControlStateNormal];
    [demoAddToCellPageBtn setBackgroundColor:[UIColor grayColor]];
    [demoAddToCellPageBtn setFrame:CGRectMake(20, 500, 250, 30)];
    [demoAddToCellPageBtn addTarget:self action:@selector(clickDemoAddToCellPageBtn) forControlEvents:UIControlEventTouchUpInside];
    demoAddToCellPageBtn.layer.cornerRadius = 3;
    [bgView addSubview:demoAddToCellPageBtn];
    
    // go to next page button 2
    UIButton * demoAddToXibPageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [demoAddToXibPageBtn setTitle:@"DemoAddToXibPage >>>" forState:UIControlStateNormal];
    [demoAddToXibPageBtn setBackgroundColor:[UIColor grayColor]];
    [demoAddToXibPageBtn setFrame:CGRectMake(20, 550, 250, 30)];
    [demoAddToXibPageBtn addTarget:self action:@selector(clickDemoAddToXibPageBtn) forControlEvents:UIControlEventTouchUpInside];
    demoAddToXibPageBtn.layer.cornerRadius = 3;
    [bgView addSubview:demoAddToXibPageBtn];
}


- (NSArray *)getScrollTextData{
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:@"这是带图片的数据："];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:@"icon"];
    textAttachment.bounds = CGRectMake(0, -4, 15, 15);
    NSAttributedString *attachmentAttrStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attrStr insertAttributedString:attachmentAttrStr atIndex:attrStr.length];
    
    return @[@"这是一条数据：000000",@"这是一条数据：111111",@"这是一条数据：222222",attrStr];
}


- (void)startAction:(UIButton *)button{
    if (button.tag == 1001) {
        [_verticalScrollText startScrollBottomToTopWithNoSpace];
        
    }else if (button.tag == 1002) {
        [_verticalScrollText startScrollTopToBottomWithNoSpace];
        
    }else if (button.tag == 1003) {
        [_verticalScrollText startScrollBottomToTopWithSpace];
        
    }else if (button.tag == 1004) {
        [_verticalScrollText startScrollTopToBottomWithSpace];
    }
    
}

- (void)stopAction:(UIButton *)button{
    [_verticalScrollText stop];
}

- (void)clickDemoAddToCellPageBtn{
    Demo_TableViewCellVC * vc = [[Demo_TableViewCellVC alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)clickDemoAddToXibPageBtn{
    Demo_StoryboardVC * vc = [[UIStoryboard storyboardWithName:@"Demo" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"Demo_StoryboardVC"];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - LMJScrollTextView2 Delegate
- (void)verticalScrollText:(LMJVerticalScrollText *)scrollText currentTextIndex:(NSInteger)index{
    NSLog(@"当前是信息%ld",index);
}
- (void)verticalScrollText:(LMJVerticalScrollText *)scrollText clickIndex:(NSInteger)index content:(NSString *)content{
    NSLog(@"#####点击的是：第%ld条信息 内容：%@",index,content);
}

@end
