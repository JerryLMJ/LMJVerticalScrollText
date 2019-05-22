//
//  UILabel+ForLMJVerticalScrollText.m
//  LMJVerticalScrollTextExample
//
//  Created by LiMingjie on 2019/5/22.
//  Copyright © 2019 LMJ. All rights reserved.
//

#import "UILabel+ForLMJVerticalScrollText.h"

@implementation UILabel (ForLMJVerticalScrollText)

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
