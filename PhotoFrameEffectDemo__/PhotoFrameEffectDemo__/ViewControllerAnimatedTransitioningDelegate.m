//
//  ViewControllerAnimatedTransitioningDelegate.m
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/11/27.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import "ViewControllerAnimatedTransitioningDelegate.h"

@implementation ViewControllerAnimatedTransitioningDelegate

// A set of methods for implementing the animations for a custom view controller transition.
// 完成自定义控制器过渡的动画器的一些列方法
#pragma mark - UIViewControllerAnimatedTransitioning

#pragma mark - required

//Tells your animator object to perform the transition animations.
//告知你的动画器对象要执行过渡动画
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
}

//Asks your animator object for the duration (in seconds) of the transition animation.
//询问你的动画器动画的时间长短
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 10;
}

#pragma mark - option

///// A conforming object implements this method if the transition it creates can
///// be interrupted. For example, it could return an instance of a
///// UIViewPropertyAnimator. It is expected that this method will return the same
///// instance for the life of a transition.
//- (id <UIViewImplicitlyAnimating>) interruptibleAnimatorForTransition:(id <UIViewControllerContextTransitioning>)transitionContext API_AVAILABLE(ios(10.0)) {
//    return nil;
//}

// This is a convenience and if implemented will be invoked by the system when the transition context's completeTransition: method is invoked.
//当过渡的上下文的completeTransition:方法完成后会调用
- (void)animationEnded:(BOOL) transitionCompleted {
    
}

@end
