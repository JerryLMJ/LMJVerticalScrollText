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

@interface UIView (LMJScrollTextView2Extension)

@property (nonatomic) CGFloat lmj_top;
@property (nonatomic) CGFloat lmj_right;
@property (nonatomic) CGFloat lmj_bottom;
@property (nonatomic) CGFloat lmj_left;
@property (nonatomic) CGFloat lmj_width;
@property (nonatomic) CGFloat lmj_height;

@end

@implementation UIView (LMJScrollTextView2Extension)
// getter
- (CGFloat)lmj_top{
    return self.frame.origin.y;
}
- (CGFloat)lmj_right{
    return self.frame.origin.x + self.frame.size.width;
}
- (CGFloat)lmj_bottom{
    return self.frame.origin.y + self.frame.size.height;
}
- (CGFloat)lmj_left{
    return self.frame.origin.x;
}
- (CGFloat)lmj_width{
    return self.frame.size.width;
}
- (CGFloat)lmj_height{
    return self.frame.size.height;
}
// setter
- (void)setLmj_top:(CGFloat)lmj_top{
    self.frame = CGRectMake(self.lmj_left, lmj_top, self.lmj_width, self.lmj_height);
}
- (void)setLmj_right:(CGFloat)lmj_right{
    self.frame = CGRectMake(lmj_right -self.lmj_width, self.lmj_top, self.lmj_width, self.lmj_height);
}
- (void)setLmj_bottom:(CGFloat)lmj_bottom{
    self.frame = CGRectMake(self.lmj_left, lmj_bottom-self.lmj_height, self.lmj_width, self.lmj_height);
}
- (void)setLmj_left:(CGFloat)lmj_left{
    self.frame = CGRectMake(lmj_left, self.lmj_top, self.lmj_width, self.lmj_height);
}
- (void)setLmj_width:(CGFloat)lmj_width{
    self.frame = CGRectMake(self.lmj_left, self.lmj_top, lmj_width, self.lmj_height);
}
- (void)setLmj_height:(CGFloat)lmj_height{
    self.frame = CGRectMake(self.lmj_left, self.lmj_top, self.lmj_width, lmj_height);
}
@end






@interface UILabel (LMJScrollTextView2Extension)

@property (nonatomic) id lmj_text;

@end

@implementation UILabel (LMJScrollTextView2Extension)
- (id)lmj_text{
    return self.text;
}
- (void)setLmj_text:(id)lmj_text{
    if ([lmj_text isKindOfClass:[NSAttributedString class]]) {
        self.attributedText = lmj_text;
    }else if ([lmj_text isKindOfClass:[NSString class]]) {
        self.text = lmj_text;
    }
}
@end








@implementation LMJScrollTextView2
{
    UITapGestureRecognizer * _tapGesture;
    
    UILabel * _currentScrollLabel;
    UILabel * _standbyScrollLabel;

    NSInteger _index;
    
    BOOL _needStop;
    BOOL _isRunning;
    
    BOOL _isHaveSpace;
}
#pragma mark - Init
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
        [self setInitialSettings];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setInitialSettings];
}

- (void)setInitialSettings{
    
    self.clipsToBounds = YES;
    
    _index = 0;
    
    _needStop  = NO;
    _isRunning = NO;
    
    _isHaveSpace = NO;
    
    _textDataArr   = @[];
    
    _textStayTime  = 3;
    _scrollAnimationTime = 1;
    
    _textFont      = [UIFont systemFontOfSize:12];
    _textColor     = [UIColor blackColor];
    _textAlignment = NSTextAlignmentLeft;
    
    _currentScrollLabel = nil;
    _standbyScrollLabel = nil;
    
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction)];
    [self addGestureRecognizer:_tapGesture];
    
    _touchEnable = YES;
}

- (void)clickAction{
    if ([self isCurrentViewControllerVisible:[self viewController]] && self.delegate && [self.delegate respondsToSelector:@selector(scrollTextView2:clickIndex:content:)]) {
        [self.delegate scrollTextView2:self clickIndex:_index content:[_textDataArr[_index] copy]];
    }
}

