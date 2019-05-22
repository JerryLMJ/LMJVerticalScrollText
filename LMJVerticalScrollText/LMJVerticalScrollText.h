//
//  LMJVerticalScrollText.h
//  LMJVerticalScrollTextExample
//
//  Created by LiMingjie on 2019/5/22.
//  Copyright © 2019 LMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LMJVerticalScrollText;


@protocol LMJVerticalScrollTextDelegate <NSObject>

@optional
- (void)verticalScrollText:(LMJVerticalScrollText *)scrollText currentTextIndex:(NSInteger)index;
- (void)verticalScrollText:(LMJVerticalScrollText *)scrollText clickIndex:(NSInteger)index content:(NSString *)content;

@end





@interface LMJVerticalScrollText : UIView

@property (nonatomic,assign) id <LMJVerticalScrollTextDelegate>delegate;

// textDataArr 支持 NSString 和 NSAttributedString类型
// "textDataArr" support <NSString *> and <NSAttributedString *>
@property (nonatomic,copy)   NSArray * textDataArr;


// 文字停留时间，默认为3s。
// Text stay time，default is 3 seconds.
@property (nonatomic,assign) CGFloat textStayTime;

// 文字滚动动画时间，默认为1s。
// Text scrolling animation time，default is 1 seconds.
@property (nonatomic,assign) CGFloat scrollAnimationTime;


@property (nonatomic,copy)   UIFont  * textFont;
@property (nonatomic,copy)   UIColor * textColor;
@property (nonatomic)        NSTextAlignment textAlignment;

@property (nonatomic,assign) BOOL touchEnable; // defualt is YES

- (void)startScrollBottomToTopWithSpace;
- (void)startScrollTopToBottomWithSpace;

- (void)startScrollBottomToTopWithNoSpace;
- (void)startScrollTopToBottomWithNoSpace;

- (void)stop;
- (void)stopToEmpty;

@end
