//
//  LCTextView.m
//  MamiHomeApp
//
//  Created by Changlin Yu on 2017/5/12.
//  Copyright © 2017年 LinChengRain. All rights reserved.
//

#import "LCTextView.h"

@interface LCTextView ()
@property (nonatomic,strong) UILabel *numberLabel;
@end
@implementation LCTextView

+ (UIColor *)defaultPlaceholderColor {
    static UIColor *color = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextField *textField = [[UITextField alloc] init];
        textField.placeholder = @" ";
        color = [textField valueForKeyPath:@"_placeholderLabel.textColor"];
    });
    return color;
}

- (UILabel *)numberLabel
{
    if(!_numberLabel){
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.font = self.font;
        _numberLabel.textColor = [UIColor lightGrayColor];
        _numberLabel.textAlignment = NSTextAlignmentRight;
    }
    return _numberLabel;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.placeholderColor = [self.class defaultPlaceholderColor];
        self.placeholder = @"请输入内容";
        _placeholderLocation = CGPointMake(5, 8);  //占位图起始位置
        _maxNumber = 0;
        // 使用通知监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self    selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

/**
 *  当 text field 文本内容改变时 会调用此方法
 *
 *  notification
 */
- (void)textDidChange:(NSNotification *)notification
{
    // 会重新调用drawRect:方法
    [self setNeedsDisplay];
    
    if(!_showWordNumber) return;
    [self textViewEditChanged:notification];
    // 如果设置了显示可以字数label,则更新当前字数
    [self setupNumber:self.text.length];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 * 每次调用drawRect:方法，都会将以前画的东西清除掉
 */
- (void)drawRect:(CGRect)rect
{
    // 如果有文字，就直接返回，不需要画占位文字
    if (self.hasText) return;
    
    // 属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeholderColor;
    
    // 画文字
    rect.origin.x = _placeholderLocation.x;
    rect.origin.y = _placeholderLocation.y;
    rect.size.width -= 2 * rect.origin.x;
    [self.placeholder drawInRect:rect withAttributes:attrs];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setNeedsDisplay];
}

#pragma mark - setter
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self setNeedsDisplay];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    [self setNeedsDisplay];
}
- (void)setPlaceholderLocation:(CGPoint)placeholderLocation{
    _placeholderLocation = placeholderLocation;
    [self setNeedsDisplay];
}
- (void)setShowWordNumber:(BOOL)showWordNumber
{
    _showWordNumber = showWordNumber;
    
    if(!showWordNumber) return;
    
    [self.numberLabel removeFromSuperview];
    [self addSubview:self.numberLabel];
     
    [self setLocationType:ShowLocationTypeDefault];
}
- (void)setLocationType:(ShowLocationType)locationType
{
    _locationType = locationType;
    
    if(!_showWordNumber) return;
    if(!_numberLabel){
        [self addSubview:self.numberLabel];
    }
    [self setupNumberLabel:locationType];
}
- (void)setMaxNumber:(NSUInteger)maxNumber
{
    _maxNumber = maxNumber;
    if(!_showWordNumber) return;
    if(!_numberLabel){
        [self addSubview:self.numberLabel];
    }
    self.numberLabel.text = [NSString stringWithFormat:@"0/%lu",(unsigned long)maxNumber];
}

#pragma mark ========== private methods==========
- (void)setupNumberLabel:(ShowLocationType)locationType {
    
    switch (locationType) {
        case ShowLocationTypeLeft:
            self.numberLabel.frame = CGRectMake(5, self.frame.size.height - 20, 100, 20);
            self.numberLabel.textAlignment = NSTextAlignmentLeft;
            break;
        case ShowLocationTypeRight: case ShowLocationTypeDefault:
            self.numberLabel.frame = CGRectMake(self.frame.size.width - 105, self.frame.size.height - 20, 100, 20);
            self.numberLabel.textAlignment = NSTextAlignmentRight;
            break;
        default:
            break;
    }
}
- (void)setupNumber:(NSUInteger)number{

    if(number > _maxNumber) return;
    self.numberLabel.text = [NSString stringWithFormat:@"%lu/%lu",(unsigned long)number,(unsigned long)self.maxNumber];

}
- (NSInteger)getInputLengthWithText:(NSString *)text
{
    NSInteger textLength = 0;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    if (selectedRange) {
        NSString *newText = [self textInRange:selectedRange];
        textLength = (newText.length + 1) / 2 + [self offsetFromPosition:self.beginningOfDocument toPosition:selectedRange.start] + text.length;
    } else {
        textLength = self.text.length + text.length;
    }
    return textLength;
}

-(void)textViewEditChanged:(NSNotification *)notification{
    
    // 拿到文本改变的 text field
    UITextField *textField = (UITextField *)notification.object;
    // text field 的内容
    NSString *contentText = textField.text;
    // 键盘输入模式
    NSString *lang = [UIApplication sharedApplication].textInputMode.primaryLanguage;
    if([lang isEqualToString:@"zh-Hans"]) { //简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        //没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if(!position) {
            if(contentText.length > _maxNumber) {
                textField.text = [contentText substringToIndex:_maxNumber];
            }
        }
        //有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    //中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if(contentText.length > _maxNumber) {
            textField.text= [contentText substringToIndex:_maxNumber];
        }
    }
}
@end

