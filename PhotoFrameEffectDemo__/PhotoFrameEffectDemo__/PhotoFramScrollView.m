//
//  PhotoFramScrollView.m
//  PhotoFrameEffectDemo__
//
//  Created by Guanglei Cheng on 2019/10/29.
//  Copyright © 2019 Guanglei Cheng. All rights reserved.
//

#import "PhotoFramScrollView.h"
#import "PhotoFrameTableView.h"

@implementation PhotoFramScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer API_AVAILABLE(ios(7.0)) {
    if ([otherGestureRecognizer.view isKindOfClass:[PhotoFrameTableView class]]) {
        return YES;
    }
    return NO;
}

@end
