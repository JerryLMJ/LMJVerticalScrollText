//
//  UIView+ForLMJVerticalScrollText.m
//  LMJVerticalScrollTextExample
//
//  Created by LiMingjie on 2019/5/22.
//  Copyright © 2019 LMJ. All rights reserved.
//

#import "UIView+ForLMJVerticalScrollText.h"

@implementation UIView (ForLMJVerticalScrollText)

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