#pragma mark - Set
- (void)setTextFont:(UIFont *)textFont{
    _textFont = textFont;
    _currentScrollLabel.font = textFont;
    _standbyScrollLabel.font = textFont;
}
- (void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    _currentScrollLabel.textColor = textColor;
    _standbyScrollLabel.textColor = textColor;
}
- (void)setTextAlignment:(NSTextAlignment)textAlignment{
    _textAlignment = textAlignment;
    _currentScrollLabel.textAlignment = textAlignment;
    _standbyScrollLabel.textAlignment = textAlignment;
}

- (void)setTouchEnable:(BOOL)touchEnable{
    _touchEnable = touchEnable;
    if (_touchEnable) {
        if (!_tapGesture) {
            _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction)];
            [self addGestureRecognizer:_tapGesture];
        }
    }else{
        if (_tapGesture) {
            [self removeGestureRecognizer:_tapGesture];
        }
        _tapGesture = nil;
    }
}

#pragma mark - Start
- (void)startScrollBottomToTopWithSpace{
    [self stop];
    if (_isRunning) {
        [self performSelector:@selector(startScrollBottomToTopWithSpace) withObject:nil afterDelay:0.5f];
        return;
    }
    _isHaveSpace = YES;
    [self resetStateToEmpty];
    [self createScrollLabelNeedStandbyLabel:NO];
    [self scrollWithSpaceByDirection:@(1)];
}

- (void)startScrollTopToBottomWithSpace{
    [self stop];
    if (_isRunning) {
        [self performSelector:@selector(startScrollTopToBottomWithSpace) withObject:nil afterDelay:0.5f];
        return;
    }
    _isHaveSpace = YES;
    [self resetStateToEmpty];
    [self createScrollLabelNeedStandbyLabel:NO];
    [self scrollWithSpaceByDirection:@(-1)];
}

- (void)startScrollBottomToTopWithNoSpace{
    [self stop];
    if (_isRunning) {
        [self performSelector:@selector(startScrollBottomToTopWithNoSpace) withObject:nil afterDelay:0.5f];
        return;
    }
    _isHaveSpace = NO;
    [self resetStateToEmpty];
    [self createScrollLabelNeedStandbyLabel:YES];
    [self scrollWithNoSpaceByDirection:@(1)];
}
- (void)startScrollTopToBottomWithNoSpace{
    [self stop];
    if (_isRunning) {
        [self performSelector:@selector(startScrollTopToBottomWithNoSpace) withObject:nil afterDelay:0.5f];
        return;
    }
    _isHaveSpace = NO;
    [self resetStateToEmpty];
    [self createScrollLabelNeedStandbyLabel:YES];
    [self scrollWithNoSpaceByDirection:@(-1)];
}
#pragma mark - Stop
- (void)stop{
    _needStop = YES;
}

- (void)stopToEmpty{
    _needStop = YES;
    [self resetStateToEmpty];
}
#pragma mark - Clear / Create
- (void)resetStateToEmpty{
    if (_currentScrollLabel) {
        [_currentScrollLabel removeFromSuperview];
        _currentScrollLabel = nil;
    }
    if (_standbyScrollLabel) {
        [_standbyScrollLabel removeFromSuperview];
        _standbyScrollLabel = nil;
    }
    
    _index = 0;
    _needStop = NO;
}


- (void)createScrollLabelNeedStandbyLabel:(BOOL)isNeed{
    _currentScrollLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _currentScrollLabel.textAlignment = _textAlignment;
    _currentScrollLabel.textColor     = _textColor;
    _currentScrollLabel.font          = _textFont;
    [self addSubview:_currentScrollLabel];
    
    if (isNeed) {
        _standbyScrollLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -100, self.frame.size.width, self.frame.size.height)];
        _standbyScrollLabel.textAlignment = _textAlignment;
        _standbyScrollLabel.textColor     = _textColor;
        _standbyScrollLabel.font          = _textFont;
        [self addSubview:_standbyScrollLabel];
    }
}


