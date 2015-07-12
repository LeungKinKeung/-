//
//  UIView+LKKXYWH.m
//  LKK
//
//  Created by apple on 15-1-24.
//  Copyright (c) 2015年 LKK. All rights reserved.
//

#import "UIView+LKKXYWH.h"

@implementation UIView (LKK)

-(CGFloat)x{
    return self.frame.origin.x;
}

-(void)setX:(CGFloat)x{
    CGRect frm = self.frame;
    frm.origin.x = x;
    
    self.frame = frm;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)setY:(CGFloat)y{
    CGRect frm = self.frame;
    frm.origin.y = y;
    self.frame = frm;
}

-(CGFloat)w{
    return self.frame.size.width;
}

-(void)setW:(CGFloat)w{
    CGRect frm = self.frame;
    frm.size.width = w;
    self.frame = frm;
}

-(CGFloat)h{
    return self.frame.size.height;
}

-(void)setH:(CGFloat)h{
    CGRect frm = self.frame;
    frm.size.height = h;
    self.frame = frm;
}
@end
