//
//  LKKView.m
//  碰撞检测
//
//  Created by Apple on 15/7/11.
//  Copyright (c) 2015年 LKK. All rights reserved.
//

#import "LKKView.h"

@implementation LKKView

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    // 获得触摸对象
    UITouch *touch = [touches anyObject];
    // 获得触摸移动点
    CGPoint movePoint = [touch locationInView:self];
    
    // 获得上一次的触摸点
    CGPoint previousPoint = [touch previousLocationInView:self];
    
    // 计算偏移量
    CGFloat offsetX = movePoint.x - previousPoint.x;
    CGFloat offsetY = movePoint.y - previousPoint.y;
    
    // 获得当前view的中点位置
    CGPoint center = self.center;
    center.x += offsetX;
    center.y += offsetY;
    // 重新赋值
    self.center = center;
    
    if ([self.delegate respondsToSelector:@selector(touchesMovedView:)]) {
        [self.delegate touchesMovedView:self];
    }
    
//    NSLog(@"%@",NSStringFromCGPoint(self.center));
}





- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

@end
