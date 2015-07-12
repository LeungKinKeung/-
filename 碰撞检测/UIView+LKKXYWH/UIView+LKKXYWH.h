//
//  UIView+LKKXYWH.h
//  LKK
//
//  Created by apple on 15-1-24.
//  Copyright (c) 2015年 LKK. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 返回view的x,y,width,height
 */
@interface UIView (LKKXYWH)
/**
 * 控件的x坐标
 */
@property(nonatomic,assign)CGFloat x;

/**
 * 控件的y坐标
 */
@property(nonatomic,assign)CGFloat y;

/**
 * 控件的宽度
 */
@property(nonatomic,assign)CGFloat w;

/**
 * 控件的高度
 */
@property(nonatomic,assign)CGFloat h;


@end
