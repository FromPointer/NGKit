//
//  NGCAdaptiveButton.h
//
//  Created by liuzuopeng01 on 15/9/8.
//  Copyright (c) 2015年 liuzuopeng01. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, NGCAdaptiveButtonType) {
    kNGCAdaptiveButtonTypeLeftText,  // 文字在左，图片在右
    kNGCAdaptiveButtonTypeRightText, // 文字在右，图片在左
    kNGCAdaptiveButtonTypeTopText,   // 文字在上，图片在下
    kNGCAdaptiveButtonTypeBottomText,// 文字在下，图片在上
};



/**
 *  可适配的按钮，能方便的调整按钮文字和图片对齐方式，同时也能调整文字与图片之间的间距和文字图片与边框的间距
 */
@interface NGCAdaptiveButton : UIButton

@property (nonatomic, assign) NGCAdaptiveButtonType type;
@property (nonatomic, assign) CGFloat               spacing; // 文字与图片的间距
/**
 *          值的含义与type有关
 *
 * kNGCAdaptiveButtonTypeLeftText  左边文字与左边框之间的间距
 * kNGCAdaptiveButtonTypeRightText 左边图片与左边框之间的间距
 * kNGCAdaptiveButtonTypeTopText   上边文字与上边框之间的间距
 * kNGCAdaptiveButtonTypeRightText 上边图片与上边框之间的间距
 *
 */
@property (nonatomic, assign) CGFloat               placeholder;
@property (nonatomic, copy, readonly)   NSString   *title;
@property (nonatomic, strong, readonly) UIImage    *image;

+ (NGCAdaptiveButton *)buttonWithTitle:(NSString *)title image:(UIImage *)image;
+ (NGCAdaptiveButton *)buttonWithTitle:(NSString *)title image:(UIImage *)image type:(NGCAdaptiveButtonType)type spacing:(CGFloat)spacing placeholder:(CGFloat)placeholder;

- (void)updateWithTitle:(NSString *)title image:(UIImage *)image;

@end