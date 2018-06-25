//
//  UIButton+adjustImageAndTitle.h
//  PresentTest
//
//  Created by 慕少锋 on 2018/6/21.
//  Copyright © 2018年 慕少锋. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZTContentAdjustType) {
    ZTContentAdjustImageLeftTitleRight = 0,// default
    ZTContentAdjustImageRightTitleLeft,
    ZTContentAdjustImageUpTitleDown,
    ZTContentAdjustImageDownTitleUp
};

@interface UIButton (zt_adjustImageAndTitle)

@property (nonatomic, assign) ZTContentAdjustType    zt_contentAdjustType;//图片与文字的结构 默认图片在左，文字在右

@property (nonatomic, assign) CGFloat    zt_space;// 图片与文字的间距 默认是5
/*
 开始调整内容
 
 调用前，请确保设置好title以及image
 */
- (void)zt_beginAdjustContent;

@end

