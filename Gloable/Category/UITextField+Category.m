//
//  UITextField+Category.m
//  Hubblebubble
//
//  Created by Zhang on 2018/5/11.
//  Copyright © 2018 Zhang. All rights reserved.
//

#import "UITextField+Category.h"

@implementation UITextField (Category)

- (void)setPlaceholderFont:(UIFont *) font color:(UIColor *) color {
    
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:self.text];
    [placeholder addAttribute:NSForegroundColorAttributeName
                        value:color
                        range:NSMakeRange(0, self.text.length)];
    [placeholder addAttribute:NSFontAttributeName
                        value:font
                        range:NSMakeRange(0, self.text.length)];
    self.attributedPlaceholder = placeholder;
}

@end
