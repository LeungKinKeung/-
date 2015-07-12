//
//  ViewController.m
//  碰撞检测
//
//  Created by Apple on 15/7/9.
//  Copyright (c) 2015年 LKK. All rights reserved.
//

#import "ViewController.h"
#import "LKKView.h"
#import "UIView+LKKXYWH.h"
#import <math.h>

@interface ViewController ()<LKKViewDelegate>
@property (strong, nonatomic) LKKView *view1;
@property (strong, nonatomic) LKKView *view2;
//白色矩形
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (strong, nonatomic) LKKView *view4;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //白色圆形
    LKKView *view1 = [[LKKView alloc] initWithFrame:CGRectMake(20,30 , 100, 100)];
    [view1 setBackgroundColor:[UIColor whiteColor]];
    self.view1 = view1;
    view1.layer.masksToBounds = YES;
    view1.layer.cornerRadius = 50;
    [self.view addSubview:view1];
    view1.delegate = self;
    
    //红色矩形
    LKKView *view2 = [[LKKView alloc] initWithFrame:CGRectMake(150,70 , 100, 100)];
    [view2 setBackgroundColor:[UIColor redColor]];
    self.view2 = view2;
    [self.view addSubview:view2];
    view2.delegate = self;
    
    //绿色圆形
    LKKView *view4 = [[LKKView alloc] initWithFrame:CGRectMake(130,180 , 100, 100)];
    [view4 setBackgroundColor:[UIColor greenColor]];
    self.view4 = view4;
    view4.layer.masksToBounds = YES;
    view4.layer.cornerRadius = 50;
    [self.view addSubview:view4];
    view4.delegate = self;
}

- (void)touchesMovedView:(LKKView *)view{

    if ([view isEqual:self.view1]) {
        //圆形和矩形
        BOOL isCircleOverlap = [self isCircleOverlapWithCircleView1:view isEqualRectangleView2:self.view3];
        if (isCircleOverlap) {
            self.label1.text = @"重叠";
        }else{
            self.label1.text = @"不重叠";
        }
        
        

    }else if ([view isEqual:self.view2]){
        BOOL isOverlap = [self isRectangleOverlapWithView1:view isEqualView2:self.view3];
        if (isOverlap) {
            self.label1.text = @"重叠";
        }else{
            self.label1.text = @"不重叠";
        }
        
    }
}



//圆形和矩形
- (BOOL)isCircleOverlapWithCircleView1:(UIView *)view1 isEqualRectangleView2:(UIView *)view2{
    CGFloat view2MinX = view2.x;
    CGFloat view2MinY = view2.y;
    CGFloat view2MaxX = CGRectGetMaxX(view2.frame);
    CGFloat view2MaxY = CGRectGetMaxY(view2.frame);
    CGPoint leftTopPoint = CGPointMake(view2MinX, view2MinY);
    CGPoint rightTopPoint = CGPointMake(view2MaxX, view2MinY);
    CGPoint leftBottomPoint = CGPointMake(view2MinX, view2MaxY);
    CGPoint rightBottomPoint = CGPointMake(view2MaxX, view2MaxY);
    
    CGFloat view1Radius = view1.w * 0.5;
    CGFloat view2RadiusW = view2.w * 0.5;
    CGFloat view2RadiusH = view2.h * 0.5;
    
    
    CGFloat d1_2 = (leftTopPoint.x - view1.center.x) * (leftTopPoint.x - view1.center.x);
    CGFloat d2_2 = (leftTopPoint.y - view1.center.y) * (leftTopPoint.y - view1.center.y);
    CGFloat r_2 = view1Radius * view1Radius;
    
    
    //横坐标差
    if ((d1_2 + d2_2) <= r_2) {
        return YES;
    }
    
    
    
    //纵坐标差
    
    
    
    return NO;
}




//圆形和圆形
- (BOOL)isCircleOverlapWithCircleView1:(UIView *)view1 isEqualCircleView2:(UIView *)view2{
    
    CGFloat view1Radius = view1.w * 0.5;
    CGFloat view2Radius = view2.w * 0.5;
    
    CGFloat xDistanceW = fabsf(view1.center.x - view2.center.x);
    CGFloat yDistanceH = fabsf(view1.center.y - view2.center.y);
    //直角边
    CGFloat centerDistance = hypotf(xDistanceW, yDistanceH);
    
    //直角边 < 两个圆的半径和
    if (centerDistance < (view1Radius + view2Radius)) {
        return YES;
    }
    return NO;
}




//矩形和矩形
- (BOOL)isRectangleOverlapWithView1:(UIView *)view1 isEqualView2:(UIView *)view2{
    CGFloat view1CenterX = view1.center.x;
    CGFloat view1CenterY = view1.center.y;
    CGFloat view1RadiusW = view1.w * 0.5;
    CGFloat view1RadiusH = view1.h * 0.5;
    
    CGFloat view2CenterX = view2.center.x;
    CGFloat view2CenterY = view2.center.y;
    CGFloat view2RadiusW = view2.w * 0.5;
    CGFloat view2RadiusH = view2.h * 0.5;
    
    if (fabsf(view1CenterX - view2CenterX) < (view1RadiusW + view2RadiusW)) {
        if (fabsf(view1CenterY - view2CenterY) < (view1RadiusH + view2RadiusH)) {
            return YES;
        }
    }
    return NO;
}









//////////////////////////////////////////////////////////////////////////////////////////
//矩形和矩形2(有BUG)
- (BOOL)is2RectangleOverlapWithView1:(UIView *)view1 isEqualView2:(UIView *)view2{
    CGFloat view1MinX = view1.x;
    CGFloat view1MinY = view1.y;
    CGFloat view1MaxX = CGRectGetMaxX(view1.frame);
    CGFloat view1MaxY = CGRectGetMaxY(view1.frame);
    
    CGFloat view2MinX = view2.x;
    CGFloat view2MinY = view2.y;
    CGFloat view2MaxX = CGRectGetMaxX(view2.frame);
    CGFloat view2MaxY = CGRectGetMaxY(view2.frame);
    
    if (view1MinX > view2MinX && view1MinX < view2MaxX && view1MinY > view2MinY && view1MinY < view2MaxY) {
        //view1左上角在view2的minX和maxX之间，
        return YES;
    }else if (view1MaxX > view2MinX && view1MaxX < view2MaxX && view1MaxY > view2MinY && view1MaxY < view2MaxY){
        //view1右下角
        return YES;
    }else if (view1MinX > view2MinX && view1MinX < view2MaxX && view1MaxY > view2MinY && view1MaxY < view2MaxY){
        //view1左下角
        return YES;
    }else if (view1MaxX > view2MinX && view1MaxX < view2MaxX && view1MinY > view2MinY && view1MinY < view2MaxY){
        //view1右下角
        return YES;
    }
    return NO;
}


@end
