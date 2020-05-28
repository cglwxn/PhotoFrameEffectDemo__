//
//  PhotoFrmeBackView.h
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/11/28.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhotoFrmeBackView;

typedef void(^PhotoBackViewTouchBeganHandler)(PhotoFrmeBackView * _Nullable  view);
typedef void(^PhotoBackViewTouchEndedHandler)(PhotoFrmeBackView * _Nullable  view);
typedef void(^PhotoBackViewTouchMovedHandler)(PhotoFrmeBackView * _Nullable  view);
typedef void(^PhotoBackViewTouchCancelleddHandler)(PhotoFrmeBackView * _Nullable  view);



NS_ASSUME_NONNULL_BEGIN

@interface PhotoFrmeBackView : UIView

@property (nonatomic, strong) PhotoBackViewTouchBeganHandler backViewTouchBeganHandler;
@property (nonatomic, strong) PhotoBackViewTouchEndedHandler backViewTouchEndedHandler;
@property (nonatomic, strong) PhotoBackViewTouchMovedHandler backViewTouchMovedHandler;
@property (nonatomic, strong) PhotoBackViewTouchCancelleddHandler backViewTouchCancelleddHandler;

/** 是否子视图响应而不是本view对点击作出反馈.默认是本view对点击作出反馈 */
@property (nonatomic, assign) BOOL subViewTouchFeedback;

@end

NS_ASSUME_NONNULL_END
