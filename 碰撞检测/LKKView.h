//
//  LKKView.h
//  碰撞检测
//
//  Created by Apple on 15/7/11.
//  Copyright (c) 2015年 LKK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LKKView;

@protocol LKKViewDelegate <NSObject>

- (void)touchesMovedView:(LKKView *)view;

@end

@interface LKKView : UIView

@property (nonatomic , weak) id<LKKViewDelegate> delegate;


@end
