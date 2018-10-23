//
//  UIButton+adjustImageAndTitle.h
//  PresentTest
//
//  Created by 慕少锋 on 2018/6/21.
//  Copyright © 2018年 慕少锋. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 使用范例：
 
     UIButton    * testButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
     testButton.backgroundColor = [UIColor redColor];
     [testButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [testButton setTitle:@"我是测试" forState:UIControlStateNormal];
     [testButton setImage:[UIImage imageNamed:@"home_icon_arrow"] forState:UIControlStateNormal];
 
     testButton.zt_contentAdjustType = ZTContentAdjustImageDownTitleUp;
     testButton.zt_space = 5;
     [testButton zt_beginAdjustContent];
 
     [self.view addSubview:testButton];
 */

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

/*
 zt_beginAdjustContent 默认在下一次runloop进行更新，这个方法提供直接更新
 */
- (void)zt_beginAdjustContentImmediately;

/*
 可以传入文字最大宽度
 */
- (void)zt_beginAdjustContentWithMaxTitleWidth:(CGFloat)maxTitleWidth;

@end

