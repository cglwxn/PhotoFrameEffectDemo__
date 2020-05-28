//
//  PhotoFrmeBackView.m
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/11/28.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import "PhotoFrmeBackView.h"

@implementation PhotoFrmeBackView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.allObjects[0];
//    NSLog(@"%s----%@",__func__,touch.view);
    UIView *responseView = self.subViewTouchFeedback == YES? touch.view:self;
    self.backViewTouchBeganHandler(touch.view);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.allObjects[0];
//    NSLog(@"%s----%@",__func__,touch.view);
    self.backViewTouchEndedHandler(touch.view);

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.allObjects[0];
//    NSLog(@"%s----%@",__func__,touch.view);
    self.backViewTouchMovedHandler(touch.view);
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.allObjects[0];
//    NSLog(@"%s----%@",__func__,touch.view);
    self.backViewTouchCancelleddHandler(touch.view);
}

@end