#pragma mark - Scroll Action
- (void)scrollWithNoSpaceByDirection:(NSNumber *)direction{
    // 处于非当前页面，延迟尝试
    if (![self isCurrentViewControllerVisible:[self viewController]]) {
        [self performSelector:@selector(scrollWithNoSpaceByDirection:) withObject:direction afterDelay:3.f];
        
        
    // 处于当前页面
    }else{
        if (_textDataArr.count == 0) {
            _isRunning = NO;
            return;
        }else{
            _isRunning = YES;
        }
        
        _currentScrollLabel.lmj_text  = _textDataArr[_index];
        _standbyScrollLabel.lmj_text  = _textDataArr[[self nextIndex:_index]];
        _standbyScrollLabel.frame = CGRectMake(0, self.lmj_height*direction.integerValue, _standbyScrollLabel.lmj_width, _standbyScrollLabel.lmj_height);
        
        
        if ([self isCurrentViewControllerVisible:[self viewController]] && self.delegate && [self.delegate respondsToSelector:@selector(scrollTextView2:currentTextIndex:)]) { // 代理回调
            [self.delegate scrollTextView2:self currentTextIndex:_index];
        }
        

        [UIView animateWithDuration:_scrollAnimationTime delay:_textStayTime options:UIViewAnimationOptionLayoutSubviews animations:^{
            
            _currentScrollLabel.frame = CGRectMake(0, -self.lmj_height*direction.integerValue, _currentScrollLabel.lmj_width, _currentScrollLabel.lmj_height);
            _standbyScrollLabel.frame = CGRectMake(0, 0, _standbyScrollLabel.lmj_width, _standbyScrollLabel.lmj_height);
            
        } completion:^(BOOL finished) {
        
            _index = [self nextIndex:_index];
            
            UILabel * temp = _currentScrollLabel;
            _currentScrollLabel = _standbyScrollLabel;
            _standbyScrollLabel = temp;
            
            if (_needStop) {
                _isRunning = NO;
            }else{
                [self performSelector:@selector(scrollWithNoSpaceByDirection:) withObject:direction];
            }
        }];
    }
}



- (void)scrollWithSpaceByDirection:(NSNumber *)direction{
    
    // 处于非当前页面，延迟尝试
    if (![self isCurrentViewControllerVisible:[self viewController]]) {
        [self performSelector:@selector(scrollWithSpaceByDirection:) withObject:direction afterDelay:3.f];
   
    // 处于当前页面
    }else{
        if (_textDataArr.count == 0) {
            _isRunning = NO;
            return;
        }else{
            _isRunning = YES;
        }
        
        _currentScrollLabel.lmj_text  = _textDataArr[_index];
        _currentScrollLabel.frame = CGRectMake(0, 0, _currentScrollLabel.lmj_width, _currentScrollLabel.lmj_height);
        
        
        if ([self isCurrentViewControllerVisible:[self viewController]] && self.delegate && [self.delegate respondsToSelector:@selector(scrollTextView2:currentTextIndex:)]) { // 代理回调
            [self.delegate scrollTextView2:self currentTextIndex:_index];
        }
        
        
        [UIView animateWithDuration:_scrollAnimationTime/2.f delay:_textStayTime options:UIViewAnimationOptionLayoutSubviews animations:^{
            _currentScrollLabel.frame = CGRectMake(0, -self.lmj_height*direction.integerValue, _currentScrollLabel.lmj_width, _currentScrollLabel.lmj_height);
            
        } completion:^(BOOL finished) {
            
            _currentScrollLabel.frame = CGRectMake(0, self.lmj_height*direction.integerValue, _currentScrollLabel.lmj_width, _currentScrollLabel.lmj_height);
            _index = [self nextIndex:_index];
            _currentScrollLabel.lmj_text  = _textDataArr[_index];
            

            [UIView animateWithDuration:_scrollAnimationTime/2.f animations:^{
                _currentScrollLabel.frame = CGRectMake(0, 0, _currentScrollLabel.lmj_width, _currentScrollLabel.lmj_height);
                
            } completion:^(BOOL finished) {
                
                if (_needStop) {
                    _isRunning = NO;
                }else{
                    [self performSelector:@selector(scrollWithSpaceByDirection:) withObject:direction];
                }
            }];
        }];
    }
}

- (NSInteger)nextIndex:(NSInteger)index{
    NSInteger nextIndex = index + 1;
    if (nextIndex >= _textDataArr.count) {
        nextIndex = 0;
    }
    return nextIndex;
}

#pragma mark - State Check
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
