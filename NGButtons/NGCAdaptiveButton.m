//
//  NGCAdaptiveButton.m
//
//  Created by liuzuopeng01 on 15/9/8.
//  Copyright (c) 2015年 liuzuopeng01. All rights reserved.
//

#include "NGCAdaptiveButton.h"



#define kNGCAdaptiveButtonDefaultFontSize         (12.f)
#define kNGCAdaptiveButtonDefaultColor            (UIColorFromRGB(0x22222d))

#define kNGCAdaptiveButtonTextImageDefaultSpacing (8.f) //图片与文本之间的默认间距
#define kNGCAdaptiveButtonDefaultPlaceholder      (5.f) // 图片离边框的默认间距



@implementation NGCAdaptiveButton

+ (NGCAdaptiveButton *)buttonWithTitle:(NSString *)title image:(UIImage *)image
{
    return [NGCAdaptiveButton buttonWithTitle:title image:image type:kNGCAdaptiveButtonTypeBottomText spacing:kNGCAdaptiveButtonTextImageDefaultSpacing placeholder:kNGCAdaptiveButtonDefaultPlaceholder];
}


+ (NGCAdaptiveButton *)buttonWithTitle:(NSString *)title image:(UIImage *)image type:(NGCAdaptiveButtonType)type spacing:(CGFloat)spacing placeholder:(CGFloat)placeholder {
    NGCAdaptiveButton *aButton = [NGCAdaptiveButton buttonWithType:UIButtonTypeCustom];
    if (aButton) {
        [aButton _initWithTitle:title image:image type:type spacing:spacing placeholder:placeholder];
    }
    return aButton;
}


- (void)updateWithTitle:(NSString *)title image:(UIImage *)image {
    if (title) {
        _title = title;
    }
    if (image) {
        _image = image;
    }
    
    [self _updateButtonContent];
}


#pragma mark - private method for NGCTextImageButton

- (void)_initWithTitle:(NSString *)title image:(UIImage *)image type:(NGCAdaptiveButtonType)type spacing:(CGFloat)spacing placeholder:(CGFloat)placeholder {
    _type = type;
    _spacing = spacing;
    _placeholder = placeholder;
    _title = title;
    _image = image;
    
    [self setClipsToBounds:NO];
    [self.titleLabel setClipsToBounds:NO];
    [self.imageView setClipsToBounds:NO];
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self setTitleColor:kNGCAdaptiveButtonDefaultColor forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont systemFontOfSize:kNGCAdaptiveButtonDefaultFontSize]];
    
    [self _updateButtonContent];
}


- (void)_updateButtonContent {
    [self setTitle:_title forState:UIControlStateNormal];
    [self setImage:_image forState:UIControlStateNormal];
    
    [self layoutIfNeeded];
}


#pragma mark - layout subviews

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIEdgeInsets titleInset = UIEdgeInsetsZero;
    UIEdgeInsets imageInset = UIEdgeInsetsZero;
    
    CGSize  titleSize   = [_title sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    CGSize  imageSize   = _image.size;
    CGFloat totalWidth  = self.width;
    CGFloat totalHeight = self.height;
    CGFloat spacing     = _spacing; //图片与文本之间的间距
    CGFloat placeholder = _placeholder;
    
    switch (_type) {
        case kNGCAdaptiveButtonTypeLeftText: {
            titleInset = UIEdgeInsetsMake((totalHeight - titleSize.height) * 0.5, - (imageSize.width - placeholder) , 0, 0);
            imageInset = UIEdgeInsetsMake((totalHeight - imageSize.height) * 0.5, titleSize.width + spacing + placeholder, 0, 0);
        }
            break;
            
        case kNGCAdaptiveButtonTypeRightText: {
            titleInset = UIEdgeInsetsMake((totalHeight - titleSize.height) * 0.5, spacing + placeholder , 0, 0);
            imageInset = UIEdgeInsetsMake((totalHeight - imageSize.height) * 0.5, placeholder, 0, 0);
        }
            break;
            
        case kNGCAdaptiveButtonTypeTopText: {
            titleInset = UIEdgeInsetsMake(placeholder, (totalWidth - titleSize.width) * 0.5 - imageSize.width, 0, 0);
            imageInset = UIEdgeInsetsMake(titleSize.height + spacing + placeholder, (totalWidth - imageSize.width) * 0.5, 0, 0);
        }
            break;
            
        case kNGCAdaptiveButtonTypeBottomText: {
            titleInset = UIEdgeInsetsMake(imageSize.height + spacing + placeholder, (totalWidth - titleSize.width) * 0.5 - imageSize.width, 0, 0);
            imageInset = UIEdgeInsetsMake(placeholder, (totalWidth - imageSize.width) * 0.5, 0, 0);
        }
            break;
            
        default:
            break;
    }
    
    self.titleEdgeInsets = titleInset;
    self.imageEdgeInsets = imageInset;
}


#pragma mark - setter/getter property

- (void)setType:(NGCAdaptiveButtonType)type {
    _type = type;
    
    [self layoutIfNeeded];
}


- (void)setSpacing:(CGFloat)spacing {
    _spacing = spacing;
    
    [self layoutIfNeeded];
}


- (void)setPlaceholder:(CGFloat)placeholder {
    _placeholder = placeholder;
    
    [self layoutIfNeeded];
}

@end