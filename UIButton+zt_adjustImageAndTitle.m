//
//  UIButton+adjustImageAndTitle.m
//  PresentTest
//
//  Created by 慕少锋 on 2018/6/21.
//  Copyright © 2018年 慕少锋. All rights reserved.
//

#import "UIButton+zt_adjustImageAndTitle.h"

static CGFloat _zt_space = 5;
static ZTContentAdjustType _zt_contentAdjustType = ZTContentAdjustImageLeftTitleRight;

@implementation UIButton (zt_adjustImageAndTitle)

@dynamic zt_contentAdjustType,zt_space;

- (void)zt_beginAdjustContent {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self _zt_beginAdjustContent];
    });

}

#pragma mark---- private

- (void)_zt_beginAdjustContent {
    UIImage    * btnImage = self.imageView.image;
    NSString    * btnTitle = self.titleLabel.text;
    
    if (!btnImage || btnTitle.length <= 0) {
        NSAssert(false, @"请先设置按钮的图片以及文字");
        return;
    }
    
    CGSize imageSize = btnImage.size;
    CGFloat imageWidth = imageSize.width;
    CGFloat imageHeight = imageSize.height;
    
    CGSize titleSize = [btnTitle sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGFloat titleWidth = titleSize.width;
    CGFloat titleHeight = titleSize.height;
    
    // 预防文字过长，超过按钮的宽度
    CGFloat    btnWidth = CGRectGetWidth(self.frame);// 按钮的宽度
    if (titleWidth > btnWidth - imageWidth - self.zt_space) {
        titleWidth = btnWidth- imageWidth - self.zt_space;
    }
    
    CGFloat space = self.zt_space;
    
    switch (self.zt_contentAdjustType) {
        case ZTContentAdjustImageLeftTitleRight: {
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, (space*0.5), 0, -(space*0.5))];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, -(space*0.5), 0, (space*0.5))];
        }
            break;
        case ZTContentAdjustImageRightTitleLeft: {
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -(imageWidth+space*0.5), 0, (imageWidth+space*0.5))];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, (titleWidth + space*0.5), 0, -(titleWidth + space*0.5))];
        }
            break;
        case ZTContentAdjustImageUpTitleDown: {
            [self setTitleEdgeInsets:UIEdgeInsetsMake((titleHeight+space)*0.5, -imageWidth*0.5, -(titleHeight+space)*0.5, imageWidth*0.5)];
            [self setImageEdgeInsets:UIEdgeInsetsMake(-(imageHeight+space)*0.5, titleWidth*0.5, (imageHeight+space)*0.5, -titleWidth*0.5)];
        }
            break;
        case ZTContentAdjustImageDownTitleUp: {
            [self setTitleEdgeInsets:UIEdgeInsetsMake(-(titleHeight+space)*0.5, -imageWidth*0.5, (titleHeight+space)*0.5, imageWidth*0.5)];
            [self setImageEdgeInsets:UIEdgeInsetsMake((imageHeight+space)*0.5, titleWidth*0.5, -(imageHeight+space)*0.5, -titleWidth*0.5)];
        }
            break;
        default: {
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, (space*0.5), 0, -(space*0.5))];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, -(space*0.5), 0, (space*0.5))];
        }
            break;
    }
}


#pragma mark---- getter and setter

- (CGFloat)zt_space {
    return _zt_space;
}

- (void)setZt_space:(CGFloat)zt_space {
    _zt_space = zt_space;
}

- (ZTContentAdjustType)zt_contentAdjustType {
    return _zt_contentAdjustType;
}

- (void)setZt_contentAdjustType:(ZTContentAdjustType)zt_contentAdjustType {
    _zt_contentAdjustType = zt_contentAdjustType;
}

@end
