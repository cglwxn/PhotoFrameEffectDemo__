//
//  ViewControllerInteractiveTransitioningDelegate.h
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/11/27.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerInteractiveTransitioningDelegate : NSObject<UIViewControllerInteractiveTransitioning>

//代理选择实现的属性
@property(nonatomic, readonly) CGFloat completionSpeed;
@property(nonatomic, readonly) UIViewAnimationCurve completionCurve;

/// In 10.0, if an object conforming to UIViewControllerAnimatedTransitioning is
/// known to be interruptible, it is possible to start it as if it was not
/// interactive and then interrupt the transition and interact with it. In this
/// case, implement this method and return NO. If an interactor does not
/// implement this method, YES is assumed.
@property (nonatomic, readonly) BOOL wantsInteractiveStart API_AVAILABLE(ios(10.0));


@end

NS_ASSUME_NONNULL_END
