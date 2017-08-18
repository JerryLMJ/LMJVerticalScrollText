//
//  LMJScrollTextView2.m
//  LMJScrollText
//
//  Created by MajorLi on 15/5/4.
//  Copyright (c) 2015年 iOS开发者公会. All rights reserved.
//
//  iOS开发者公会-技术1群 QQ群号：87440292
//  iOS开发者公会-技术2群 QQ群号：232702419
//  iOS开发者公会-议事区  QQ群号：413102158
//


#import "LMJScrollTextView2.h"

#define ScrollTime 1.f

@implementation LMJScrollTextView2
{
    UILabel * _scrollLabel;
    
    NSInteger _index;
    
    BOOL _needStop;
    bool _isRunning;
}

- (id)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20); // 设置一个初始的frame
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = YES;
        
        _index = 0;
        _needStop  = NO;
        _isRunning = NO;
        
        _textDataArr = @[@"您好"];
        _textFont    = [UIFont systemFontOfSize:12];
        _textColor   = [UIColor blackColor];
        _scrollLabel = nil;
    }
    return self;
}

- (void)setTextFont:(UIFont *)textFont{
    _textFont = textFont;
    _scrollLabel.font = textFont;
}
- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    _scrollLabel.textColor = textColor;
}


- (void)createScrollLabel{
    _scrollLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height)];
    _scrollLabel.text          = @"";
    _scrollLabel.textAlignment = NSTextAlignmentCenter;
    _scrollLabel.textColor     = _textColor;
    _scrollLabel.font          = _textFont;
    [self addSubview:_scrollLabel];
}


- (void)startScrollBottomToTop{
    
    if (_isRunning) return;
    if (_scrollLabel == nil) [self createScrollLabel];
    
    _index     = 0;
    _needStop  = NO;
    _isRunning = YES;
    [self scrollBottomToTop];
}

- (void)startScrollTopToBottom{
    
    if (_isRunning) return;
    if (_scrollLabel == nil) [self createScrollLabel];
    
    _index     = 0;
    _needStop  = NO;
    _isRunning = YES;
    [self scrollTopToBottom];
}

- (void)stop{
    _needStop = YES;
}



- (void)scrollBottomToTop{
    
    if (![self isCurrentViewControllerVisible:[self viewController]]) {  // 处于非当前页面
        
        [self performSelector:@selector(scrollBottomToTop) withObject:nil afterDelay:ScrollTime*3];
        
    }else{                                                               // 处于当前页面
        
        if ([self.delegate respondsToSelector:@selector(scrollTextView2:currentTextIndex:)]) { // 代理回调
            [self.delegate scrollTextView2:self currentTextIndex:_index];
        }
        
        _scrollLabel.frame = CGRectMake(0, self.frame.size.height, _scrollLabel.frame.size.width, _scrollLabel.frame.size.height);
        _scrollLabel.text  = _textDataArr[_index];
        
        
        [UIView animateWithDuration:ScrollTime animations:^{
            
            _scrollLabel.frame = CGRectMake(0, 0, _scrollLabel.frame.size.width, _scrollLabel.frame.size.height);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:ScrollTime delay:ScrollTime options:0 animations:^{
                
                _scrollLabel.frame = CGRectMake(0, -self.frame.size.height, _scrollLabel.frame.size.width, _scrollLabel.frame.size.height);
                
            } completion:^(BOOL finished) {
                
                _index ++;
                if (_index == _textDataArr.count) {
                    _index = 0;
                }
                
                if (_needStop == NO) {
                    [self scrollBottomToTop];
                }else{
                    _isRunning = NO;
                }
            }];
        }];
    }
}

- (void)scrollTopToBottom{
    
    if (![self isCurrentViewControllerVisible:[self viewController]]) { // 处于非当前页面
        
        [self performSelector:@selector(scrollTopToBottom) withObject:nil afterDelay:ScrollTime*3];
        
    }else{                                                              // 处于当前页面
    
        if ([self.delegate respondsToSelector:@selector(scrollTextView2:currentTextIndex:)]) { // 代理回调
            [self.delegate scrollTextView2:self currentTextIndex:_index];
        }
        
        _scrollLabel.frame = CGRectMake(0, -self.frame.size.height, _scrollLabel.frame.size.width, _scrollLabel.frame.size.height);
        _scrollLabel.text  = _textDataArr[_index];
        
        
        
        [UIView animateWithDuration:ScrollTime animations:^{
            
            _scrollLabel.frame = CGRectMake(0, 0, _scrollLabel.frame.size.width, _scrollLabel.frame.size.height);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:ScrollTime delay:ScrollTime options:0 animations:^{
                
                _scrollLabel.frame = CGRectMake(0, self.frame.size.height, _scrollLabel.frame.size.width, _scrollLabel.frame.size.height);
                
            } completion:^(BOOL finished) {
                
                _index ++;
                if (_index == _textDataArr.count) {
                    _index = 0;
                }
                
                if (_needStop == NO) {
                    [self scrollTopToBottom];
                }else{
                    _isRunning = NO;
                }
            }];
        }];
    }
}


-(BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController{
    return (viewController.isViewLoaded && viewController.view.window && [UIApplication sharedApplication].applicationState == UIApplicationStateActive);
}

- (UIViewController *)viewController {
    for (UIView * next = [self superview]; next; next = next.superview) {
        UIResponder * nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
