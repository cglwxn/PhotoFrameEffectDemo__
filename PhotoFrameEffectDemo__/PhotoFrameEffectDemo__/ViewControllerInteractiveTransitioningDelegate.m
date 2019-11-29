//
//  ViewControllerInteractiveTransitioningDelegate.m
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/11/27.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import "ViewControllerInteractiveTransitioningDelegate.h"

@implementation ViewControllerInteractiveTransitioningDelegate

//A set of methods that enable an object (such as a navigation controller) to drive a view controller transition.
//允许一个对象(如导航控制器)驱动一个 控制器过渡(行为)
#pragma mark - UIViewControllerInteractiveTransitioning

#pragma mark - required

//Called when the system needs to set up the interactive portions of a view controller transition and start the animations.
//在系统需要设置视图控制器转换的交互式部分并启动动画时调用。
- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
}

@end
