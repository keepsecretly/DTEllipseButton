//
//  DTEllipseButton.m
//  DTEllipseButton
//
//  Created by NiM on 1/9/2560 BE.
//  Copyright © 2560 Sopana Thitipariwat. All rights reserved.
//

#import "DTEllipseButton.h"

@interface DTEllipseButton ()

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation DTEllipseButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupButton];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self reloadButton];
}

- (void)setupButton
{
    self.borderBackgroundColor = [UIColor whiteColor];
    self.borderColor = [UIColor lightGrayColor];
    self.textColor = [UIColor lightGrayColor];
    self.borderWidth = 1.0f;
    
    self.imageBorderColor = [UIColor whiteColor];
    self.imageBackgroundColor = [UIColor lightGrayColor];
    self.imageBorderWidth = 0.0f;

    self.contentEdgeInsets = UIEdgeInsetsMake(4, 0, 4, 4);
    self.titleEdgeInsets = UIEdgeInsetsMake(4, 8, 4, 4);
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageEdgeInsets = UIEdgeInsetsZero;
    
    if (self.backgroundView == nil) {
        self.backgroundView = [UIView new];
        self.backgroundView.frame = CGRectMake(0, 4, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-8);
        [self insertSubview:self.backgroundView atIndex:0];
    }
    
    if (self.backgroundImageView == nil) {
        self.backgroundImageView = [UIImageView new];
        self.backgroundImageView.frame = CGRectMake(0, 0, CGRectGetHeight(self.frame), CGRectGetHeight(self.frame));
        [self insertSubview:self.backgroundImageView aboveSubview:self.backgroundView];
    }
}

- (void)setImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
{
    [super setImageEdgeInsets:UIEdgeInsetsMake(4, 4, 4, 14)];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self reloadButton];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    
    [self reloadButton];
}

- (void)setTextColor:(UIColor *)textColor
{
    if (textColor != _textColor) {
        _textColor = textColor;
        [self reloadButton];
    }
}

- (void)setBorderColor:(UIColor *)borderColor
{
    if (_borderColor != borderColor) {
        _borderColor = borderColor;
        [self reloadButton];
    }
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    if (_borderWidth != borderWidth) {
        _borderWidth = borderWidth;
        [self reloadButton];
    }
}

- (void)setBorderBackgroundColor:(UIColor *)borderBackgroundColor
{
    if (_borderBackgroundColor != borderBackgroundColor) {
        _borderBackgroundColor = borderBackgroundColor;
        [self reloadButton];
    }
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    CGFloat height = CGRectGetHeight(self.frame);
    
    if (self.imageView.image) {
        self.backgroundView.frame = CGRectMake(height*0.5, 4, CGRectGetWidth(self.frame)-height*0.5, height-8);
        self.backgroundImageView.hidden = NO;
        self.backgroundImageView.frame = CGRectMake(0, 4, CGRectGetHeight(self.frame)-8, CGRectGetHeight(self.frame)-8);
    } else {
        self.backgroundImageView.hidden = YES;
        self.backgroundView.frame = CGRectMake(0, 4, CGRectGetWidth(self.frame), height-8);
    }
}

- (void)didMoveToWindow
{
    [super didMoveToWindow];
    [self reloadButton];
}

- (void)reloadButton
{
    self.titleLabel.textColor = self.textColor;
    self.backgroundView.layer.borderColor = [self.borderColor CGColor];
    self.backgroundView.layer.borderWidth = self.borderWidth;
    self.backgroundView.layer.cornerRadius = (CGRectGetHeight(self.frame)-8)*0.5;

    if (self.imageView.image) {
        self.backgroundImageView.layer.cornerRadius = (CGRectGetHeight(self.frame)-8)*0.5;
        self.backgroundImageView.layer.borderColor = [self.imageBorderColor CGColor];
        self.backgroundImageView.layer.borderWidth = self.imageBorderWidth;
        self.backgroundImageView.backgroundColor = self.imageBackgroundColor;
        
        if (self.titleEdgeInsets.left < (CGRectGetHeight(self.frame)-8)*0.5) {
            UIEdgeInsets inset = self.titleEdgeInsets;
            inset.left += 4;
            self.titleEdgeInsets = inset;
        }
    }
    
    CGRect frame = self.frame;
    CGSize size = [self sizeThatFits:CGSizeMake(MAXFLOAT, CGRectGetHeight(self.frame))];
    size.width += (self.titleEdgeInsets.left + self.titleEdgeInsets.right);
    frame.size.width = size.width;
    
    self.frame = frame;
    
    self.backgroundView.backgroundColor = self.borderBackgroundColor;
}

@end
