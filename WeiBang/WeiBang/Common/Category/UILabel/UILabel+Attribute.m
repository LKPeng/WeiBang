//
//  UILabel+Attribute.m
//  DDYS
//
//  Created by 李树文 on 15/12/29.
//  Copyright © 2015年 lysw. All rights reserved.
//

#import "UILabel+Attribute.h"
#import <objc/runtime.h>

@implementation UILabel (Attribute)

- (void)moreColorWithAttributeString:(NSString *)str color:(UIColor *)color{
    [self moreColorWithAttributeString:str color:color font: self.font];

}

- (void)moreColorWithAttributeString:(NSString *)str color:(UIColor *)color font:(UIFont*)font{
    NSString *initialStr = self.text;
    NSMutableAttributedString * attributeStr=[[NSMutableAttributedString alloc]initWithString:initialStr];
    NSRange range=[initialStr rangeOfString:str];
    [attributeStr addAttribute: NSForegroundColorAttributeName value:color range:range];
    [attributeStr addAttribute: NSFontAttributeName value: font range: range];
    self.attributedText = attributeStr;
}


- (void)moreColorFromIndex:(NSInteger)from color:(UIColor *)color{
    /**  初始字符串  */
    NSString *initialStr = self.text;
    /**  创建富文本对象  */
    NSMutableAttributedString * attributeStr=[[NSMutableAttributedString alloc]initWithString:initialStr];
    /**  计算文本范围  */
    NSRange range = NSMakeRange(from, initialStr.length - from);
    /**  设置文本范围和颜色  */
    [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.attributedText = attributeStr;
}



- (UILabel *)cloneLabWithFrame:(CGRect)frame
                 textAlignment:(NSTextAlignment)alignment
                          font:(UIFont *)font
                     textColor:(UIColor *)textColor
                          text:(NSString *)text
               backgroundColor:(UIColor *)bgColor{
    UILabel *cloneLab = [[UILabel alloc] init];
    cloneLab.frame = frame;
    cloneLab.textAlignment = alignment;
    cloneLab.font = font;
    cloneLab.textColor = textColor;
    cloneLab.text = text;
    cloneLab.backgroundColor = bgColor;
    return cloneLab;
}


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(copyText:));
}

- (void)attachTapHandler {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *g = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:g];
}

//  处理手势相应事件
- (void)handleTap:(UIGestureRecognizer *)g {
    [self becomeFirstResponder];
    
    UIMenuItem *item = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyText:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObject:item]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
    
}

//  复制时执行的方法
- (void)copyText:(id)sender {
    //  通用的粘贴板
    UIPasteboard *pBoard = [UIPasteboard generalPasteboard];
    
    //  有些时候只想取UILabel的text中的一部分
    if (objc_getAssociatedObject(self, @"expectedText")) {
        pBoard.string = objc_getAssociatedObject(self, @"expectedText");
    } else {
        
        //  因为有时候 label 中设置的是attributedText
        //  而 UIPasteboard 的string只能接受 NSString 类型
        //  所以要做相应的判断
        if (self.text) {
            pBoard.string = self.text;
        } else {
            pBoard.string = self.attributedText.string;
        }
    }
}

- (BOOL)canBecomeFirstResponder {
    return [objc_getAssociatedObject(self, @selector(isCopyable)) boolValue];
}

- (void)setIsCopyable:(BOOL)number {
    objc_setAssociatedObject(self, @selector(isCopyable), [NSNumber numberWithBool:number], OBJC_ASSOCIATION_ASSIGN);
    [self attachTapHandler];
}

- (BOOL)isCopyable {
    return [objc_getAssociatedObject(self, @selector(isCopyable)) boolValue];
}



@end
