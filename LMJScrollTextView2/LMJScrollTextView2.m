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
    NSTimer * _timer;
    
    UILabel * _scrollLabel;
    
    NSInteger _index;
}

- (id)init{
    self = [super init];
    if (self) {
        
        self.clipsToBounds = YES;
        
        _index = 0;
        
        _textDataArr = @[@"您好"];
        _textFont    = [UIFont systemFontOfSize:12];
        _textColor   = [UIColor blackColor];
        _scrollLabel = nil;
        
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = YES;
        
        _index = 0;
        
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
    
    if (_scrollLabel == nil) {
        [self createScrollLabel];
    }
    
    _index = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:ScrollTime*3 target:self selector:@selector(scrollBottomToTop) userInfo:nil repeats:YES];
    [_timer fire];
}

- (void)startScrollTopToBottom{
    
    if (_scrollLabel == nil) {
        [self createScrollLabel];
    }
    
    _index = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:ScrollTime*3 target:self selector:@selector(scrollTopToBottom) userInfo:nil repeats:YES];
    [_timer fire];
}

- (void)stop{
    [_timer invalidate];
}



- (void)scrollBottomToTop{
    
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
        }];
    }];
}

- (void)scrollTopToBottom{
    
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
        }];
    }];
    
}

@end
